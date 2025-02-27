-- Customer Table
CREATE TABLE Customer_11 ( 
    ID INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    address VARCHAR(255)
);

-- Rooms Table
CREATE TABLE Rooms_11 ( 
    Room_ID INT PRIMARY KEY,
    room_type VARCHAR(40),
    pricePerNight DECIMAL(10,2),
    status VARCHAR(40)
);

/*-- Update the status of Room_ID 1 to "Occupied"
UPDATE Rooms_11
SET status = 'Occupied'
WHERE Room_ID = 1;*/

-- Verify the update
SELECT * FROM Rooms_11;


-- Bookings Table
CREATE TABLE Bookings_11 ( 
    Booking_ID INT PRIMARY KEY,
    customer_id INT,
    Room_ID INT,
    checkIn_Date DATE,
    checkOut_Date DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer_11(ID),
    FOREIGN KEY (Room_ID) REFERENCES Rooms_11(Room_ID)
);
-- Insert a new booking record for Room_ID 1
INSERT INTO Bookings_11 (Booking_ID, customer_id, Room_ID, checkIn_Date, checkOut_Date, TotalAmount) VALUES
(6, 1, 1, '2025-03-01', '2025-03-03', 200.00);

-- Verify the insertion
SELECT * FROM Bookings_11;


-- Payments Table
CREATE TABLE Payments_11 ( 
    Payment_ID INT PRIMARY KEY,
    booking_id INT,
    payment_date DATE,
    pay_method VARCHAR(255),
    amount DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES Bookings_11(Booking_ID)
);

-- Services Table
CREATE TABLE Services_11 ( 
    Service_ID INT PRIMARY KEY,
    serviceName VARCHAR(255),
    price DECIMAL(10,2)
);

-- Employees Table
CREATE TABLE Employees_11 ( 
    Employee_ID INT PRIMARY KEY,
    emp_name VARCHAR(255),
    position VARCHAR(255),
    salary DECIMAL(10,2),
    HireDate DATE,
    ManagerId INT,
    FOREIGN KEY (ManagerId) REFERENCES Employees_11(Employee_ID)
);

-- Hotel_Branch Table
CREATE TABLE Hotel_Branch_11 ( 
    Branch_ID INT PRIMARY KEY,
    branch_Name VARCHAR(255),
    Location VARCHAR(255)
);

-- Service_Requests Table
CREATE TABLE Service_Requests_11 ( 
    request_ID INT PRIMARY KEY,
    booking_id INT,
    service_id INT,
    req_date DATE,
    quantity INT,
    total_price DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES Bookings_11(Booking_ID),
    FOREIGN KEY (service_id) REFERENCES Services_11(Service_ID)
);
-- Insert records into Customer_11 table
INSERT INTO Customer_11 (ID, name, email, phone, address) VALUES
(1, 'John Doe', 'john.doe@example.com', '1234567890', '123 Main St'),
(2, 'Jane Smith', 'jane.smith@example.com', '0987654321', '456 Oak St'),
(3, 'Alice Johnson', 'alice.johnson@example.com', '1112223333', '789 Pine St'),
(4, 'Bob Brown', 'bob.brown@example.com', '4445556666', '101 Maple St'),
(5, 'Charlie Davis', 'charlie.davis@example.com', '7778889999', '202 Cedar St');

SELECT * FROM Customer_11

-- Insert records into Rooms_11 table
INSERT INTO Rooms_11 (Room_ID, room_type, pricePerNight, status) VALUES
(1, 'Single', 100.00, 'Available'),
(2, 'Double', 150.00, 'Occupied'),
(3, 'Suite', 200.00, 'Available'),
(4, 'Deluxe', 250.00, 'Under Maintenance'),
(5, 'Penthouse', 500.00, 'Available');

SELECT * FROM Rooms_11

-- Insert records into Bookings_11 table
INSERT INTO Bookings_11 (Booking_ID, customer_id, Room_ID, checkIn_Date, checkOut_Date, TotalAmount) VALUES
(1, 1, 1, '2025-02-20', '2025-02-22', 200.00),
(2, 2, 2, '2025-02-23', '2025-02-25', 300.00),
(3, 3, 3, '2025-02-24', '2025-02-26', 400.00),
(4, 4, 4, '2025-02-25', '2025-02-27', 500.00),
(5, 5, 5, '2025-02-26', '2025-02-28', 1000.00);

SELECT * FROM Bookings_11

-- Insert records into Payments_11 table
INSERT INTO Payments_11 (Payment_ID, booking_id, payment_date, pay_method, amount) VALUES
(1, 1, '2025-02-21', 'Credit Card', 200.00),
(2, 2, '2025-02-24', 'Cash', 300.00),
(3, 3, '2025-02-25', 'Debit Card', 400.00),
(4, 4, '2025-02-26', 'Credit Card', 500.00),
(5, 5, '2025-02-27', 'Online', 1000.00);

