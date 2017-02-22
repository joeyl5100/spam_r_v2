Feature: Create new account
  
  Scenario: Accessing New Account page
    Given User is on "Login Page"
    When User clicks "Create New Account"
    Then User is sent to "New Account Page"
    
    #####FIX
  Scenario: Entering in information
    Given User is on "New Account Page"
    When User fills in "Username" with "Uuser"
    And User fills in "Password" with "Upassword"
    #...
    And User clicks "Create Account"
    Then User is sent to confirmation/success page
    
  Scenario: Canceling new account
    Given User is on "New Account Page"
    When User clicks "Cancel"
    Then User is sent to "Login Page"