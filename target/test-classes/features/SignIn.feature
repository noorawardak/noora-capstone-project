Feature: Sign in Feature
​@SignIn
Scenario: Verify user can sign in into Retail Application
    Given User is on retail website
    When User click on Sign in option
    And User enter email 'student@tekschool.us' and password 'Tek@School'
    And User click on login button
    Then User should be logged in into Account