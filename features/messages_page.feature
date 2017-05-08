Feature: Viewing messages page
  
  # Cannot test button text, only link text
  Scenario: Viewing Messages page
    Given I am logged in as user
    And I have a populated database
    And I am on Messages page
    Then I should see the text "E-Mails"
    And I should see /Show/ 10 times
    And I should see the text "Email archive updates every hour. Emails do not contain attachments."
    And I should see the text "Go to Home"
    And I should see the text "Edit registration"
    And I should see the text "Logout"
    When I follow "Go to Home"
    Then I go to Home page
    
  Scenario: Viewing page with incorrect tag
    Given I am on Faulty Tag page
    And I have a populated database
    And I am logged in as user
    Then I should see the text "OOPS!"
    And I should see the text "There are no results on this page."
    And I should see the text "Email archive updates every hour. Emails do not contain attachments."
    And I should see the text "Go to Home"
    And I should see the text "Edit registration"
    And I should see the text "Logout"
    When I follow "Home"
    Then I go to Home page
    
  Scenario: Viewing show page for particular email
    Given I have a populated database
    And I am logged in as user
    And I am on Show page
    And I should see /Back/ 1 times
    And I should see /Tags:/ 1 times
    And I should see "example1@grinnell.edu"
    And I should see "Example1"
    And I should see "Content1"
    And I should see "Talk"
    And I should see the text "Email archive updates every hour. Emails do not contain attachments."
    And I should see the text "Go to Home"
    And I should see the text "Edit registration"
    And I should see the text "Logout"
    When I follow "Back"
    Then I go to Second page
    
  Scenario: Viewing the second page of the archive
    Given I am on Second page
    And I have a populated database
    And I am logged in as user
    And I should see /Show/ 5 times
    And I should see "example1@grinnell.edu"
    And I should see "example5@grinnell.edu"
    And I should not see the text "example11@grinnell.edu"
    And I should see the text "Email archive updates every hour. Emails do not contain attachments."
    And I should see the text "Go to Home"
    And I should see the text "Edit registration"
    And I should see the text "Logout"
    When I follow "1"
    Then I go to First page