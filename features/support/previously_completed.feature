Feature: Reactivate tasks
    As a user
    So that I can reopen previously completed tasks
    I want to be able to reactivate previously completed tasks on the main page

Background: There already exists a task that can be reactivated

    Given these Users:
        | email | password | 
        | user@colgate.edu | colgate13 | 

    Given these lists:
        | list_name | user_id |
        | List1 | 1 | 

    Given these tasks:
        | name | description | priority | category | due_at | completed | todo_list_id |
        | Wash the dishes | Do it | 3 | Personal | | true | 1 | 
        
Scenario: Reactivate a task
    Given I am logged in as "user@colgate.edu" with password "colgate13"
    Then  I should be on the index page
    And the current active list should be "List1"
    Then "Wash the dishes" should be a completed task
    When I click the "undo_complete_task" button for the task "Wash the dishes"
    Then I should be on the index page
    And the current active list should be "List1"
    And "Wash the dishes" should be an active task
    And "Wash the dishes" should not be a completed task