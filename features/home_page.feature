Feature: Viewing home page
  
  Scenario: Viewing home page
    Given I am on Home page
    Then I see 25 most recent emails
    
  Scenario: Clicking on link
    Given I am on Home page
    When I press "View" of "Post 1"
    Then I go to "Post 1" page
    
  Scenario: Clicking on new link
    Given I am on Home page
    When I press "View" of "Title"
    Then I go to "Title" page