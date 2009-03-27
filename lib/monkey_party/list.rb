module MonkeyParty
  class List < Base
    include HappyMapper
    tag "struct"

    element :id, String
    element :web_id, String
    element :name, String
    element :date_created, Time
    element :member_count, Integer

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
          return list if list.name.downcase = name.downcase
        end

        return nil
      end
    end
  end
end
