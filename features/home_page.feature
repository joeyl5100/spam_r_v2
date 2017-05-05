Feature: Viewing home page
  
  Scenario: Viewing home page
    Given I have a populated database
    And I am logged in as user
    And I am on Home page
    Then I should see the text "Email Archive"
    And I should see the text "Author"
    And I should see the text "Subject"
    And I should see the text "Content"
    And I should see the text "Talk"
    And I should see the text "CS Table"
    And I should see the text "Internship"
    And I should see the text "Job"
    And I should see the text "Off Campus"
    And I should see the text "Candidate"
    And I should see the text "Misc."
    And I should see the text "Email archive updates every hour. Emails do not contain attachments."
    And I should see the text "Go to Home"
    And I should see the text "Edit registration"
    And I should see the text "Logout"
  
  Scenario: Searching database via Talk tag
    Given I have a populated database
    And I am logged in as user
    And I am on Home page
    When I follow "Talk"
    Then I go to Talk Search page
    And I should see the text "Content1"
    And I should not see the text "Content2"
    
  Scenario: Searching database via CS Table tag
    Given I have a populated database
    And I am logged in as user
    And I am on Home page
    When I follow "CS Table"
    Then I go to CS Table Search page
    And I should see the text "Content2"
    And I should not see the text "Content3"
    
  Scenario: Searching database via Internship tag
    Given I have a populated database
    And I am logged in as user
    And I am on Home page
    When I follow "Internship"
    Then I go to Internship Search page
    And I should see the text "Content3"
    And I should not see the text "Content4"
    
  Scenario: Searching database via Job tag
    Given I have a populated database
    And I am logged in as user
    And I am on Home page
    When I follow "Job"
    Then I go to Job Search page
    And I should see the text "Content4"
    And I should not see the text "Content5"
    
  Scenario: Searching database via Off Campus tag
    Given I have a populated database
    And I am logged in as user
    And I am on Home page
    When I follow "Off Campus"
    Then I go to Off Campus Search page
    And I should see the text "Content5"
    And I should not see the text "Content6"
    
  Scenario: Searching database via Candidate tag
    Given I have a populated database
    And I am logged in as user
    And I am on Home page
    When I follow "Candidate"
    Then I go to Candidate Search page
    And I should see the text "Content6"
    And I should not see the text "Content7"
    
  Scenario: Searching database via Misc tag
    Given I have a populated database
    And I am logged in as user
    And I am on Home page
    When I follow "Misc."
    Then I go to Misc Search page
    And I should see the text "Content7"
    And I should not see the text "Content1"
    
  Scenario: Searching database via Author search bar
    Given I have a populated database
    And I am logged in as user
    And I am on Home page
    When I fill in "Author" with "example1"
    And I press "Search"
    Then I go to Example One Search page
    And I should see the text "Content1"
    And I should not see the text "Content2"
    
  Scenario: Searching database via Subject search bar
    Given I have a populated database
    And I am logged in as user
    And I am on Home page
    When I fill in "Subject" with "Example2"
    And I press "Search"
    Then I go to Example Two Search page
    And I should see the text "Content2"
    And I should not see the text "Content3"
    
  Scenario: Searching database via Content search bar
    Given I have a populated database
    And I am logged in as user
    And I am on Home page
    When I fill in "Content" with "Content3"
    And I press "Search"
    Then I go to Example Three Search page
    And I should see the text "Content3"
    And I should not see the text "Content4"
