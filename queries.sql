use hospital_management_system;

-- List All Appointments with Patient and Doctor Names
SELECT v.visit_id, p.name AS patient_name, d.name AS doctor_name, v.visit_date, v.reason
FROM Visits v
JOIN Patients p ON v.patient_id = p.patient_id
JOIN Doctors d ON v.doctor_id = d.doctor_id
ORDER BY v.visit_date;

-- Upcoming Appointments for a Specific Doctor
SELECT v.visit_id, p.name AS patient_name, v.visit_date, v.reason
FROM Visits v
JOIN Patients p ON v.patient_id = p.patient_id
WHERE v.doctor_id = 1  -- Replace with doctor_id
  AND v.visit_date >= CURDATE()
ORDER BY v.visit_date;

-- Count of Appointments per Doctor
SELECT d.name AS doctor_name, COUNT(v.visit_id) AS total_appointments
FROM Visits v
JOIN Doctors d ON v.doctor_id = d.doctor_id
GROUP BY d.name
ORDER BY total_appointments DESC;


-- List All Payments with Status
SELECT b.bill_id, p.name AS patient_name, b.total_amount, b.payment_status, b.bill_date
FROM Bills b
JOIN Visits v ON b.visit_id = v.visit_id
JOIN Patients p ON v.patient_id = p.patient_id
ORDER BY b.bill_date;

--  Total Paid vs Unpaid Amount
SELECT payment_status, SUM(total_amount) AS total_amount
FROM Bills
GROUP BY payment_status;

-- List of Unpaid Bills with Patient and Doctor
SELECT b.bill_id, p.name AS patient_name, d.name AS doctor_name, b.total_amount, b.bill_date
FROM Bills b
JOIN Visits v ON b.visit_id = v.visit_id
JOIN Patients p ON v.patient_id = p.patient_id
JOIN Doctors d ON v.doctor_id = d.doctor_id
WHERE b.payment_status = 'Unpaid'
ORDER BY b.bill_date;



