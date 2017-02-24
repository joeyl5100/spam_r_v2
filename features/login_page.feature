Feature: Log into account
  
Given following users exist:
  |    username    |    password    |    passwordConfirmation    |    email    |
  |    Uuser       |    Upassword   |    Upassword               |    user@email.com   |
  
  Scenario: View login page
    When User accesses the webpage
    Then User sees "Login" page

  Scenario: Logging in with an existing user account
    Given User is on Login page
    When User fills in "Username" with "Uuser"
    And User fills in "Password" with "Upassword"
    And User clicks "Sign In"
    Then User is sent to "User Home Page"
    
  Scenario: Logging in with an existing admin account
    Given Admin is on Login page
    When Admin fills in "Username" with "Auser"
    And Admin fills in "Password" with "Apassword"
    And Admin clicks "Sign In"
    Then Admin is sent to "Admin Home Page"

  Scenario: Logging in without an existing account
    Given User is on Login page
    When User clicks "New Account"
    Then User is sent to "Register New User"
    
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