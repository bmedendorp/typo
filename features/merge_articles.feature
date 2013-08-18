Feature: Merge Authors
  As an admin
  In order to combine blogs with similar content
  I want to be able to merge articles

  Scenario: Admin can merge articles
    Given the blog is set up
    And I am logged into the admin panel
    And I am on the edit page for article 1
    Then I should see "Merge Articles"

  Scenario: Non-admin cannot merge articles
    Given the blog is set up
    And I am logged into the admin panel as a non-admin
    And I am on the edit page for article 1
    Then I should not see "Merge Articles"
