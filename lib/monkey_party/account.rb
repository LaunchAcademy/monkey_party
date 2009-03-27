module MonkeyParty
  class Account < Base
    attr_accessor :user_name, :api_key

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

        account
      end
    end
  end
end
