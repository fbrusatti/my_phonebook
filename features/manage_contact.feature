Feature: Manage contacts

  In order to use Phonebook
  As a regular visitor
  I want to manage the contacts

  Scenario: Create contact
    Given I have no contacts
    And I am on the list of contacts
    When I follow "New Contact"
    And I fill in "First name" with "Homer"
    And I fill in "Last name" with "Simpson"
    And I press "Create"
    Then I should see "New contact created."
    And I should see "Homer"
    And I should have 1 contact

  Scenario: Edit Contact
    Given I have 1 contact
    When I follow "Edit"
    Then I fill in "First name" with "xxx"
    And I press "Update"
    Then I should see "Contact updated."
    And I should see "xxx"

  Scenario: Delete Contact
    Given I have 1 contact
    Then I follow "Destroy"
    Then I should see "Contact destroyed."
    And I should have 0 contact

  Scenario: Show contact
    Given I have 1 contact
    When I follow "Show"
    Then I should see "First Name"
