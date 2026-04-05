# API Testing: User Registry Suite

## What’s in this folder?
This part of my portfolio shows how I handle API testing for a "User Registry" system. I’m using **JSONPlaceholder** as a live, public backend to demonstrate a full CRUD (Create, Read, Update, Delete) lifecycle. 

Instead of just checking if the site is "up," I’ve built these tests to validate the data contract making sure the backend sends the right fields, the right status codes, and handles errors gracefully.

## My Testing Approach
I’ve organized this suite to cover more than just the basics. Here’s what I’ve included:

* **Data Retrieval (GET):** Verifying I can pull single user profiles, the full directory, and nested data like "User Posts."
* **Data Creation (POST):** Testing the logic for adding new records and checking for the `201 Created` status.
* **Updates (PUT):** Sending JSON payloads to modify existing data and verifying the response reflects those changes.
* **Cleanup (DELETE):** Confirming the system processes removal requests with a proper `200 OK`.
* **Protocol Checks (OPTIONS & HEAD):** Verifying server permissions and metadata. This ensures the correct communication methods are allowed without the overhead of downloading full data blocks.

## How to use these files
1. **[User_Registry_Validation.feature](https://github.com/mads-ang/Professional-QA-Portfolio/blob/main/API-Testing/User_Registry_Validation.feature):** This is the Gherkin file where I’ve mapped out the business logic in plain English.
2. **[Portfolio User Registry API Suite.postman_collection.json](https://github.com/mads-ang/Professional-QA-Portfolio/blob/main/API-Testing/Portfolio%20User%20Registry%20API%20Suite.postman_collection.json):** This is the actual Postman collection. You can import this directly into Postman to run the tests yourself.

## A Technical Note
Since JSONPlaceholder is a mock API, it doesn't actually "save" my changes to their database. When I POST or PUT, the server simulates a success and echoes the data back to me. This is perfect for testing the API logic without cluttering a real database with test data.

## Tools Used
* **Postman** (Request execution & Collection management)
* **Gherkin** (Test scenario design)
