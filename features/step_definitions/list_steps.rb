Given /^a list named "([^\"]*)"$/ do |name|
  assert_not_nil MonkeyParty::List.find_by_name(name)
end

When /^I attempt to subscribe "([^\"]*)" to the "([^\"]*)" list$/ do |email, list|
  @subscribers = MonkeyParty::List.find_by_name(list).create_subscribers(
    [{:email => email}])
end

