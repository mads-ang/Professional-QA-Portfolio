Feature: Salesforce Lead Conversion & Data Integrity
  As a Product Owner, I want to ensure that only high-quality, verified Leads are converted 
  into Accounts and Contacts to maintain a clean CRM database and accurate sales reporting.

Background:
  Given I am logged into the Salesforce Developer Sandbox as a System Administrator

# --- SECTION 1: DATA INTEGRITY (THE "SHIFT-LEFT" LOGIC) ---

@Smoke @DataIntegrity
Scenario: Prevent lead conversion without a mandatory Email address
  Given a new Lead exists for "Toronto Education Board"
  And the "Email" field is empty
  When I attempt to convert the Lead to an Account and Contact
  Then the system should display a validation error: "Email is required for conversion"
  And the record status should remain as "Open - Not Contacted"

@Regression @DuplicateManagement
Scenario: Verify duplicate detection prevents redundant Lead creation
  Given an existing Lead already exists with the email "test.user@torontoschools.ca"
  When I attempt to create a second Lead with the same email address
  Then the system should trigger a "Duplicate Detected" warning
  And I should be prompted to "View Existing Record" instead of creating a new one

# --- SECTION 2: AUTOMATION & WORKFLOW ---

@Automation @Workflow
Scenario: Automated "Lead Source" attribution for Web-to-Lead forms
  When a lead is created via a web-integrated inquiry form
  Then the "Lead Source" field should automatically be set to "Web"
  And a "Follow-up Task" should be automatically assigned to the Lead Owner within 24 hours

# --- SECTION 3: SECURITY & PERMISSIONS ---

@Security @AccessControl
Scenario: Permission check for sensitive Lead record deletion
  Given I am logged in with a "Standard Sales User" profile
  When I attempt to delete a "High Value" Lead record
  Then the system should deny the action with an "Insufficient Privileges" message
  And the record should remain in the Salesforce database
