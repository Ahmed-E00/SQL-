USE GameCenter_System3;


INSERT INTO Staff (Name, Role, Salary, Phone) 
VALUES ('Abdullah Al-Farsi', 'Security', 4000, '0500112233');

INSERT INTO Devices (DeviceName, DeviceType, HourlyRate, Status, Specs, Location)
VALUES ('PS5-Pro-01', 'PS5', 50, 'Available', '8K Support, Pro Controller', 'VIP Room');


UPDATE Staff 
SET Salary = 9500 
WHERE Name = 'Khalid Al-Obeid';

UPDATE Devices 
SET Status = 'In Use' 
WHERE DeviceName = 'VR-Elite-02';

UPDATE Customers 
SET Points = Points + 50 
WHERE Name = 'Ahmed Mansour';


DELETE FROM Staff 
WHERE Name = 'Sarah Al-Mansour';

DELETE FROM Devices 
WHERE DeviceName = 'Xbox-SX-02';

DELETE FROM Customers 
WHERE Email = 'faisal@mail.com';






SELECT * FROM Staff;

SELECT * FROM Customers;

SELECT * FROM Devices;

SELECT * FROM Bookings;

SELECT * FROM Invoices;

SELECT * FROM Products;

SELECT * FROM Games;

SELECT * FROM Maintenance;

SELECT * FROM Suppliers;

SELECT * FROM Staff_Shifts;

SELECT * FROM SystemLogs;

