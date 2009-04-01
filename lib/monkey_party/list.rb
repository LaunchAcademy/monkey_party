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
         :double_optin      => options[:dobule_optin],
         :update_existing   => options[:update_existing],
         :replace_interests => options[:replace_interests]
      }.merge(batch_hash))

      #response[1] is the error count
      if !response["MCAPI"].nil? && response["MCAPI"][1] > 0
        #parse errors and update subscriber 
        error_nodes = XML::Parser.string(response.body).parse.root.find("/MCAPI/errors/struct")
        error_nodes.each do |n|
          array_of_subscribers[n.attributes["key"].to_i].error = 
            MonkeyParty::Error.new(:message => n.find_first("message").content, 
              :code => n.find_first("code").content)
        end

      end
      array_of_subscribers
    end

    def destroy_subscribers(array_of_subscribers, options = {})
      
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
  end
end
