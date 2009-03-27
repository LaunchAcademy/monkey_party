module MonkeyParty
  class Account < Base
    attr_accessor :user_name, :api_key, :password, :extra_keys
    
    def initialize(attrs = {})
      super
      self.extra_keys ||= []
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

        account.api_key = response
        account.user_name = user_name
        account.password = password
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

      self.extra_keys << response
      response
    end
  end
end
