-- Identifying Patients with Multiple Admissions for the Same Diagnosis
-- Your task is to write an SQL query to find patients who have been admitted multiple times for the same diagnosis.
-- You are required to display the patient_id and diagnosis for these cases.

SELECT patient_id, diagnosis
FROM admissions
GROUP BY patient_id, diagnosis
HAVING COUNT(*) > 1;
