Feature: Authentication
    As a user
    I want to be able to sign up, log in, publish 2 products and log out
    So that I can access my account securely

    Scenario: Register
        Given I am on the registration page
        When I fill "user@example.com" in the "user[email_address]" field
        And I fill "password123" in the "user[password]" field
        And I click the "Crear Usuario" button
        Then I should see "Usuario creado correctamente."
    
    Scenario: Login
        Given that a user exists with email "user@example.com" and password "password123"
        When I visit the login page
        And I fill "user@example.com" in the "email_address" field
        And I fill "password123" in the "password" field
        And I click the "Sign in" button
        Then I should be redirected to the dashboard


    Scenario: Product 1
        Given that a user exists with email "user@example.com" and password "password123"
        When I visit the login page
        And I fill "user@example.com" in the "email_address" field
        And I fill "password123" in the "password" field
        And I click the "Sign in" button
        When I am on the dashboard page
        And I click the "Create New Product" button
        And I fill "Product 1" in the "product[name]" field
        And I fill "Description of Product 1" in the description field
        And I attach the file "features/support/uploads/example_image1.jpg" to the "product_featured_image" field
        And I fill "100" in the "product[inventory_count]" field
        And I click the "Create Product" button
        Then I should see "Producto creado correctamente."



    Scenario: Product 2
        Given that a user exists with email "user@example.com" and password "password123"
        When I visit the login page
        And I fill "user@example.com" in the "email_address" field
        And I fill "password123" in the "password" field
        And I click the "Sign in" button
        When I am on the dashboard page
        And I click the "Create New Product" button
        And I fill "Product 2" in the "product[name]" field
        And I fill "Description of Product 2" in the description field
        And I attach the file "features/support/uploads/example_image1.jpg" to the "product_featured_image" field
        And I fill "200" in the "product[inventory_count]" field
        And I click the "Create Product" button
        Then I should see "Producto creado correctamente."


    Scenario: Logout
        Given that a user exists with email "user@example.com" and password "password123"
        When I visit the login page
        And I fill "user@example.com" in the "email_address" field
        And I fill "password123" in the "password" field
        And I click the "Sign in" button
        Then I should be redirected to the dashboard
        When I click the "Logout" button
        Then I should be redirected to the login page
        