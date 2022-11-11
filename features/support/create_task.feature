Feature: Add a to-do task to CGTD
  As a Colgate student,
  So that I can remind myself of an upcoming deadline for a task,
  I want to add a task to my CGTD todo list

Background: There already exists a task that can be completed

    Given these Users:
        | email | password | 
        | user@colgate.edu | colgate13 | 

    Given these lists:
        | list_name | user_id |
        | List1 | 1 | 

Scenario: Create a task
  Given I am logged in as "user@colgate.edu" with password "colgate13"
  Then  I should be on the index page
  And the current active list should be "List1"
  When I press "Create Task"
  Then I should be on the create page of list "List1"
  When I fill in the following:
    | Field | Value |
    | Name | TestName |
    | Description | yup, this is a test |
  And I press "Create"
  Then I should be on the index page
  And the current active list should be "List1"
  Then the task "TestName" should exist
  Then "TestName" should be an active task