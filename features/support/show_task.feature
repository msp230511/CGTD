Feature: User can view a single todo entry in a show/ details page
    As a user
    so that I can get more details on a task that I created
    I want to be able to view the entire task with more information in a 'focus' mode

Background: There already exists a task that can be completed
    Given these tasks:
        | name | description | priority | category | due_at | completed |
        | Take out the trash | Do it | 3 | Personal | | false|

Scenario: Visit the show page for a task
    Given I am on the index page
    Then "Take out the trash" should be an active task
    When I click the "task_show" button for the task "Take out the trash"
    Then I should be on the show page for "Take out the trash"
    Then I should see "Do it" 
    And I should see "High"
    And I should see "Personal"
    And I should see "Take out the trash"
    When I press "Back"
    Then I should be on the index page
