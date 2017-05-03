Feature: Viewing messages page
  
  # Cannot test button text, only link text
  Scenario: Viewing messages page
    Given I am logged in as user
    And I am on messages page
    Then I should see the text "E-Mails"
    And I should see the text "Home"
    And I should see the text "Email archive updates every hour. Emails do not contain attachments."
    And I should see the text "Go to Home"
    And I should see the text "Edit registration"
    And I should see the text "Logout"