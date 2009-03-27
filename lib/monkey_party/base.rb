require "ruby-debug"
module MonkeyParty
  class Base
    include HTTParty
    base_uri 'http://api.mailchimp.com/1.1/'
    default_params :output => "xml"

    def initialize(attrs = {})
      attrs.each{ |key, value| self.send("#{key}=", value) }
    end

    class << self
      def get(path, options = {})
        #fix the format because Mail Chimp doesn't pass the proper header
        options[:format] = :xml
        super
      end
    end
  end
end
