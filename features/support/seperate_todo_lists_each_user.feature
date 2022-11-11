Feature: User has their own Todo List
    As a user
    so that I can have my tasks organized privately
    I want to have my own todo list that no one else can access

Background: There already exists a user account that can be logged in to

    Given these Users:
        | email | password | 
        | user@colgate.edu | colgate13 | 
        | user2@colgate.edu | colgate26 | 

    Given these lists:
        | list_name | user_id |
        | User1List1 | 1 | 
        | User2List1 | 2 |
        | User2List2 | 2 |

    Given these tasks:
        | name | description | priority | category | due_at | completed | todo_list_id |
        | Take out the trash | Do it | 3 | Personal | | false| 1 | 
        | Walk the dog | Do it | 3 | Personal | | false| 2 |


Scenario: Singing In -> Logging Out -> Signing in with different account -> todo lists should be seperate for different users
    
    When I login as "user@colgate.edu" with password "colgate13"
    Then I should be on the index page
    And the list "User1List1" should exist
    And the current active list should be "User1List1"
    And the current user should be "user@colgate.edu"
    And the list "User2List1" should not exist
    And the task "Take out the trash" should exist
    And the task "Walk the dog" should not exist
    When I press "Logout"
    Then I should be on the sign-in page

    When I login as "user2@colgate.edu" with password "colgate26"
    Then I should be on the index page
    And the list "User2List1" should exist
    And the current active list should be "User2List1"
    And the current user should be "user2@colgate.edu"
    And the list "User1List1" should not exist
    And the list "User2List2" should exist
    And the task "Take out the trash" should not exist
    And the task "Walk the dog" should exist