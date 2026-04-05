Feature: User Registry API Validation
  As a QA Lead
  I want to verify the User Registry REST API
  So that I can ensure the backend returns accurate profile data

@SmokeTest @API
  Scenario: Successfully retrieve a specific user profile
    Given the API endpoint is "https://jsonplaceholder.typicode.com/users/1"
    When I send a "GET" request
    Then the response status code should be 200
    And the response body should contain Name "Leanne Graham"
    And the response body should contain Username "Bret"
    And the Content-Type header should be "application/json"

@NegativeTest @API
  Scenario: Handle request for a non-existent user ID
    Given the API endpoint is "https://jsonplaceholder.typicode.com/users/999"
    When I send a "GET" request
    Then the response status code should be 404

@Regression @API
  Scenario: Retrieve all users in the registry
    Given the API endpoint is "https://jsonplaceholder.typicode.com/users"
    When I send a "GET" request
    Then the response status code should be 200
    And the response body should contain a list of 10 users

@Integration @API
  Scenario: Retrieve posts associated with a specific user
    Given the API endpoint is "https://jsonplaceholder.typicode.com/users/1/posts"
    When I send a "GET" request
    Then the response status code should be 200
    And the response body should contain posts for UserID 1
