Feature: Create new account
  
  Scenario: Accessing New Account page
    Given I am on Login page
    When I press "Log in"
    Then I go to Register page
    
  Scenario: Entering in information
    Given I am on Register page
    When I fill in "Email" with "Uuser@grinnell.edu"
    And I fill in "Password" with "Upassword"
    And I fill in "Password confirmation" with "Upassword"
    And I press "Sign up"
    Then I go to Login page
    
  Scenario: Resending confirmation email
    Given I am on Register page
    When I follow "Didn't receive confirmation instructions?"
    And I go to Resend Confirmation page