Feature: Subscribe to a list
In order to send mass mailings in the future
As a developer
I want to subscribe given email addresses to a list
And I also want to potentially pass merge variables

Scenario: Email subscription
  Given I have a valid mailchimp account
  And a list named "Testing"
  And I have logged in
  When I attempt to subscribe "user@example.com" to the "Testing" list
  Then the subscription should submit successfully
