Feature: Create an api key
In order to interact with the MailChimp Service
As a developer
I want to login and generate an api key

  Scenario: Successful Login
    Given I have a valid mailchimp account
    When I attempt to login with the proper credentials
    Then I should get an api key

  Scenario: Failed Login
    When I attempt to login with incorrect credentials
    Then I should get an error

  Scenario: Add a key
    Given I have a valid mailchimp account
    And I have logged in
    When I attempt to add an api key
    Then I should be successful

  Scenario: Expire a key
    Given I have a valid mailchimp account
    And I have a valid api key
    When I attempt to expire the key
    Then I should be successful
