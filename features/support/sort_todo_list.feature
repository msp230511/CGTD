Feature: Sort to-do list based on different features
    As a Colgate student
    So that I can prioritize the tasks with different features
    I want to sort my to-do list based on different features

Background: There already exists some to do tasks
    Given these tasks:
        | name | description | priority | category | due_at | completed |
        | Take out the trash | Do it | 3 | Personal | Time.now.advance(days: 2) | false|
        | Finish math homework | Chapter 3, Sec. 5-10 | 2 | Work | Time.now.advance(days: 5) | false|
        | Walk the dog | Gonna be fun | 1 | Personal | Time.now.advance(days: 1) | false|

Scenario: Sort tasks by selected features

    # Given I am on the index page
    # When I click "due_date_active"
    # Then  "Walk the dog" should appear before "Take out the trash" 
    # And "Take out the trash" should appear before "Finish math homework"

    Given I am on the index page
    When I click "priority_active"
    Then "Take out the trash" should appear before "Finish math homework" 
    And "Finish math homework" should appear before "Walk the dog"
    
    Given I am on the index page
    When I click "category_active"
    Then "Take out the trash" should appear before "Finish math homework" 
    And "Walk the dog" should appear before "Finish math homework" 
    
    Given I am on the index page
    When I click "task_active"
    Then "Finish math homework" should appear before "Take out the trash" 
    And "Take out the trash" should appear before "Walk the dog"

    