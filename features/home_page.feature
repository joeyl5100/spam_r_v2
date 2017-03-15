Feature: Viewing home page
  
  Scenario: Viewing home page
    Given I am on Home page
    When User views webpage content
    Then User sees 25 most recent emails
    
  Scenario: Clicking on link
    Given I am on Home page
    When User clicks "View" of "Post 1"
    Then User is sent to "Post 1" page
    
  Scenario: Clicking on new link
    Given I am on Home page
    When User clicks "View" of "Title"
    Then User is sent to "Title" page