# SQL Validation: Student Information System (SIS)

## What’s in this folder?
This part of my portfolio shows how I handle "Backend-First" testing. In a complex system like a Student Information System (SIS), UI testing isn't enough, you have to get into the database to find the data-level bugs that cause the most headaches for schools and parents.

These scripts show how I audit data integrity to prevent system crashes and communication failures.

## What I’m Testing
I’ve focused on the common "pain points" I’ve seen in educational software:

* **Identity & Special Characters:** Checking if names with apostrophes (like D'Angelo) or French accents break the system sync. This is a common point of failure for login
* **Relational Integrity:** Identifying "Orphan" student records. If a student isn't mapped to a teacher correctly, they might disappear from class lists or grade reports.
* **Communication Reliability:** Auditing for missing or badly formatted email addresses. If the email is wrong in the database, password resets and automated report cards will fail.
* **Security & Compliance:** Detecting accounts that are still using default or temporary passwords, which is a major compliance risk.

## How to use these files
1. **[SQL_Validation_Scripts.sql](https://github.com/mads-ang/Professional-QA-Portfolio/blob/main/SQL-Validation/SIS_Data_Integrity_Audit.sql):** You’ll find the actual queries I use to audit these scenarios here.
   
## Note on Data Privacy
* **MOCK DATA ONLY:** These scripts use generic table names (`SIS_Students`, `SIS_Teachers`) and mock fields. **no real data is used here.**
* All scripts are original logic created to demonstrate how I ensure data quality in a high-stakes educational environment.
