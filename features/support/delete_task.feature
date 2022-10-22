Feature: Delete todo entries
    As a user
    because I want to be able to remove a task without completing it
    I want to be able to delete a task by clicking on a delete button

Background: There already exists a task that can be completed
    Given these tasks:
        | name | description | priority | category | due_at | completed |
        | Take out the trash | Do it | 3 | Personal | | false|

Scenario: Delete a task
    Given I am on the index page
    Then "Take out the trash" should be an active task
    When I click the "delete_task" button for the task "Take out the trash"
    Then I should be on the index page
    And the task "Take out the trash" should not exist