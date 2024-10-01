-- CREATE DATABASE hospital_db;
-- USE hospital_db;
-- CREATE TABLE patients(
--    patient_id INT PRIMARY KEY AUTO_INCREMENT,
--    first_name VARCHAR(50) NOT NULL,
--    last_name VARCHAR(50) NOT NULL,
--    date_of_birth DATE NOT NULL,
--    gender VARCHAR(10),
--    language VARCHAR(20) NOT NULL
-- );
USE hospital_db;
-- *means select ALL patients
-- SELECT*  from  patients
-- SELECT last_name, first_name, date_of_birth
-- FROM patients;
-- RETRIEVING 
-- SELECT provider_id, first_name, provider_specialty
-- FROM providers;
;
-- 2: Pattern-Based Filtering
-- RETRIEVING PATIENTS WITH NAME STARTING WITH Ab
-- SELECT*
-- FROM patients
-- WHERE first_name LIKE 'Ab%';

-- RETRIEVING ALL PROVIDERS WHOSE SPECIALITIES END WITH 'Y'
-- SELECT*
-- FROM providers
-- WHERE specialties LIKE '%y';


-- 3:Comparison operators
-- SELECT*
-- WHERE date_of_birth > 1980-01-01;

-- SELECT *
-- FROM ed_visits
-- WHERE acuity >= 2;

-- 4: WHERE Clause with Logical Operators
 SELECT *
 FROM patients
 WHERE language = 'Spanish';

SELECT *
FROM ed_visits
WHERE reason_for_visit =  'Migraine' AND ed_disposition = 'Admitted'; 

SELECT *
FROM patients
WHERE date_of_birth BETWEEN "1975" AND  "1980";

-- Part 5: Sorting Data
SELECT first_name, last_name
FROM patients
ORDER BY last_name ASC;

SELECT *
FROM ed_visits
ORDER BY ed_visit_id DESC;

-- Part 6: Advanced Filtering
SELECT *
FROM admissions, discharges
WHERE primary_diagnosis = 'stroke' AND discharge_disposition = 'Home';

SELECT *
FROM providers
WHERE date_joined > '1995-12-31' 
AND (provider_specialty ='Pediatrics' OR 'Cardiology');



SELECT *
FROM discharges
WHERE discharge_disposition = 'home'
  AND discharge_date BETWEEN '2018-03-01' AND '2018-03-07';

