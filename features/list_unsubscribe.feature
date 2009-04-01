Feature: Unsubscription from a list
In order to comply with policies 
And to provide a pleasurable experience for users
As a developer
I want to unsubscribe given email addresses from a list

Scenario: Email unsubscription
  Given I have a valid mailchimp account
  And a list named "Testing"
  And I have logged in
  And "user@example.com" is a subscriber to the "Testing" list
  When I attempt to unsubscribe "user@example.com" to the "Testing" list
  Then the unsubscription should submit successfully

