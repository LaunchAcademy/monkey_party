Given /^"([^\"]*)" is a subscriber to the "([^\"]*)" list$/ do |email, list|
  @list = MonkeyParty::List.find_by_name(list)
  @subscriber = MonkeyParty::Subscriber.new(email)
  @subscriber = @list.create_subscribers([@subscriber], 
    :update_existing => true)[0]
  assert @subscriber.valid?
end

When /^I attempt to unsubscribe "([^\"]*)" from the "([^\"]*)" list$/ do |email, list|
  @subscriber = @list.destroy_subscribers([@subscriber])[0]
end

Then /^the unsubscription should submit successfully$/ do
  assert @subscriber.valid?
end

