Feature: Delete todo entries
    As a user
    because I want to be able to remove a task without completing it
    I want to be able to delete a task by clicking on a delete button

Background: There already exists a task that can be deleted

    Given these Users:
        | email | password | 
        | user@colgate.edu | colgate13 | 

    Given these lists:
        | list_name | user_id |
        | List1 | 1 | 

    Given these tasks:
        | name | description | priority | category | due_at | completed | todo_list_id |
        | Take out the trash | Do it | 3 | Personal | | false| 1 | 

Scenario: Delete a task
    Given I am logged in as "user@colgate.edu" with password "colgate13"
    Then  I should be on the index page
    And the current active list should be "List1"
    Then "Take out the trash" should be an active task
    When I click the "delete_task" button for the task "Take out the trash"
    Then I should be on the index page
    And the current active list should be "List1"
    And the task "Take out the trash" should not exist