Feature: User can edit todo entries
As a Colgate student,
So that I can change my todo list to reflect changes in my schedule,
I want to edit todo entries to reflect new information

Background: There already exists a task that can be completed
    Given these tasks:
        | name | description | priority | category | due_at | completed |
        | Take out the trash | Do it | 3 | Personal | | false|

Scenario: Edit a task
    Given I am on the index page
    Then "Take out the trash" should be an active task
    When I click the "edit_task" button for the task "Take out the trash"
    Then I should be on the edit page for "Take out the trash"
    When I fill in the following:
        | Field | Value |
        | Name | TestName |
        | Description | yup, this is a test |
    And I press "Save Changes"
    Then I should be on the index page
    Then the task "TestName" should exist
    Then "TestName" should be an active task
    And the task "Take out the trash" should not exist