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

        new(:api_key => response["MCAPI"], :user_name => user_name)
      end
    end
  end
end
