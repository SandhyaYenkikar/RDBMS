--Book Store Management System
-- Customers table
CREATE TABLE Customers_1 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Customers_1 (CustomerID, CustomerName) VALUES
(1, 'Sandhya Yenkikar'),
(2, 'Anna Gupta'),
(3, 'Rohan Verma'),
(4, 'Varun Sharma'),
(5, 'Tarun Gupta');

-- Books table
CREATE TABLE Books_1 (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT
);

INSERT INTO Books_1 (BookID, Title, Price, Stock) VALUES
(1, 'SQL Basics', 19.99, 10),
(2, 'Angular Concepts', 24.99, 0),
(3, 'Typescript Basics', 29.99, 5),
(4, 'Learn JS', 39.99, 0),
(5, 'Web Devlopment', 14.99, 7);

-- Orders table
CREATE TABLE Orders_1 (
    OrderID INT PRIMARY KEY,
    CustomerID INT, 
    BookID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers_1(CustomerID),
    FOREIGN KEY (BookID) REFERENCES Books_1(BookID)
);

INSERT INTO Orders_1 (OrderID, CustomerID, BookID, OrderDate) VALUES
(1, 1, 1, '2025-01-10'),
(2, 1, 3, '2025-01-12'),
(3, 2, 4, '2025-01-15'),
(4, 3, 1, '2025-01-20');

-- Task 1: Identify Active Customers
SELECT CustomerID, CustomerName
FROM Customers_1
WHERE EXISTS (SELECT  1 FROM Orders_1 WHERE Customers_1.CustomerID = Orders_1.CustomerID);
SELECT * FROM Customers_1;

-- Task 2: Find Books That Have Never Been Ordered
SELECT BookID, Title
FROM Books_1
WHERE NOT EXISTS (SELECT 1 FROM Orders_1 WHERE Books_1.BookID = Orders_1.BookID);

-- Task 3: List Books That Are Out of Stock
SELECT BookID, Title
FROM Books_1
WHERE Stock = 0;

-- Task 5: Find the Most Expensive Ordered Book
SELECT BookID, Title, Price
FROM Books_1
WHERE Price = (SELECT MAX(Price) FROM Books_1 WHERE BookID IN (SELECT BookID FROM Orders_1));

