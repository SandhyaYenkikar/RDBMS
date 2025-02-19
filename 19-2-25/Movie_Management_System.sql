USE JIBE_Main_Training

CREATE TABLE Bookingss (

 Booking_Id VARCHAR (30) PRIMARY KEY,
 customer_Name VARCHAR (50),
 movie_Name VARCHAR (50),
 seats_Booked INT,
 total_Price INT 
 
 );

 INSERT INTO Bookingss 
 (Booking_Id, customer_Name, movie_Name, seats_Booked, total_Price) VALUES
	(1, 'Sandhya', 'Chaava', 2, 500.00),
    (2, 'Alice', 'Sky Force', 3, 750.00),
    (3, 'Prachi', 'Mrs', 1, 250.00),
    (4, 'Rutuja', 'Three Idiots', 4, 1000.00);


BEGIN TRANSACTION;
SAVE TRANSACTION BeforeUpdate;

UPDATE Bookingss SET seats_Booked = 5, total_Price = 1250.00 WHERE Booking_ID = 2;

ROLLBACK TRANSACTION BeforeUpdate;

COMMIT;

SELECT * FROM Bookingss;