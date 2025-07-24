use hospital_management_system;

-- All Visit Report 
SELECT 
    v.visit_id,
    p.name AS patient_name,
    d.name AS doctor_name,
    v.visit_date,
    v.reason,
    v.status
FROM Visits v
JOIN Patients p ON v.patient_id = p.patient_id
JOIN Doctors d ON v.doctor_id = d.doctor_id
ORDER BY v.visit_date DESC;

--  Daily Visit Report
SELECT 
    v.visit_id,
    p.name AS patient_name,
    d.name AS doctor_name,
    v.visit_date,
    v.reason,
    v.status
FROM Visits v
JOIN Patients p ON v.patient_id = p.patient_id
JOIN Doctors d ON v.doctor_id = d.doctor_id
WHERE v.visit_date = '2025-07-10';  -- Replace with your required date

-- Visits by Doctor Report
SELECT 
    d.name AS doctor_name,
    COUNT(v.visit_id) AS total_visits
FROM Visits v
JOIN Doctors d ON v.doctor_id = d.doctor_id
GROUP BY d.name
ORDER BY total_visits DESC;

-- Visits by Patient Report
SELECT 
    p.name AS patient_name,
    COUNT(v.visit_id) AS total_visits
FROM Visits v
JOIN Patients p ON v.patient_id = p.patient_id
GROUP BY p.name
ORDER BY total_visits DESC;


-- Visit Report in a Date Range
SELECT 
    v.visit_id,
    p.name AS patient_name,
    d.name AS doctor_name,
    v.visit_date,
    v.reason
FROM Visits v
JOIN Patients p ON v.patient_id = p.patient_id
JOIN Doctors d ON v.doctor_id = d.doctor_id
WHERE v.visit_date BETWEEN '2025-07-01' AND '2025-07-15'
ORDER BY v.visit_date;

-- Create view
CREATE VIEW Visit_Report AS
SELECT 
    v.visit_id,
    p.name AS patient_name,
    d.name AS doctor_name,
    v.visit_date,
    v.reason,
    v.status
FROM Visits v
JOIN Patients p ON v.patient_id = p.patient_id
JOIN Doctors d ON v.doctor_id = d.doctor_id;


-- call view
SELECT * FROM Visit_Report;





