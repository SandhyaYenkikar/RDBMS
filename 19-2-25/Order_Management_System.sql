USE JIBE_Main_Training;

CREATE TABLE Orderss(
order_Id INT PRIMARY KEY,
customer_Name VARCHAR (50),
product_Name VARCHAR (50),
quantity VARCHAR (50),
price DECIMAL (10,2),
order_Date DATE
);

INSERT INTO Orderss (order_Id, customer_Name, product_Name, quantity, price, order_Date) VALUES
(1, 'Customer1', 'Pen', '10', 15.00, '2025-02-18'),
(2, 'Customer2', 'Pencil', '20', 5.00, '2025-02-19'),
(3, 'Customer3', 'Notebook', '15', 45.00, '2025-02-20'),
(4, 'Customer4', 'Eraser', '30', 3.00, '2025-02-21'),
(5, 'Customer5', 'Marker', '12', 25.00, '2025-02-22'),
(6, 'Customer6', 'Stapler', '5', 60.00, '2025-02-23'),
(7, 'Customer7', 'Ruler', '18', 10.00, '2025-02-24'),
(8, 'Customer8', 'Glue Stick', '22', 12.00, '2025-02-25'),
(9, 'Customer9', 'Highlighter', '16', 20.00, '2025-02-26'),
(10, 'Customer10', 'Scissors', '8', 50.00, '2025-02-27');

SELECT * FROM Orderss

UPDATE Orderss SET quantity = '25' WHERE order_Id = 2;

DELETE Orderss WHERE quantity < 10;

