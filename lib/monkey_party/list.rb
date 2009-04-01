module MonkeyParty
  class List < Base
    include HappyMapper
    tag "struct"

    element :id, String
    element :web_id, String
    element :name, String
    element :date_created, Time
    element :member_count, Integer

    def create_subscribers(array_of_subscribers, options = {})
      options[:double_optin]      ||= true
      options[:update_existing]   ||= false
      options[:replace_interests] ||= true
      
      batch_hash = {}
      index = 0
      array_of_subscribers.each do |s|
        batch_hash["batch[#{index}]"] = s.to_mailchimp_hash
        index += 1
      end

      response = self.class.get("", :query => {
         :apikey            => self.class.api_key,
         :id                => self.id,
         :method            => "listBatchSubscribe",
      }.merge(options).merge(batch_hash))

      #response[1] is the error count
      if !response["MCAPI"].nil? && response["MCAPI"][1] > 0
        attach_errors_to_subscribers(array_of_subscribers, response.body)
      end

      array_of_subscribers
    end

    def destroy_subscribers(array_of_unsubscribers, options = {})
      options[:delete_member] ||= false
      options[:send_goodbye]  ||= true
      options[:send_notify]   ||= false

      batch_hash = {}
      index = 0
      array_of_unsubscribers.each do |s|
        batch_hash["emails[#{index}]"] = s.email
      end

      response = self.class.get("", :query => {
        :apikey => self.class.api_key,
        :id => self.id,
        :method => "listBatchUnsubscribe"
      }.merge(options).merge(batch_hash))

      if !response["MCAPI"].nil? && response["MCAPI"][1] > 0
        attach_errors_to_subscribers(array_of_unsubscribers, response.body)
      end

      array_of_unsubscribers
    end

    class << self
      def all
        response = get("", :query => {
          :apikey => api_key,
          :method => "lists"
        })
      
        parse(response.body)
      end

      def find_by_name(name)
        all.each do |list|
          return list if list.name.downcase == name.downcase
        end

        return nil
      end
    end

    private
    def attach_errors_to_subscribers(subscribers, response)
        #parse errors and update subscriber 
        error_nodes = XML::Parser.string(response).parse.root.find("/MCAPI/errors/struct")
        error_nodes.each do |n|
          subscribers[n.attributes["key"].to_i].error = 
            MonkeyParty::Error.new(:message => n.find_first("message").content, 
              :code => n.find_first("code").content)
        end
    end
  end
end
