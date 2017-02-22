Feature: Adding a post

 Scenario: Going to add a post page
    Given Admin is on "Admin Home Page"
    When Admin clicks on "Add Post"
    Then Admin is sent to "Add New Post Page"
    
  Scenario: Adding a post
    Given Admin is on "Add New Post Page"
    When Admiin fills in "Post Title" with "Title"
    And Admin fills in "Post Content" with "contenttttt"
    And Admin clicks on "Submit Post"
    Then Admin is sent to "Added Post Successful Page"