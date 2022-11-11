Feature: Create a new todo list
    As a user
    So that I can track tasks for a different project or context
    I want to be able to create a new separate ToDo list

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

Scenario: User can create a new todo list and switch to it
    Given I am logged in as "user@colgate.edu" with password "colgate13"    
    Then  I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"

    When I press "+ New"
    Then I should be on the create page for a new list
    When I fill in the following:
    | Field | Value |
    | List name | TestList |
    And I press "Create"
    Then  I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the list "TestList" should exist
    When I press "TestList"
    Then  I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the list "TestList" should exist
    And the current active list should be "TestList"
    And the current active list should be empty
     



