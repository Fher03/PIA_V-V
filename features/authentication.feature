Feature: Authentication
    As a user
    I want to be able to sign up, log in, and log out
    So that I can access my account securely

    Scenario: Register a new user
        Given I am on the registration page
        When I fill "user@example.com" in the "user[email_address]" field
        And I fill "password123" in the "user[password]" field
        And I click the "Crear Usuario" button
        Then I should see "Usuario creado correctamente."
    
    Scenario: Log in with valid credentials
        Given that a user exists with email "user@example.com" and password "password123"
        When I visit the login page
        And I fill "user@example.com" in the "email_address" field
        And I fill "password123" in the "password" field
        And I click the "Sign in" button
        Then I should be redirected to the dashboard