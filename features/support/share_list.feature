Feature: Share a todo list with another user
As a user
So that I can collaborate on a todo list with another user
I want to be able to share a todo list with them

Background: There already exist multiple todo lists for the same user, with one differently-named task each
    Given these Users:
    | email | password |
    | user1@example.com | password1 |
    | user2@example.com | password2 |

    Given these lists:
        | list_name | user_id |
        | List1 | 1 | 
        | List2 | 1 | 

    Given these tasks:
        | name | description | priority | category | due_at | completed | todo_list_id |
        | Take out the trash | Do it | 3 | Personal | | false| 1 | 
        | Walk the dog | Do it | 3 | Personal | | false| 2 |

Scenario: User can share a todo list with another user
    Given I am logged in as "user1@example.com" with password "password1"
    And I am on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"
    When I press "Share"
    Then I should be on the share page for "List1"
    When I fill in the following:
    | Field | Value |
    | User email | user2@example.com |
    And I press "Share"
    Then I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"
    And the flash message should be "Successfully shared list: List1 with user: user2@example.com"

Scenario: User cannot share a todo list with a non-existent user
    Given I am logged in as "user1@example.com" with password "password1"
    And I am on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"
    When I press "Share"
    Then I should be on the share page for "List1"
    When I fill in the following:
    | Field | Value |
    | User email | user3@example.com |
    And I press "Share"
    Then I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"
    And the flash message should be "Could not find user with email: user3@example.com"

Scenario: User cannot share a todo list with themselves
    Given I am logged in as "user1@example.com" with password "password1"
    And I am on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"
    When I press "Share"
    Then I should be on the share page for "List1"
    When I fill in the following:
    | Field | Value |
    | User email | user1@example.com |
    And I press "Share"
    Then I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"
    And the flash message should be "List: List1 is already shared with user: user1@example.com"


Scenario: User 1 shares a todo list, user 2 now sees the todo list in their list of todo lists
    Given I am logged in as "user1@example.com" with password "password1"
    And I am on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"
    When I press "Share"
    Then I should be on the share page for "List1"
    When I fill in the following:
    | Field | Value |
    | User email | user2@example.com |
    And I press "Share"
    Then I should be on the index page
    And the list "List1" should exist
    And the list "List2" should exist
    And the current active list should be "List1"
    And the flash message should be "Successfully shared list: List1 with user: user2@example.com"
    When I press "Logout"
    Then I should be on the sign-in page

    When I login as "user2@example.com" with password "password2"
    Then I should be on the index page
    And the list "List1" should exist
    And the current active list should be "List1"
    And the current user should be "user2@example.com"
    And the list "List2" should not exist
    And the task "Take out the trash" should exist
    And the task "Walk the dog" should not exist