-- Insert records into Services_11 table
INSERT INTO Services_11 (Service_ID, serviceName, price) VALUES
(1, 'Room Service', 50.00),
(2, 'Spa', 100.00),
(3, 'Gym', 20.00),
(4, 'Laundry', 30.00),
(5, 'Breakfast', 15.00);

-- Insert records into Employees_11 table
INSERT INTO Employees_11 (Employee_ID, emp_name, position, salary, HireDate, ManagerId) VALUES
(1, 'Sarah Connor', 'Manager', 5000.00, '2020-01-15', NULL),
(2, 'James Bond', 'Receptionist', 3000.00, '2021-03-10', 1),
(3, 'Ellen Ripley', 'Housekeeper', 2500.00, '2021-04-20', 1),
(4, 'John McClane', 'Chef', 4000.00, '2022-05-05', 1),
(5, 'Indiana Jones', 'Bellhop', 2000.00, '2022-07-12', 1);

-- Insert records into Hotel_Branch_11 table
INSERT INTO Hotel_Branch_11 (Branch_ID, branch_Name, Location) VALUES
(1, 'Central Plaza', 'Downtown'),
(2, 'Seaside Retreat', 'Coastal Area'),
(3, 'Mountain Lodge', 'Hillside'),
(4, 'Urban Oasis', 'City Center'),
(5, 'Countryside Inn', 'Rural Area');

-- Insert records into Service_Requests_11 table
INSERT INTO Service_Requests_11 (request_ID, booking_id, service_id, req_date, quantity, total_price) VALUES
(1, 1, 1, '2025-02-21', 2, 100.00),
(2, 2, 2, '2025-02-24', 1, 100.00),
(3, 3, 3, '2025-02-25', 3, 60.00),
(4, 4, 4, '2025-02-26', 1, 30.00),
(5, 5, 5, '2025-02-27', 2, 30.00);

-- Correcting the View for Active Bookings
CREATE VIEW active_bookings_1111 AS
SELECT 
    c.name AS customerName,
    r.room_type AS roomType,
    b.checkIn_Date AS checkinDate,
    b.checkOut_Date AS checkoutDate
FROM 
    Customer_11 c
JOIN 
    Bookings_11 b ON c.ID = b.customer_id
JOIN 
    Rooms_11 r ON b.Room_ID = r.Room_ID
WHERE 
    GETDATE() BETWEEN b.checkIn_Date AND b.checkOut_Date;

-- Stored Procedure for Monthly Revenue
GO
CREATE PROCEDURE getMonthlyRevenue_1111
    @year INT,
    @month INT
AS
BEGIN
    SELECT SUM(TotalAmount) AS TotalRevenue
    FROM Bookings_11
    WHERE 
        YEAR(checkIn_Date) = @Year AND MONTH(checkIn_Date) = @Month
        OR 
        YEAR(checkOut_Date) = @Year AND MONTH(checkOut_Date) = @Month;
END;

-- User-Defined Function for Total Stay Days
GO
CREATE FUNCTION fn_CalculateTotalNoOfDays_1111 (@customerId INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalDays INT;

    SELECT @TotalDays = SUM(DATEDIFF(DAY, checkIn_Date, checkOut_Date))
    FROM Bookings_11
    WHERE customer_id = @customerId;

    RETURN @TotalDays;
END;

-- Trigger to Update Room Status on Booking Cancellation
GO
CREATE TRIGGER trg_UpdateRoomStatusOnCancellations_1111
ON Bookings_11
AFTER DELETE
AS
BEGIN
    UPDATE Rooms_11
    SET status = 'Available'
    WHERE Room_ID IN (SELECT Room_ID FROM deleted);
END;

GO
CREATE TRIGGER trg_UpdateRoomStatusOnBookings_1111
ON Bookings_11
AFTER INSERT
AS
BEGIN
    UPDATE Rooms_11
    SET status = 'Booked'
    WHERE Room_ID IN (SELECT Room_ID FROM inserted);
END;

-- Full-Text Search Setup
EXEC sp_fulltext_database 'enable';

CREATE FULLTEXT CATALOG RoomCatalog_1_1 AS DEFAULT;

CREATE UNIQUE INDEX idx_room_id_1_1 ON Rooms_11(Room_ID);

CREATE FULLTEXT INDEX ON Rooms_11(room_type)
KEY INDEX idx_room_id_1_1;

-- Implementing Full-Text Search Query
SELECT Room_ID, room_type, pricePerNight, status
FROM Rooms_11
WHERE CONTAINS(room_type, 'Double');

/*
-- Security & Privileges
CREATE ROLE hotelManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Bookings_11 TO hotelManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Payments_11 TO hotelManager;

CREATE ROLE FrontDeskStaff;
GRANT SELECT ON Rooms_11 TO FrontDeskStaff;

-- Backup and Restore
BACKUP DATABASE JIBE_Main_Training
TO DISK = 'C:\Backup\j2Db_Backup.bak'
WITH FORMAT, INIT;

-- Restore
RESTORE DATABASE JIBE_Main_Training
FROM DISK = 'C:\Backup\j2Db_Backup.bak'
WITH REPLACE;*/