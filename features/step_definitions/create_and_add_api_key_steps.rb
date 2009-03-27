Given /^I have a valid mailchimp account$/ do
  assert_not_nil configatron.mailchimp.user_name
  assert_not_nil configatron.mailchimp.password

  @mailchimp_user_name = configatron.mailchimp.user_name
  @mailchimp_password  = configatron.mailchimp.password
end

When /^I attempt to login with the proper credentials$/ do
  @account = MonkeyParty::Account.login(@mailchimp_user_name, 
    @mailchimp_password)
end

When /^I attempt to login with incorrect credentials$/ do
  begin
    @account = MonkeyParty::Account.login(@mailchimp_user_name,
      @mailchimp_password + "FAIL")
  rescue Exception => @error
  end
end

Then /^I should get an error$/ do
  assert_not_nil @error
  assert_kind_of MonkeyParty::Error::AuthenticationError, @error
end

Then /^I should get an api key$/ do
  assert_not_nil @account.api_key
end






