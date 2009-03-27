Given /^I have a valid mailchimp account$/ do
  assert !@mailchimp_user.nil?
  assert !@mailchimp_password.nil?
end

