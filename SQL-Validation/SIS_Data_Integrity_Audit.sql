-- SIS DATA AUDIT: Student & Teacher Record Integrity
-- Purpose: Identifying data gaps and logical errors in SIS exports.

-- 1. STUDENT COMMUNICATION: Missing Email Addresses
SELECT student_id, first_name, last_name, username
FROM SIS_Students
WHERE email IS NULL OR email = '' OR email NOT LIKE '%@%.%';

-- 2. TEACHER COMMUNICATION: Missing Email Addresses
SELECT teacher_id, first_name, last_name, username
FROM SIS_Teachers
WHERE email IS NULL OR email = '' OR email NOT LIKE '%@%.%';

-- 3. STUDENT CHARACTER CHECK: Names with Apostrophes or Accents
-- Goal: Identify O'Malley or French names (like René) that may need special sync handling.
SELECT student_id, first_name, last_name 
FROM SIS_Students 
WHERE last_name LIKE "%'%" 
   OR last_name LIKE "%é%" 
   OR last_name LIKE "%à%";

-- 4. TEACHER CHARACTER CHECK: Names with Apostrophes or Accents
SELECT teacher_id, first_name, last_name 
FROM SIS_Teachers 
WHERE last_name LIKE "%'%" 
   OR last_name LIKE "%é%" 
   OR last_name LIKE "%à%";

-- 5. RELATIONAL CHECK: Students without assigned Teachers
SELECT student_id, first_name, last_name, email
FROM SIS_Students
WHERE teacher_id IS NULL OR teacher_id = '';

-- 6. DATA CONSISTENCY: Duplicate Student Usernames
SELECT username, COUNT(*)
FROM SIS_Students
GROUP BY username
HAVING COUNT(*) > 1;

-- 7. SECURITY AUDIT: Default Student Passwords
SELECT username, email
FROM SIS_Students
WHERE pw IN ('Welcome123', 'Password1', 'ChangeMe2026');
