Feature: Complete tasks
    As a user
    so that I can track which tasks are complete
    I want to be able to assign a task a completed status, removing it from the view of active tasks

Background: There already exists a task that can be completed
    Given these tasks:
        | name | description | priority | category | due_at | completed |
        | Take out the trash | Do it | 3 | Personal | | false|
    
Scenario: Complete a task
    Given I am on the index page
    Then "Take out the trash" should be an active task
    When I click the "complete_task" button for the task "Take out the trash"
    Then I should be on the index page
    And "Take out the trash" should be a completed task
    And "Take out the trash" should not be an active task