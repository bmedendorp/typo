Feature: Edit Categories
	As an admin
	In order to tag articles with appropriate categories
	I want to be able to edit the available categories


	Scenario: Admin can view the categories page
		Given the blog is set up
		And I am logged into the admin panel
		When I am on the category edit page
		Then I should see "Categories"
