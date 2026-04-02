# SIS Data Integrity Audits

## Project Overview
This folder contains SQL validation scripts designed for **Student Information Systems (SIS)**. These audits demonstrate a "Backend-First" testing approach, identifying data-level bugs that a standard UI test might miss.

## Key Test Scenarios
* **Identity Management (IAM):** Validation for **LDAP/SAML** syncs, specifically checking for special characters (apostrophes in names like D'Angelo and French accents) that often break legacy systems.
* **Relational Integrity:** Identifying "Orphan" student records that are missing a required `teacher_id` mapping.
* **Communication Reliability:** Auditing for missing or malformed email addresses required for password resets, automated reporting, and teacher-parent communication.
* **Security & Compliance:** Detecting accounts still utilizing insecure default or temporary passwords.

## Data Privacy & Compliance
* **MOCK DATA ONLY:** These scripts use generic table names (`SIS_Students`, `SIS_Teachers`) and mock fields.
* No proprietary data or sensitive student/teacher information from past employers is included.
* **Goal:** To demonstrate Technical logic used to ensure data quality in a complex educational software environment.



