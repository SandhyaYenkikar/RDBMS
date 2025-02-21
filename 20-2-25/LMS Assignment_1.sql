-- Create Authorss Table
CREATE TABLE Authorss (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

-- Authorss Table
INSERT INTO Authorss (AuthorID, FirstName, LastName)
VALUES
(1, 'Sandhya', 'Yenkikar'),
(2, 'Rutuja', 'Warke'),
(3, 'Prachi', 'Patil'),
(4, 'Aishwarya', 'Mane');

-- Create Bookss Table
CREATE TABLE Bookss (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    PublishedYear INT,
    UNIQUE (Title, PublishedYear),
    FOREIGN KEY (AuthorID) REFERENCES Authorss(AuthorID),
    CHECK (PublishedYear BETWEEN 1500 AND YEAR(GETDATE()))
);

-- Insert data into Bookss Table
INSERT INTO Bookss (BookID, Title, AuthorID, PublishedYear)
VALUES
(1, 'SQL', 1, 2020),
(2, 'Database Design', 2, 2018),
(3, 'SQL Basic', 3, 2022),
(4, 'Advanced SQL', 4, 2019);

-- Create Memberss Table
CREATE TABLE Memberss (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);
-- Insert data into Memberss Table
INSERT INTO Memberss (MemberID, FirstName, LastName, Email)
VALUES
(1, 'Sandhya', 'Yenkikar', 'sandhya.yenkikar@gmail.com'),
(2, 'Rutuja', 'Warke', 'rutuja.warke@gmail.com'),
(3, 'Prachi', 'Patil', 'prachi.patil@gmail.com'),
(4, 'Aishwarya', 'Mane', 'aishwarya.mane@gmail.com');

-- Create Loanss Table
CREATE TABLE Loanss (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Bookss(BookID),
    FOREIGN KEY (MemberID) REFERENCES Memberss(MemberID),
    CHECK (ReturnDate IS NULL OR ReturnDate > LoanDate)
);

-- Insert data into Loanss Table
INSERT INTO Loanss (LoanID, BookID, MemberID, LoanDate, ReturnDate)
VALUES
(1, 1, 1, '2025-01-01', NULL),
(2, 2, 2, '2025-01-05', '2025-01-10'),
(3, 3, 3, '2025-02-01', NULL),
(4, 4, 4, '2025-02-15', '2025-02-25');


-- Authorss Table
SELECT * FROM Authorss;

--  Bookss Table
SELECT * FROM Bookss;

-- Memberss Table
SELECT * FROM Memberss;

-- Loanss Table
SELECT * FROM Loanss;


