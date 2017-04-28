Feature: Viewing home page
  
  # Cannot test button text, only link text
  Scenario: Viewing home page
    Given I am logged in as user
    And I am on Home page
    Then I should see the text "Email Archive"
    And I should see the text "Author"
    And I should see the text "Subject"
    And I should see the text "Content"
    And I should see the text "Email archive updates every hour. Emails do not contain attachments."
    And I should see the text "Go to Home"
    And I should see the text "Edit registration"
    And I should see the text "Logout"