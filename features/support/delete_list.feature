Feature: Delete Todo List
    As a user,
    So I can close projects that are finished
    I want to be able to delete old to-do lists

Background: There already exist multiple lists for the same user, with one differently-named task each

    Given these Users:
        | email | password | 
        | user@colgate.edu | colgate13 | 

    Given these lists:
        | list_name | user_id |
        | List1 | 1 | 
        | List2 | 1 | 

    Given these tasks:
        | name | description | priority | category | due_at | completed | todo_list_id |
        | Take out the trash | Do it | 3 | Personal | | false| 1 | 
        | Walk the dog | Do it | 3 | Personal | | false| 2 |

Scenario: User can delete an active Todo list
    Given I am logged in as "user@colgate.edu" with password "colgate13"    
    Then  I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"

    When I press "Delete"
    Then I should be on the index page
    And the list "List1" should not exist
    And the list "List2" should exist
    And the current active list should be "List2"

Scenario: If a user deletes the last existing todo list, a new default list should automatically be provided
    Given I am logged in as "user@colgate.edu" with password "colgate13"        
    Then  I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"

    When I press "Delete"
    Then I should be on the index page
    And the list "List1" should not exist
    And the list "List2" should exist
    And the current active list should be "List2"

    When I press "Delete"
    Then I should be on the index page
    And the list "Default List" should exist
    And the list "List2" should not exist
    And the current active list should be "Default List"