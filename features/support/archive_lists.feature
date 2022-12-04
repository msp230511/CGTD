Feature: Archive and unarchive to-do lists
    As a user
    So that I can manage my to-do lists
    I want to be able to archive and unarchive them

Background: There already exists some to do lists
    Given these Users:
    | email | password | 
    | user@example.com | password |

    Given these lists:
    | list_name | user_id |
    | List1 | 1 |
    | List2 | 1 |
    | List3 | 1 |

Scenario: User archives and unarchives a to-do list
    Given I am logged in as "user@example.com" with password "password"
    Then I should be on the index page
    And the current active list should be "List1"
    When I press "Archive"
    Then I should see "List List1 has been archived"
    And the list "List1" should not exist
    When I press "Archived Lists"
    Then I should be on the archived lists page
    And I should see "List1" displayed on the page as an archived list

    When I click the "unarchive_list" button for the to-do list "List1"
    Then I should be on the index page
    And I should see "List List1 has been reactivated."
    And the current active list should be "List1"

Scenario: User deletes a to-do list from the archived lists page
    Given I am logged in as "user@example.com" with password "password"
    Then I should be on the index page
    And the current active list should be "List1"
    When I press "Archive"
    Then I should see "List List1 has been archived"
    And the list "List1" should not exist
    When I press "Archived Lists"
    Then I should be on the archived lists page
    And I should see "List1" displayed on the page as an archived list

    When I click the "delete_list" button for the to-do list "List1"
    Then I should see "Successfully Deleted List: List1"
    And the list "List1" should not exist on the archived lists page
    When I press "Back"
    Then I should be on the index page
    Then the list "List1" should not exist