Feature: Create new account
  
  Scenario: Accessing New Account page
    Given I am on Login page
    When I follow "Sign up"
    Then I go to Sign up page
    
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