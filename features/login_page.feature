Feature: Log into account
  
Given following users exist:
  |    email                    |    password    |    passwordConfirmation    |    email    |
  |    Uuser@grinnell.edu       |    Upassword   |    Upassword               |    user@email.com   |
  
  Scenario: View login page
    Given I am not logged in
    When I go to "Home" page
    Then I go to "Login" page

  Scenario: Logging in with an existing user account
    Given I am on Login page
    When I fill in "email" with "Uuser@grinnell.edu"
    And I fill in "password" with "Upassword"
    And I click "Log in"
    Then I am sent to "Home" page
    
  Scenario: Logging in with an existing admin account
    Given Admin is on Login page
    When Admin fills in "Username" with "Auser"
    And Admin fills in "Password" with "Apassword"
    And Admin clicks "Sign In"
    Then Admin is sent to "Admin Home Page"

  Scenario: Logging in without an existing account
    Given I am on Login page
    When I click "New Account"
    Then I am sent to "Register New User"
    
  Scenario: Logging in with incorrect username information
    Given I am on Login page
    When I fill in "Username" with "notuser"
    And I click "Sign In"
    Then I am sent to "Wrong Credentials Page"
    
  Scenario: Logging in with incorrect username information
    Given I am on Login page
    When I fill in "Password" with "notpassword"
    And I click "Sign In"
    Then I am sent to "Wrong Credentials Page"