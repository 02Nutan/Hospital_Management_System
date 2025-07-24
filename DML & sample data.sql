CREATE SCHEMA `hospital_management_system` ;
use hospital_management_system;

CREATE TABLE Patients (
  patient_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  gender ENUM('Male', 'Female', 'Other'),
  dob DATE,
  phone VARCHAR(15),
  address TEXT
);


CREATE TABLE Doctors (
  doctor_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  specialization VARCHAR(100) NOT NULL,
  phone VARCHAR(15),
  availability ENUM('Available', 'Unavailable') DEFAULT 'Available'
);



CREATE TABLE Visits (
  visit_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  visit_date DATE NOT NULL,
  reason TEXT,
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


CREATE TABLE Bills (
  bill_id INT PRIMARY KEY AUTO_INCREMENT,
  visit_id INT NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  payment_status ENUM('Paid', 'Unpaid') DEFAULT 'Unpaid',
  bill_date DATE DEFAULT (CURRENT_DATE),
  FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


INSERT INTO Patients (name, gender, dob, phone, address) VALUES
('Ramesh Patil', 'Male', '1985-03-12', '9876543210', 'Pune, Maharashtra'),
('Sneha Deshmukh', 'Female', '1992-07-25', '9123456780', 'Nagpur, Maharashtra'),
('Amit Kulkarni', 'Male', '1990-01-05', '9988776655', 'Mumbai, Maharashtra'),
('Priya Joshi', 'Female', '1998-09-15', '9876123450', 'Nashik, Maharashtra'),
('Suresh Shinde', 'Male', '1978-11-22', '9812345678', 'Aurangabad, Maharashtra'),
('Meena Pawar', 'Female', '1995-06-30', '9765432109', 'Solapur, Maharashtra'),
('Vijay Jadhav', 'Male', '1987-12-11', '9898989898', 'Kolhapur, Maharashtra'),
('Kiran Khot', 'Male', '1993-05-14', '9876501230', 'Satara, Maharashtra'),
('Anjali Salunkhe', 'Female', '2000-03-03', '9123004567', 'Sangli, Maharashtra'),
('Rohit Gokhale', 'Male', '1982-02-18', '9812340009', 'Thane, Maharashtra');

INSERT INTO Doctors (name, specialization, phone, availability) VALUES
('Dr. Anil Gupta', 'Cardiology', '9123456789', 'Available'),
('Dr. Meena Iyer', 'Pediatrics', '9876501234', 'Available'),
('Dr. Rajesh Naik', 'Orthopedics', '9988771122', 'Unavailable'),
('Dr. Kavita More', 'Gynecology', '9123001122', 'Available'),
('Dr. Ajay Patwardhan', 'Neurology', '9876500001', 'Available'),
('Dr. Sunita Kulkarni', 'Dermatology', '9812345670', 'Available'),
('Dr. Manoj Sawant', 'ENT', '9823456789', 'Unavailable'),
('Dr. Leena Patil', 'Psychiatry', '9876543201', 'Available'),
('Dr. Vishal Deshpande', 'General Medicine', '9123450098', 'Available'),
('Dr. Archana Jagtap', 'Oncology', '9988772233', 'Available');

INSERT INTO Visits (patient_id, doctor_id, visit_date, reason) VALUES
(1, 1, '2025-07-01', 'Chest Pain'),
(2, 2, '2025-07-03', 'Child Fever'),
(3, 3, '2025-07-05', 'Knee Injury'),
(4, 4, '2025-07-06', 'Pregnancy Checkup'),
(5, 5, '2025-07-08', 'Migraine Treatment'),
(6, 6, '2025-07-09', 'Skin Allergy'),
(7, 7, '2025-07-10', 'Ear Infection'),
(8, 8, '2025-07-12', 'Depression Counseling'),
(9, 9, '2025-07-13', 'General Checkup'),
(10, 10, '2025-07-15', 'Cancer Screening');

INSERT INTO Bills (visit_id, total_amount, payment_status, bill_date) VALUES
(1, 2500.00, 'Paid', '2025-07-01'),
(2, 800.00, 'Unpaid', '2025-07-03'),
(3, 3000.00, 'Paid', '2025-07-05'),
(4, 1200.00, 'Unpaid', '2025-07-06'),
(5, 1500.00, 'Paid', '2025-07-08'),
(6, 700.00, 'Unpaid', '2025-07-09'),
(7, 1000.00, 'Paid', '2025-07-10'),
(8, 2000.00, 'Unpaid', '2025-07-12'),
(9, 600.00, 'Paid', '2025-07-13'),
(10, 5000.00, 'Paid', '2025-07-15');






