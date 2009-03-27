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
      "FAIL")
  rescue MonkeyParty::Error::AuthenticationError => @exception
  end
end

Then /^I should get an error$/ do
  assert_not_nil @exception
end

Then /^I should get an api key$/ do
  assert @account.keys.size == 1
end

Given /^I have logged in$/ do
  @mailchimp_user_name = configatron.mailchimp.user_name
  @mailchimp_password  = configatron.mailchimp.password

  @account = MonkeyParty::Account.login(@mailchimp_user_name,
    @mailchimp_password)
end

When /^I attempt to add an api key$/ do
  @additional_api_key = @account.add_api_key
end

Then /^I should be successful$/ do
  assert @account.keys.include?(@additional_api_key) 
end

