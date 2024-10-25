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
  
--  SELECT COUNT(*) AS Number_of_visits
--  FROM patients;
--  SELECT SUM(service) as services_provided
--  FROM admissions;
  
 -- SELECT avg(blood_pressure_systolic) AS avg_presseur_systolic_per_provider
--  FROM visits
--  GROUP BY provider_id;
  
   -- MAX FUNCTION
-- SELECT MAX(blood_pressure_systolic) AS highest_blood_pressure
-- FROM visits;

-- SELECT gender, COUNT(*) as total_number
-- FROM patients
-- group by gender; 

-- SELECT provider_specialty, COUNT(*) as total
-- FROM providers  
-- group by provider_specialty;

-- ANSWERS BEGINNING
-- PART1
SELECT COUNT(*) As total_admission
FROM admissions;

SELECT admission_date, discharge_date, avg() as avg_stay_length
FROM admissions, discharges;

SELECT AVG(DATEDIFF(a.admission_date, d.discharge_date)) AS average_length_of_stay
FROM admissions a
JOIN discharges d
ON a.admission_id = d.admission_id;

-- PART 2
SELECT primary_diagnosis, count(*) As TOTAL_ADMISSION
FROM admissions
GROUP BY primary_diagnosis;

SELECT service, AVG(DATEDIFF(a. admission_date, d.discharge_date)) as AVER_LENGTH
FROM admissions a
JOIN discharges d ON a.admission_id = d.admission_id
GROUP BY service;

SELECT discharge_disposition, COUNT(*) As number_of_discharges
FROM discharges
GROUP BY discharge_disposition;

-- PART 3
SELECT service, COUNT(*) AS total_adm
FROM admissions
GROUP BY service HAVING COUNT(*) > 5; 

SELECT primary_diagnosis, AVG(DATEDIFF(a. admission_date, d.discharge_date)) as AVER_LENGTH
FROM admissions a
JOIN discharges d ON a.admission_id = d.admission_id
WHERE primary_diagnosis = 'Stroke';

-- PART 4
SELECT acuity, COUNT(*) as total_number_of_visit
FROM ed_visits
GROUP BY acuity;

SELECT primary_diagnosis, service, COUNT(*) as total_number_of_adm
FROM admissions
GROUP BY primary_diagnosis, service;


-- PART 5
SELECT DATE_FORMAT(admission_date, '%m') AS month,COUNT(*) AS total_admissions
FROM admissions
GROUP BY DATE_FORMAT(admission_date, '%m') ORDER BY month;

SELECT primary_diagnosis, MAX(DATEDIFF(a. admission_date, d.discharge_date)) As MAX_length_of_stay
FROM admissions a
JOIN discharges d ON a.admission_id = d.admission_id
GROUP BY primary_diagnosis;

-- OPTIONAL
SELECT a.service, AVG(DATEDIFF(a. admission_date, d.discharge_date)) AS AVG_OF_STAY,COUNT(*) AS total
FROM admissions a
JOIN discharges d ON a.admission_id = d.admission_id
GROUP BY a.service ORDER BY AVG_OF_STAY;

--  PART !:INSERT DATA
INSERT into patients(first_name, last_name, date_of_birth, gender, language)
VALUES('John', 'Doe', '1980-11-15', 'Male', 'English');

-- part2 : UPDATE Data
UPDATE patients
SET language = 'Spanish'
WHERE patient_id = '946' ;

-- DELETE from patients
-- WHERE patient_id = '948';

SELECT* FROM patients
WHERE first_name = 'John';

-- Part 3 : DELETE data
 DELETE from patients
WHERE patient_id = '10';

-- part 4: Handling Null Values
SELECT first_name, last_name, email_address
FROM providers
WHERE email_address IS NULL;

SELECT first_name, last_name, email_address, IFNULL (email_address, 'N/A')
FROM providers; 