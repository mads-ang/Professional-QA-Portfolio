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
-- Goal: Identify name with apostrophe or French names (like René) that may need special sync handling.
SELECT student_id, first_name, last_name 
FROM SIS_Students 
WHERE last_name LIKE "%'%"   -- Apostrophe (O'Malley)
   OR last_name LIKE "%é%"   -- e acute (René)
   OR last_name LIKE "%è%"   -- e grave (Michèle)
   OR last_name LIKE "%ê%"   -- e circumflex (Noël)
   OR last_name LIKE "%ç%"   -- c cedilla (François)
   OR last_name LIKE "%à%";  -- a grave (Voilà)

-- 4. TEACHER CHARACTER CHECK: Names with Apostrophes or Accents
SELECT teacher_id, first_name, last_name 
FROM SIS_Teachers 
WHERE last_name LIKE "%'%"   -- Apostrophe (O'Donnel)
   OR last_name LIKE "%é%"   -- e acute (René)
   OR last_name LIKE "%è%"   -- e grave (Michèle)
   OR last_name LIKE "%ê%"   -- e circumflex (Noël)
   OR last_name LIKE "%ç%"   -- c cedilla (François)
   OR last_name LIKE "%à%";  -- a grave (Voilà)

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
WHERE pw IN ('Welcome123', 'Password1', 'ChangeMe2026', 'P@ssw0rd');
