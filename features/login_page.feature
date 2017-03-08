Feature: Log into account
  
Given following users exist:
  |    email                    |    password    |    passwordConfirmation    |    email    |
  |    Uuser@grinnell.edu       |    Upassword   |    Upassword               |    user@email.com   |
  |    Auser@grinnell.edu       |    Apassword   |    Apassword               |             |
  
  Scenario: View login page
    Given I am not logged in
    When I go to Login page
    Then I go to "Login" page

  Scenario: Logging in with an existing user account
    Given I am on Login page
    When I fill in "Email" with "Uuser@grinnell.edu"
    And I fill in "Password" with "Upassword"
    And I press "Log in"
    Then I go to Home page
    
  Scenario: Logging in with an existing admin account
    Given I am on Login page
    When I fill in "Email" with "Auser@grinnell.edu"
    And I fill in "Password" with "Apassword"
    And I press "Log in"
    Then I go to Home page

  Scenario: Logging in without an existing account
    Given I am on Login page
    When I follow "Sign up"
    Then I go to Register page
    
  Scenario: Logging in with incorrect username information
    Given User is on Login page
    When User fills in "Username" with "notuser"
    And User clicks "Sign In"
    Then User is sent to "Wrong Credentials Page"
    
  Scenario: Logging in with incorrect username information
    Given User is on Login page
    When User fills in "Password" with "notpassword"
    And User clicks "Sign In"
    Then User is sent to "Wrong Credentials Page"