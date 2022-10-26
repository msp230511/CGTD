Feature: View to do list
    As a user
    So that I can get an overview of the tasks that I have to complete
    I want to be able to view all existing tasks in a todo list

Background: There already exists some to do tasks
    Given these tasks:
        | name | description | priority | category | due_at | completed |
        | Take out the trash | Do it | 3 | Personal | | false|
        | Do laundry | Do all laundry by tonight | 2 | Personal | | false|
        | Finish math homework | Chapter 3, Sec. 5-10 | 3 | Work | | false|
        | Learn how to do a backflip | Seriously! | 1 | Personal | | false|

Scenario: View the task
    Given I am on the index page
    Then "Do laundry" should be an active task
    
