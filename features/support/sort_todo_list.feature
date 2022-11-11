Feature: Sort to-do list based on different features
    As a Colgate student
    So that I can prioritize the tasks with different features
    I want to sort my to-do list based on different features

Background: There already exists some to do tasks

    Given these Users:
        | email | password | 
        | user@colgate.edu | colgate13 | 

    Given these lists:
        | list_name | user_id |
        | List1 | 1 | 

    Given these tasks:
        | name | description | priority | category | due_at | completed | todo_list_id |
        | Take out the trash | Do it | 3 | Personal |  | false | 1 |
        | Finish math homework | Chapter 3, Sec. 5-10 | 2 | Work | | false| 1 |
        | Walk the dog | Gonna be fun | 1 | Personal | | false| 1 |

Scenario: Sort tasks by selected features

    Given I am logged in as "user@colgate.edu" with password "colgate13"
    Then  I should be on the index page
    And the current active list should be "List1"

    Given I am on the index page
    When I click "sort_by_priority"
    Then "Take out the trash" should appear before "Finish math homework" 
    And "Finish math homework" should appear before "Walk the dog"
    And "sort_by_priority" should be the currently active sorting function
    
    Given I am on the index page
    When I click "sort_by_category"
    Then "Take out the trash" should appear before "Finish math homework" 
    And "Walk the dog" should appear before "Finish math homework" 
    And "sort_by_category" should be the currently active sorting function
    
    Given I am on the index page
    When I click "sort_by_task"
    Then "Finish math homework" should appear before "Take out the trash" 
    And "Take out the trash" should appear before "Walk the dog"
    And "sort_by_task" should be the currently active sorting function

Scenario: Sorting function is maintained when other tasks are performed and user returns to index page
    Given I am logged in as "user@colgate.edu" with password "colgate13"
    Then  I should be on the index page
    And the current active list should be "List1"
    When I click "sort_by_category"
    Then "Take out the trash" should appear before "Finish math homework" 
    And "Walk the dog" should appear before "Finish math homework" 
    And "sort_by_category" should be the currently active sorting function
    When I click "sort_by_task"
    Then "Finish math homework" should appear before "Take out the trash" 
    And "Take out the trash" should appear before "Walk the dog"
    And "sort_by_task" should be the currently active sorting function

    When I press "Create Task"
    Then I should be on the create page of list "List1"
    When I press "Back"
    Then  I should be on the index page
    And the current active list should be "List1"
    And "sort_by_task" should be the currently active sorting function

    When I click "sort_by_category"
    Then "Take out the trash" should appear before "Finish math homework" 
    And "Walk the dog" should appear before "Finish math homework" 
    And "sort_by_category" should be the currently active sorting function
    When I click the "edit_task" button for the task "Take out the trash"
    Then I should be on the edit page for "Take out the trash" of list "List1"
    When I press "Back"
    Then  I should be on the index page
    And the current active list should be "List1"
    And "sort_by_category" should be the currently active sorting function


    