-- Your task is to write a SQL query to show all the columns from the admissions table where the patient was admitted and discharged on the same day.
SELECT * FROM admissions
WHERE admission_date = discharge_date
  
