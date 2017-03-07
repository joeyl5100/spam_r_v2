Feature: Log into account
  
Given following users exist:
  |    email                    |    password    |    passwordConfirmation    |    email    |
  |    Uuser@grinnell.edu       |    Upassword   |    Upassword               |    user@email.com   |
  
  Scenario: View login page
    Given I am not logged in
    When I go to "Home" page
    Then I go to "Login" page
    #And I see sign in message

  Scenario: Logging in with an existing user account
    Given I am on Login page
    When I fill in "Email" with "Uuser@grinnell.edu"
    And I fill in "Password" with "Upassword"
    And I press "Log in"
    Then I go to "Home" page
    
  Scenario: Logging in with an existing admin account
    Given I am on Login page
    When I fill in "Email" with "Auser@grinnell.edu"
    And I fill in "Password" with "Apassword"
    And I press "Log in"
    Then I go to "Admin Home Page"

  Scenario: Logging in without an existing account
    Given I am on Login page
    When I follow "Sign up"
    Then I go to "Register New User"
    
  Scenario: Logging in with incorrect username information
    Given I am on Login page
    When I fill in "Email" with "notuser@grinnell.edu"
    And I press "Log in"
    Then I go to "Login" page
    #And I see invalid error message
    
  Scenario: Logging in with incorrect username information
    Given I am on Login page
    When I fill in "Password" with "notpassword"
    And I press "Log in"
    Then I go to "Login" page
    #And I see invalid error message