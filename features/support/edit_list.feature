Feature: Edit Todo List
    As a user
    so that I can change my todo list to reflect changes to a project
    I want to be able to edit ToDo list metadata

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

Scenario: User can edit a todo list name
    Given I am logged in as "user@colgate.edu" with password "colgate13"    
    Then  I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"

    When I press "Edit"
    Then I should be on the edit page for the list "List1"
    When I fill in the following:
    | Field | Value |
    | List name | TestList |
    And I press "Save Changes"

    Then  I should be on the index page
    And the list "List1" should not exist
    And the list "List2" should exist
    And the list "TestList" should exist
    And the current active list should be "TestList"

Scenario: User should receive appropriate feedback for failure to edit a list
    Given I am logged in as "user@colgate.edu" with password "colgate13"    
    Then  I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"

    When I press "Edit"
    Then I should be on the edit page for the list "List1"
    When I fill in the following:
    | Field | Value |
    | List name | |
    And I press "Save Changes"

    Then I should be on the edit page for the list "List1"
    And I should see "List: List1 : could not be updated. Please check your arguments!"

