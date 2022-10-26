Feature: Sort to-do list based on different features
    As a Colgate student
    So that I can prioritize the tasks with different features
    I want to sort my to-do list based on different features

Background: There already exists some to do tasks
    Given these tasks:
        | name | description | priority | category | due_at | completed |
        | Take out the trash | Do it | 3 | Personal | | false|
        | Finish math homework | Chapter 3, Sec. 5-10 | 2 | Work | | false|

# Scenario: Sort tasks by selected features
#     Given I am on the index page
#     When I press "Category1"
#     Then "Take out the trash" should appear before "Finish math homework"