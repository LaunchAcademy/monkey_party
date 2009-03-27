require "test_helper"

class MonkeyParty::AccountTest < Test::Unit::TestCase
  context "successfully logging in" do
    setup do
      mock_login_response(true)
      
      @account = MonkeyParty::Account.login(@user_name, @password)
    end

    should "return an api key" do
      assert_not_nil @account.api_key
    end

    should "set the user_name" do
      assert_not_nil @account.user_name
    end

    should "set the global api key" do
      assert_not_nil configatron.mailchimp.api_key
    end
  end

  context "logging in with invalid credentials" do
    setup do
      mock_login_response(false)

    end

    should "raise an error" do
      assert_raises MonkeyParty::Error::AuthenticationError do 
        MonkeyParty::Account.login(@user_name, @password)
      end
    end
  end

  context "adding an api key" do
    setup do
      @account = MonkeyParty::Account.new(
        :user_name => "test",
        :password  => "password",
        :api_key   => "api_key")
    end

    context "with proper credentials" do
      setup do
        mock_response("password=#{@account.password}&" +
          "apikey=#{@account.api_key}&method=apikeyAdd&" + 
          "output=xml&username=#{@account.user_name}",
          "successful_login")
      end

      should "return an api key" do
        response = @account.add_api_key
        assert_kind_of String, response
      end

      should "add the resulting api key to extra keys" do
        response = @account.add_api_key
        assert @account.keys.include?(response)
      end
    end

    context "with improper credentials" do
      setup do
       mock_response("password=#{@account.password}&" +
        "apikey=#{@account.api_key}&method=apikeyAdd&" + 
        "output=xml&username=#{@account.user_name}",
        "failed_login")
      end
      
      should "raise an error if I don't have the right credentials" do
        assert_raise MonkeyParty::Error::AuthenticationError do
          @account.add_api_key
        end
      end
    end
  end

  private
  def mock_login_response(successful = true)
    @user_name = "test_user"
    @password = "password"
      
    mock_response("method=login&username=#{@user_name}" + 
      "&password=#{@password}&output=xml",
    successful ? "successful_login" : "failed_login")

  end
end
