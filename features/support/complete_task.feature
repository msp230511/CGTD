Feature: Complete tasks
    As a user
    so that I can track which tasks are complete
    I want to be able to assign a task a completed status, removing it from the view of active tasks

Background: There already exists a task that can be completed

    Given these Users:
        | email | password | 
        | user@colgate.edu | colgate13 | 

    Given these lists:
        | list_name | user_id |
        | List1 | 1 | 

    Given these tasks:
        | name | description | priority | category | due_at | completed | todo_list_id |
        | Take out the trash | Do it | 3 | Personal | | false| 1 | 

Scenario: Complete a task
    Given I am logged in as "user@colgate.edu" with password "colgate13"
    Then  I should be on the index page
    And the current active list should be "List1"
    Then "Take out the trash" should be an active task
    When I click the "complete_task" button for the task "Take out the trash"
    Then I should be on the index page
    And the current active list should be "List1"
    And "Take out the trash" should be a completed task
    And "Take out the trash" should not be an active task