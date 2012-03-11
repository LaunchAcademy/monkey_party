module MonkeyParty
  class Base
    include HTTParty
    default_params :output => "xml"

    def initialize(attrs = {})
      attrs.each{ |key, value| self.send("#{key}=", value) }
    end

    class << self  
      def get(path, options = {})
        #fix the format because Mail Chimp doesn't pass the proper header
        options[:format] = :xml
        result = super
        
        if result.body =~ /<error /i
          raise MonkeyParty::Error.parse(result.body)
        end
        result
      end

      def api_key
        MonkeyParty.api_key
      end

      def default_options
        {
          :base_uri => "http://#{MonkeyParty.data_center}.api.mailchimp.com/1.2"
        }
      end
    end
  end
end

