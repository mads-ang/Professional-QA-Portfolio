# UI Testing: E-commerce Checkout & Logic

## What’s in this folder?
This section of my portfolio covers the front-end "User Journey" for a standard e-commerce platform. Instead of just writing a list of clicks, I’ve used **Gherkin** to map out the business rules that actually matter to a customer: like making sure the cart calculates correctly and the transition to payment is seamless.

My goal here is to show how I balance "Happy Path" testing (a perfect purchase) with the "Edge Cases" that usually break during a release.

## What I’m Testing
I’ve organized these scenarios to cover the most critical parts of the customer journey:

* **Cart Validation:** Making sure items are added correctly and the total price updates in real-time.
* **Checkout Flow:** Testing the transition from the shopping cart to the payment screen without data loss.
* **Inventory Alerts:** Handling scenarios where a user tries to add an out-of-stock item or more items than are available.
* **User Authentication:** Ensuring that "Guest Checkout" vs. "Logged-in" flows work as expected.

## How to use these files
* **[Checkout_Scenarios.feature](./Checkout_Scenarios.feature):** This file contains the BDD (Behavior Driven Development) scenarios. It’s written in plain English so that developers, product owners, and QA can all agree on the requirements before a single line of code is written.

## Why BDD?
In my 13 years of QA experience, I’ve found that using Gherkin/BDD is the best way to bridge the gap between business needs and technical testing. It ensures that we aren't just "testing the code," but actually "testing the product" for the end-user.

## Tools Used
* **Gherkin** (Scenario Design)
* **JIRA/Confluence Strategy** (Mapping requirements to tests)
