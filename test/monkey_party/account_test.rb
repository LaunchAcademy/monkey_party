require "test_helper"

class MonkeyParty::AccountTest < Test::Unit::TestCase
  context "successfully logging in" do
    setup do
      @user_name = "test_user"
      @password = "password"
      mock_response("method=login&username=#{@user_name}&password=#{@password}",
        "successful_login")
    end

    should "return an api key" do
      @account = MonkeyParty::Account.login(@user_name, @password)
      assert_not_nil @account.api_key
    end

    should "set the user_name"
  end

  context "adding an api key" do
    should "require a user name"
    should "require a password"
    should "require an api key"
  end
end
