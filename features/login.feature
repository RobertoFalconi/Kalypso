Feature: Login
As an unregistered user
I want to login with username or e-mail
So that I can become a user

Scenario: Login
  When I go to login page
  And I write email and password
  Then I should be able to login