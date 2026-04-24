USE GameCenter_System3;

select *from Staff;

update staff
set salary = 8000
where staffID = 5;
rollback;
 
-- 1. Staff Members
INSERT INTO Staff (Name, Role, Salary, Phone) VALUES 
('Khalid Al-Obeid', 'Manager', 9000, '0500112233'),
('Sarah Al-Mansour', 'Reception', 4200, '0500445566'),
('Youssef Idris', 'Technician', 5500, '0500778899'),
('Fahad Al-Otaibi', 'Security', 3500, '0500998877'),
('Mohamed Al-Amin', 'Admin', 7500, '0500223344');

-- 2. Customers (10 Records)
INSERT INTO Customers (Name, PhoneNumber, Email, CustomerType, Points, AccountBalance) VALUES 
('Mohamed Khalid', '0551112223', 'moe@mail.com', 'VIP', 100, 500),
('Ahmed Mansour', '0598887771', 'ahmed@mail.com', 'Regular', 50, 100),
('Sultan Otaibi', '0598887772', 'sultan@mail.com', 'VIP', 200, 750),
('Fahad Ghamdi', '0560001111', 'fahad@mail.com', 'VIP', 500, 1500),
('Reem Qahtani', '0560002222', 'reem@mail.com', 'Regular', 45, 50),
('Ali Jaber', '0540001112', 'ali@mail.com', 'Regular', 10, 50),
('Hind Suwaidi', '0540003334', 'hind@mail.com', 'VIP', 300, 1200),
('Mansour Shammari', '0560003333', 'mansour@mail.com', 'Regular', 10, 0),
('Noura Saad', '0560004444', 'noura@mail.com', 'VIP', 850, 2000),
('Faisal Harbi', '0560005555', 'faisal@mail.com', 'Regular', 120, 300);

-- 3. Devices (10 Records)
INSERT INTO Devices (DeviceName, DeviceType, HourlyRate, Status, Specs, Location_Zone) VALUES 
('PS5-VIP-01', 'PS5', 40, 'Available', '4K TV, DualSense Edge', 'VIP Room'),
('PC-PRO-05', 'PC', 35, 'In Use', 'RTX 4080, 144Hz Monitor', 'Pro Zone'),
('VR-Zone-01', 'VR', 55, 'Available', 'Meta Quest 3', 'VR Area'),
('Xbox-SX-02', 'Xbox', 25, 'Maintenance', 'Series X, 1TB', 'Main Hall'),
('PC-Gaming-02', 'PC', 30, 'Available', 'RTX 3070', 'Main Hall'),
('PS5-Main-03', 'PS5', 25, 'In Use', 'HD Monitor', 'Main Hall'),
('VR-Elite-02', 'VR', 75, 'Available', 'Valve Index', 'VIP Room'),
('PC-Ultra-03', 'PC', 45, 'Available', 'RTX 4090', 'Pro Zone'),
('PC-Ultra-04', 'PC', 45, 'In Use', 'RTX 4090', 'Pro Zone'),
('Switch-01', 'Nintendo', 20, 'Available', 'OLED Model', 'Kids Area');

-- 4. Products (10 Records)
INSERT INTO Products (ProductName, Category, BuyPrice, SellPrice, CurrentStock) VALUES 
('Pepsi', 'Drink', 1.50, 4.00, 200),
('Coca Cola', 'Drink', 1.50, 4.00, 120),
('Red Bull', 'Drink', 8.00, 15.00, 60),
('Water Bottle', 'Drink', 0.50, 1.00, 500),
('Sandwich', 'Food', 5.00, 12.00, 40),
('Potato Chips', 'Food', 2.00, 6.00, 80),
('Chocolate Bar', 'Food', 2.00, 5.00, 150),
('Gaming Mouse Pad', 'Accessory', 20.00, 45.00, 30),
('Headset Pad', 'Accessory', 10.00, 25.00, 15),
('Gaming Headset', 'Accessory', 120.00, 250.00, 5);

-- 5. Bookings (10 Records)
INSERT INTO Bookings (CustomerID, DeviceID, StaffID, StartTime, EndTime, TotalHours, TotalCost, Status) VALUES 
(1, 1, 2, '2025-12-19 20:00:00', '2025-12-19 23:00:00', 3.0, 120.00, 'Completed'),
(2, 3, 2, '2025-12-19 21:00:00', '2025-12-19 22:30:00', 1.5, 82.50, 'Completed'),
(3, 4, 5, '2025-12-19 22:00:00', '2025-12-19 23:00:00', 1.0, 75.00, 'Completed'),
(4, 2, 2, '2025-12-19 14:00:00', '2025-12-19 17:00:00', 3.0, 135.00, 'Completed'),
(5, 6, 2, '2025-12-19 15:00:00', '2025-12-19 18:00:00', 3.0, 105.00, 'Completed'),
(6, 9, 5, '2025-12-19 18:00:00', '2025-12-19 19:00:00', 1.0, 45.00, 'Ongoing'),
(7, 1, 2, '2025-12-19 10:00:00', '2025-12-19 12:00:00', 2.0, 80.00, 'Completed'),
(8, 2, 2, '2025-12-19 13:00:00', '2025-12-19 16:00:00', 3.0, 105.00, 'Completed'),
(9, 5, 2, '2025-12-19 12:00:00', '2025-12-19 14:00:00', 2.0, 60.00, 'Completed'),
(10, 8, 5, '2025-12-19 16:00:00', '2025-12-19 18:00:00', 2.0, 90.00, 'Ongoing');

-- 6. Invoices (5 Records)
INSERT INTO Invoices (CustomerID, StaffID, BookingID, TotalAmount, PaymentMethod) VALUES 
(1, 2, 1, 120.00, 'Card'),
(3, 5, 3, 115.00, 'Wallet'),
(4, 2, 4, 140.00, 'Card'),
(8, 2, 8, 405.00, 'Wallet'),
(5, 2, 5, 105.00, 'Cash');

-- 7. Maintenance (5 Records)
INSERT INTO Maintenance (DeviceID, StaffID, IssueDescription, RepairCost, Status, MaintenanceDate) VALUES 
(4, 3, 'Overheating', 200.00, 'In Progress', '2025-12-19'),
(2, 3, 'Controller Drift', 50.00, 'Fixed', '2025-12-18'),
(1, 3, 'Software Update', 0.00, 'Fixed', '2025-12-10'),
(5, 3, 'Network Failure', 0.00, 'Pending', '2025-12-19'),
(3, 3, 'Cleaning', 30.00, 'Fixed', '2025-12-15');

-- 8. Shifts and System Logs
INSERT INTO Staff_Shifts (StaffID, ShiftStart, ShiftEnd, Cash_In_Hand) VALUES 
(2, '2025-12-19 08:00:00', '2025-12-19 16:00:00', 1500.00);

INSERT INTO SystemLogs (StaffID, Action) VALUES 
(1, 'Weekly Audit Started'), 
(3, 'Inventory Checked');