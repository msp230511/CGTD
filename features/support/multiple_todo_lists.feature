Feature: Multiple ToDo lists per user
    As a user
    So that I can track different Projects
    I want to switch between multiple separate to-do lists

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

Scenario: User has multiple todo lists and can switch between them
    Given I am logged in as "user@colgate.edu" with password "colgate13"    
    Then  I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"

    When I press "List2"
    Then I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List2"

Scenario: User has multiple todo lists and tasks are seperate between todo lists
    Given I am logged in as "user@colgate.edu" with password "colgate13"    
    Then  I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"
    And the task "Take out the trash" should exist
    And the task "Walk the dog" should not exist
    

    When I press "List2"
    Then I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List2"
    And the task "Take out the trash" should not exist
    And the task "Walk the dog" should exist

Scenario: Completing a task on one todo list does not affect another todo list
    Given I am logged in as "user@colgate.edu" with password "colgate13"    
    Then  I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"
    And the task "Take out the trash" should exist
    And the task "Walk the dog" should not exist
    Then "Take out the trash" should be an active task
    When I click the "complete_task" button for the task "Take out the trash"
    Then I should be on the index page
    And the current active list should be "List1"
    And "Take out the trash" should be a completed task
    And "Take out the trash" should not be an active task
    

    When I press "List2"
    Then I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List2"
    And the task "Take out the trash" should not exist
    And the task "Walk the dog" should exist

Scenario: Creating a task on one todo list does not affect another todo list
    Given I am logged in as "user@colgate.edu" with password "colgate13"    
    Then  I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
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
    And "TestName" should be an active task

    When I press "List2"
    Then I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List2"
    And the task "TestName" should not exist


Scenario: Editing a task on one todo list does not affect another todo list
    Given I am logged in as "user@colgate.edu" with password "colgate13"    
    Then  I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"

    Then "Take out the trash" should be an active task
    When I click the "edit_task" button for the task "Take out the trash"
    Then I should be on the edit page for "Take out the trash" of list "List1"
    When I fill in the following:
        | Field | Value |
        | Name | TestName |
        | Description | yup, this is a test |
    And I press "Save Changes"
    Then I should be on the index page
    And the current active list should be "List1"
    Then the task "TestName" should exist
    And "TestName" should be an active task
    And the task "Take out the trash" should not exist

    When I press "List2"
    Then I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List2"
    And the task "TestName" should not exist

Scenario:  Deleting a task on one todo list does not affect the another todo list

    # Log in and verify the task exists
    Given I am logged in as "user@colgate.edu" with password "colgate13"
    Then  I should be on the index page
    And the current active list should be "List1"
    Then the task "Take out the trash" should exist
    Then "Take out the trash" should be an active task

    # Create the same task in list 2
    When I press "List2"
    Then I should be on the index page
    And the current active list should be "List2"
    When I press "Create Task"
    Then I should be on the create page of list "List2"
    When I fill in the following:
        | Field | Value |
        | Name | Take out the trash |
        | Description | yup, this is a test |
    And I press "Create"
    Then I should be on the index page
    And the current active list should be "List2"
    Then the task "Take out the trash" should exist
    And "Take out the trash" should be an active task

    # Delete the task on list 1
    When I press "List1"
    Then I should be on the index page
    And the current active list should be "List1"
    When I click the "delete_task" button for the task "Take out the trash"
    Then I should be on the index page
    And the current active list should be "List1"
    And the task "Take out the trash" should not exist

    # The task should still exist on list 2
    When I press "List2"
    Then I should be on the index page
    And the current active list should be "List2"
    Then the task "Take out the trash" should exist
    And "Take out the trash" should be an active task
