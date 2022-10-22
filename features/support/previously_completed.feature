Feature: Reactivate tasks
    As a user
    So that I can reopen previously completed tasks
    I want to be able to reactivate previously completed tasks on the main page

Background: There already exists a completed task
    Given these tasks:
        |name|description|priority|category|due_at|completed|
        | Wash the dishes | Do it | 3 | Personal | | true |
        
Scenario: Reactivate a task
    Given I am on the index page
    Then "Wash the dishes" should be a completed task
    When I click the "undo_complete_task" button for the task "Wash the dishes"
    Then I should be on the index page
    And "Wash the dishes" should be an active task
    And "Wash the dishes" should not be a completed task