Feature: Salesforce Lead Lifecycle & Conversion Validation
  As a Product Owner, I want to ensure leads are captured accurately and validated against strict business rules before they are converted into Contacts to maintain high-quality sales data.

Background:
  Given I am logged into the Salesforce Developer Sandbox

# --- SECTION 1: LEAD CREATION & SETUP ---

#creating a validation rule
# NOTE: This rule is a prerequisite for data integrity.
@Configuration @AdminTask
Scenario: Create a new Validation Rule to enforce Email during conversion
  Given I am in the Salesforce "Setup" menu
  And I have navigated to "Object Manager" > "Lead" > "Validation Rules"
  When I click "New" and enter "Email_Required_for_Conversion" as the Rule Name
  And I enter "IsConverted = True && ISBLANK(Email)" into the Error Condition Formula
  And I set the Error Message to "Email is required for conversion"
  And I ensure the "Active" checkbox is selected
  And I click "Save"
  Then the new Validation Rule should be successfully listed in the Lead object

#verifying if rule exists
# This documents the backend configuration required for the test environment
# Logic path: Setup > Object Manager > Lead > Validation Rules
@Setup @BusinessRule
Scenario: Verify activation of Lead Conversion Validation Rule
  Given I navigate to the "Object Manager" in Salesforce Setup
  And I select the "Lead" object and navigate to "Validation Rules"
  When I verify that a rule named "Email_Required_for_Conversion" is present
  And I confirm the rule status is set to "Active"
  And I verify the formula logic is "IsConverted = True && ISBLANK(Email)"
  Then the system must enforce this logic during the Lead conversion process

#Creating a lead
@Smoke @PositiveTest
Scenario: Successfully create a new Lead with mandatory data
  Given I am on the "Leads" tab
  When I enter "Jane" as the First Name and "Smith" as the Last Name
  And I enter "Ontario Tech Solutions" as the Company 
  And I provide "jane.smith@ontariotech.ca" as the Email address
  And I click the "Save" button
  Then a new Lead record for "Jane Smith" should be successfully created
  And the Lead Status should default to "Open - Not Contacted"

# --- SECTION 2: DATA INTEGRITY (THE "SHIFT-LEFT" LOGIC) ---

#You need a new lead that does not have email address added.
#This scenario verifies the custom validation rule we configured in Setup
@Smoke @DataIntegrity
Scenario: Prevent lead conversion without a mandatory Email address
  Given a new Lead exists for "Toronto Education Board"
  And the "Email" field for this lead is empty
  When I click the "Show more actions" arrow icon in the top right menu
  And I select "Convert" from the dropdown options
  And I click the final "Convert" button in the "Convert Lead" modal window
  Then I should see the error message "Email is required for conversion" at the top of the window
  And the Lead should not be converted to an Account or Contact
  And the Lead Status should remain as "Open - Not Contacted"


