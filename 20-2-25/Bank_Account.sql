CREATE TABLE BankAccountss (
    AccountID INT PRIMARY KEY ,
    CustomerName VARCHAR(100) NOT NULL,
    AccountType VARCHAR(50) NOT NULL,
    Balance DECIMAL(10, 2) NOT NULL
);

INSERT INTO BankAccountss (CustomerName, AccountType, Balance)
VALUES
(101, 'Sandhya', 'Savings', 10000.00),
(102, 'Rutuja', 'Current', 5000.00),
(103, 'Prachi', 'Savings', 15000.00),
(104, 'Aishwarya', 'Current', 2000.00),
(105, 'Ashwini', 'Savings', 7500.00);

BEGIN TRANSACTION;

UPDATE BankAccounts
SET Balance = Balance - 5000
WHERE AccountID = 1;

-- Check balance and rollback if less than ₹5000
IF (SELECT Balance FROM BankAccounts WHERE AccountID = 1) < 0
BEGIN
    ROLLBACK TRANSACTION;
END
ELSE
BEGIN
    COMMIT TRANSACTION;
END;



-- Create a role for customers
CREATE ROLE CustomerRole;

SELECT * FROM BankAccountss


/*
-- Grant SELECT permission
GRANT SELECT ON BankAccounts TO CustomerRole;

--Revoke update permission to customer.
REVOKE UPDATE ON BankAccounts FROM CustomerRole;

-- Revoke DELETE permission from all users
REVOKE DELETE ON BankAccounts FROM PUBLIC;*/
