Feature: Add a to-do task to CGTD
As a Colgate student,
So that I can remind myself of an upcoming deadline for a task,
I want to add a task to my CGTD todo list

Scenario: Create a task
    Given I am on the index page
    When I press "Create Task"
    Then I should be on the create page
    When I fill in the following:
      | Field | Value |
      | Name | TestName |
      | Description | yup, this is a test |
    
    And I press "Create"
    Then I should be on the index page
    Then the task "TestName" should exist
    Then "TestName" should be an active task