Feature: SauceDemo Checkout Flow
  As a customer of Swag Labs
  I want to be able to complete a purchase
  So that I can receive my items

  Background:
    Given the user is logged into the application

@SmokeTest @HappyPath
  Scenario: Successful purchase of a single item
    When the user clicks "Add to cart" for the "Sauce Labs Backpack" product
    And clicks the "Shopping Cart" icon
    And clicks the "Checkout" button
    And enters "Ma" as first name, "A" as last name, and "M1M 1M1" as postal code on the "Checkout: Your Information" page
    And clicks the "Continue" button
    And clicks the "Finish" button on the "Checkout: Overview" page
    Then the user should see the "Thank you for your order!" confirmation message on the "Checkout: Complete!" page

@NegativeTest @Validation
  Scenario: Validation error displayed for missing first name
    When the user clicks "Add to cart" for the "Sauce Labs Backpack" product
    And clicks the "Shopping Cart" icon
    And clicks the "Checkout" button
    And enters "" as first name, "A" as last name, and "M1M 1M1" as postal code on the "Checkout: Your Information" page
    And clicks the "Continue" button
    Then the user should see the error message "Error: First Name is required"

@NegativeTest @Validation
  Scenario: Validation error displayed for missing last name
    When the user clicks "Add to cart" for the "Sauce Labs Backpack" product
    And clicks the "Shopping Cart" icon
    And clicks the "Checkout" button
    And enters "Ma" as first name, "" as last name, and "M1M 1M1" as postal code on the "Checkout: Your Information" page
    And clicks the "Continue" button
    Then the user should see the error message "Error: Last Name is required"

@NegativeTest @Validation
  Scenario: Prevent checkout with missing shipping information
    When the user clicks "Add to cart" for the "Sauce Labs Backpack" product
    And clicks the "Shopping Cart" icon
    And clicks the "Checkout" button
    And enters "Ma" as first name, "A" as last name, and "" as postal code on the "Checkout: Your Information" page
    And clicks the "Continue" button
    Then the user should see an error message "Error: Postal Code is required"

@CartValidation
  Scenario: Verify cart total updates when adding multiple items
    When the user clicks "Add to cart" for the "Sauce Labs Backpack"
    And the user clicks "Add to cart" for the "Sauce Labs Bike Light"
    And clicks the "Shopping Cart" icon
    Then the cart badge should display "2"
    And the "Your Cart" page should show the correct number of items
