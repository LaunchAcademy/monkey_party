require "test_helper"

class MonkeyParty::AccountTest < Test::Unit::TestCase
  context "successfully logging in" do
    setup do
      @user_name = "test_user"
      @password = "password"
      mock_response("method=login&username=#{@user_name}&password=#{@password}",
        "successful_login")

      @account = MonkeyParty::Account.login(@user_name, @password)
    end

    should "return an api key" do
      assert_not_nil @account.api_key
    end

    should "set the user_name" do
      assert_not_nil @account.user_name
    end
  end

  context "adding an api key" do
    should "require a user name" do

    end
    
    should "require a password" do

    end

    should "require an api key" do

    end
  end
end
