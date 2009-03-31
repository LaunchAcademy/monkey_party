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
        batch_hash["batch[#{index}]"] = s
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
      if response[1] > 0

      end
      array_of_subscribers
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
