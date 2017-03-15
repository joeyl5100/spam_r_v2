Feature: Create new account
  
  Scenario: Accessing New Account page
    Given I am on Login page
    When I follow "Sign up"
    Then I go to Register page
    
    #####FIX
  Scenario: Entering in information
    Given I am on Register page
    When I fill in "Email" with "Uuser@grinnell.edu"
    And I fill in "Password" with "Upassword"
    And I fill in "Password confirmation" with "Upassword"
    And I follow "Sign up"
    Then User is sent to Login page
    #ADD OBJECT TO TEST IF EMAIL CONFIRMAITON WAS SENT
    
  Scenario: Resending confirmation email
    Given I am on Register page
    When I follow "Didn't receive confirmation instructions?"
    And I go to Resend Confirmation page
    
  #NOT NEEDED?
  Scenario: Canceling new account
    Given User is on "New Account Page"
    When User clicks "Cancel"
    Then User is sent to "Login Page"