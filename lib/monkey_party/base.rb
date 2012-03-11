module MonkeyParty
  class Base
    include HTTParty
    base_uri 'http://api.mailchimp.com/1.2/'
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
        configatron.mailchimp.api_key
      end

    end
  end
end
