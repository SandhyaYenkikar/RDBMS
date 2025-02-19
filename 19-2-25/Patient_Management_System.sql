USE JIBE_Main_Training;

CREATE TABLE Patientss(
patient_Id INT PRIMARY KEY,
patient_Name VARCHAR (50),
patient_Age INT,
disease VARCHAR (50),
doctor_Assigned VARCHAR (50),
);

INSERT INTO Patientss 
(patient_Id, patient_Name, patient_Age, disease, doctor_Assigned) VALUES
(1, 'Aarav Sharma', 32, 'Fever', 'Dr. Nair'),
(2, 'Vivaan Patil', 45, 'Cold', 'Dr. Nair'),
(3, 'Diya Singh', 28, 'Cough', 'Dr. Mehta'),
(4, 'Aanya Rao', 37, 'Headache', 'Dr. Iyer'),
(5, 'Ishaan Deshmukh', 65, 'Cold', 'Dr. Nair'),
(6, 'Saanvi Kulkarni', 70, 'Fever', 'Dr. Iyer'),
(7, 'Riya Malhotra', 29, 'Headache', 'Dr. Mehta');

SELECT * FROM Patientss WHERE patient_Age > 60

SELECT * FROM Patientss WHERE doctor_Assigned = 'Dr. Nair'

SELECT disease, COUNT(*) AS patient_count FROM Patientss GROUP BY disease;

