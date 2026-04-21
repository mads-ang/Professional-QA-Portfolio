Feature: User Registry API Validation
  As a QA Lead
  I want to verify the User Registry REST API
  So that I can ensure the backend returns accurate profile data and handles all HTTP methods correctly

# --- READ OPERATIONS (GET) ---

@SmokeTest @API
Scenario: Retrieve all users in the registry
  Given the API endpoint is "https://jsonplaceholder.typicode.com/users"
  When I send a "GET" request
  Then the response status code should be 200
  And the response body should contain a list of 10 users

@SmokeTest @API
Scenario: Retrieve a specific user profile by ID
  Given the API endpoint is "https://jsonplaceholder.typicode.com/users/1"
  When I send a "GET" request
  Then the response status code should be 200
  And the response body "name" should be "Leanne Graham"
  And the response body "email" should be "Sincere@april.biz"

@Integration @API
Scenario: Retrieve posts associated with a specific user
  Given the API endpoint is "https://jsonplaceholder.typicode.com/users/1/posts"
  When I send a "GET" request
  Then the response status code should be 200
  And all returned posts should belong to "userId": 1

@NegativeTest @API
Scenario: Handle request for a non-existent user ID
  Given the API endpoint is "https://jsonplaceholder.typicode.com/users/100"
  When I send a "GET" request
  Then the response status code should be 404

# --- WRITE OPERATIONS (POST, PUT, DELETE) ---

@PostTest @API
Scenario: Create a new user record
  Given the API endpoint is "https://jsonplaceholder.typicode.com/users"
  And the request body contains:
    """
    { "name": "Mary Test", "email": "mary@example.com" }
    """
  When I send a "POST" request
  Then the response status code should be 201
  And the response body should contain a new "id": 11

@UpdateTest @API
Scenario: Update an existing user's email
  Given the API endpoint is "https://jsonplaceholder.typicode.com/users/1"
  And the request body contains:
    """
    { "email": "updated-mary-test@example.com" }
    """
  When I send a "PUT" request
  Then the response status code should be 200
  And the response body "email" should match "updated-mary-test@example.com"

@DeleteTest @API
Scenario: Remove a user from the registry
  Given the API endpoint is "https://jsonplaceholder.typicode.com/users/1"
  When I send a "DELETE" request
  Then the response status code should be 200

# --- PROTOCOL OPERATIONS (OPTIONS, HEAD) ---

@ProtocolTest @API
Scenario: Verify server communication options and headers
  Given the API endpoint is "https://jsonplaceholder.typicode.com/users"
  When I send an "OPTIONS" request
  Then the response status code should be 204
  And the "Allow" header should contain "GET, POST, HEAD"

@ProtocolTest @API
Scenario: Verify metadata for the users resource
  Given the API endpoint is "https://jsonplaceholder.typicode.com/users"
  When I send a "HEAD" request
  Then the response status code should be 200
  And the response body should be empty
