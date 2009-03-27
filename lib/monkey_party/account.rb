module MonkeyParty
  class Account < Base
    attr_accessor :user_name, :password, :keys
    
    def initialize(attrs = {})
      self.keys ||= []
      self.keys << attrs.delete(:api_key) if attrs[:api_key]
      super
    end

    def api_key
      self.keys[0]
    end

    class << self
      def login(user_name, password)
        response = get("", :query => {
          :method   => "login", 
          :username => user_name, 
          :password => password
        })

        account = new
        
        raise MonkeyParty::Error::AuthenticationError if response.is_a?(Array)

        account.keys << response
        account.user_name = user_name
        account.password = password

        #set a global api key
        configatron.mailchimp.api_key = response

        account
      end
    end

    def add_api_key
      response = self.class.get("", :query => {
        :method   => "apikeyAdd",
        :username => self.user_name,
        :password => self.password,
        :apikey   => self.api_key
      })

      raise MonkeyParty::Error::AuthenticationError if response.is_a?(Array)

      self.keys << response
      response
    end
  end
end
