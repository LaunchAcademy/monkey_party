module MonkeyParty
  class Base
    include HTTParty
    base_uri 'http://api.mailchimp.com/1.1/'
    default_params :output => "xml"

    def initialize(attrs = {})
      attrs.each{ |key, value| self.send("#{key}=", value) }
    end
  end
end
