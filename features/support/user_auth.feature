Feature: User can log in with email and password
    As a user
    So that my information can only be seen by me, and I only see the information relevant to me
    I want to log in with a personal identification

Background: There already exists a user account that can be logged in to

    Given these Users:
        | email | password | 
        | user@colgate.edu | colgate13 | 

    Given these lists:
        | list_name | user_id |
        | List1 | 1 | 

    Given these tasks:
        | name | description | priority | category | due_at | completed | todo_list_id |
        | Take out the trash | Do it | 3 | Personal | | false| 1 | 

Scenario: Signing Up 
    When I register as "user1@colgate.edu" with password "colgate13"
    Then I should be on the index page
    And the current active list should be "Default List"
    And the current user should be "user1@colgate.edu"
    And the task "Take out the trash" should not exist

Scenario: Logging In
    When I login as "user@colgate.edu" with password "colgate13"
    Then I should be on the index page
    And the current active list should be "List1"
    And the current user should be "user@colgate.edu"
    And the task "Take out the trash" should exist

Scenario: Logging Out
    When I login as "user@colgate.edu" with password "colgate13"
    Then I should be on the index page
    And the current active list should be "List1"
    And the current user should be "user@colgate.edu"
    And the task "Take out the trash" should exist
    When I press "Logout"
    Then I should be on the sign-in page

Scenario: Singing In -> Logging Out -> Signing in with different account -> todo lists should be seperate for different users
    When I register as "user1@colgate.edu" with password "colgate13"
    Then I should be on the index page
    And the current active list should be "Default List"
    And the current user should be "user1@colgate.edu"
    And the task "Take out the trash" should not exist
    
    When I press "Logout"
    Then I should be on the sign-in page
    When I login as "user@colgate.edu" with password "colgate13"
    Then I should be on the index page
    And the current active list should be "List1"
    And the current user should be "user@colgate.edu"
    And the task "Take out the trash" should exist


