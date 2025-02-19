USE JIBE_Main_Training;

CREATE TABLE Employeees(
emp_Id INT PRIMARY KEY,
emp_Name VARCHAR (50),
emp_Email VARCHAR (50),
emp_Department VARCHAR (50),
emp_Salary DECIMAL (10,2),
emp_JoiningDate DATE
);

INSERT INTO Employeees
(emp_Id, emp_Name, emp_Email, emp_Department, emp_Salary, emp_JoiningDate) VALUES

(101, 'Sandhya', 'sandhya@gmail.com', 'DEV', '50000', '2025-01-01'),
(102, 'Neha', 'neha@gmail.com', 'QC', '40000', '2025-01-03'),
(103, 'Rutuja', 'rutuja@gmail.com', 'HR', '50000', '2025-01-01'),
(104, 'Prachi', 'prachi@gmail.com', 'FINANCE', '50000', '2025-01-01'),
(105, 'Aishwarya', 'aishwarya@gmail.com', 'MARKETING', '50000', '2025-01-01');

SELECT * FROM Employeees ;

ALTER TABLE Employeees ADD emp_PhoneNumber VARCHAR(15) ;

ALTER TABLE Employeees ADD emp_Status VARCHAR(10);

UPDATE Employeees SET emp_Status = 'left' WHERE emp_Id IN (103, 104);

DELETE FROM Employeees WHERE emp_Status = 'left';

DROP TABLE Employeees;
