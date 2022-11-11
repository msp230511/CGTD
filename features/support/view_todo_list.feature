Feature: View to do list
    As a user
    So that I can get an overview of the tasks that I have to complete
    I want to be able to view all existing tasks in a todo list

Background: There already exists some to do tasks

    Given these Users:
        | email | password | 
        | user@colgate.edu | colgate13 | 

    Given these lists:
        | list_name | user_id |
        | List1 | 1 | 

    Given these tasks:
        | name | description | priority | category | due_at | completed | todo_list_id |
        | Take out the trash | Do it | 3 | Personal | | false| 1 | 
        | Take out the trash | Do it | 3 | Personal | | false| 1 |
        | Do laundry | Do all laundry by tonight | 2 | Personal | | false| 1 |
        | Finish math homework | Chapter 3, Sec. 5-10 | 3 | Work | | false| 1 |
        | Learn how to do a backflip | Seriously! | 1 | Personal | | false| 1 |

Scenario: View the task
    Given I am logged in as "user@colgate.edu" with password "colgate13"
    Then  I should be on the index page
    And the current active list should be "List1"
    Then "Do laundry" should be an active task
    Then "Take out the trash" should be an active task
    Then "Finish math homework" should be an active task
    Then "Learn how to do a backflip" should be an active task