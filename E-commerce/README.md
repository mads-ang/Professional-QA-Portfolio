# UI Testing: E-commerce Checkout & Logic

## What’s in this folder?
This section of my portfolio covers the front-end "User Journey" for a standard e-commerce platform. Instead of just writing a list of clicks, I’ve used **Gherkin** to map out the business rules that actually matter to a customer: like making sure the cart calculates correctly and the transition to payment is seamless.

My goal here is to show how I balance "Happy Path" testing (a perfect purchase) with the "Edge Cases" that I’ve seen break most often during a release.

## What I’m Testing
I’ve built these scenarios to handle the critical steps of a secure checkout:

* **Checkout Handshake:** Testing the flow from the "Shopping Cart" through to the final "Thank You" confirmation to ensure no data is lost during the process.
* **Shipping Validation:** Verifying that the system correctly identifies missing required information (First Name, Last Name, and Postal Code) before allowing a purchase to proceed.
* **User Confirmation:** Ensuring the final success message is triggered only after a complete, valid transaction.

## How to use these files
* **[Checkout_Scenarios.feature](https://github.com/mads-ang/Professional-QA-Portfolio/blob/main/E-commerce/SauceDemo_Checkout.feature):** This file contains the BDD (Behavior Driven Development) scenarios. It’s written in plain English so that developers, product owners, and QA can all agree on the requirements before a single line of code is written. It maps out exactly how I validate a production-ready checkout system for SauceDemo.

## Why I use BDD (Gherkin)
In my experience leading QA teams, I’ve found that Gherkin is the best way to get Developers, Product Owners, and QA on the same page. It turns a "Requirement" into a "Test Case" before the code is even written, which saves a massive amount of time in the bug-fix cycle. It ensures that we aren't just "testing the code," but actually "testing the product" for the end-user.

## Tools Used
* **Gherkin** (Scenario Design)
* **SauceDemo** (Public testing environment)
