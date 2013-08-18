Feature: Merge Authors
  As an admin
  In order to combine blogs with similar content
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And the following users exist:
    | login                   | password | email       | profile_id | name | state  |
    | someuser                | password | joe@joe.com | 2          | joe  | active |

    And the following articles exist:
    | title         | body                           | user     | 
    | My Title      | This is the body of my article | someuser |
    | Life as Admin | I am the admin...I am god      | admin    |

  Scenario: Admin can merge articles
    And I am logged into the admin panel as admin(aaaaaaaa)
    And I am on the edit page for article "Life as Admin"
    Then I should see "Merge Articles"

  Scenario: Non-admin cannot merge articles
    And I am logged into the admin panel as someuser(password)
    And I am on the edit page for article "My Title"
    Then I should not see "Merge Articles"
