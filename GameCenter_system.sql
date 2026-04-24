-- Create the database if it doesn't already exist
CREATE DATABASE IF NOT EXISTS GameCenter_System3;
USE GameCenter_System3;

-- Table for managing customer data and loyalty points
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20) UNIQUE,
    Email VARCHAR(100),
    CustomerType ENUM('VIP', 'Regular') DEFAULT 'Regular',
    Points INT DEFAULT 0,
    AccountBalance DECIMAL(10, 2) DEFAULT 0.00,
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for gaming consoles, PCs, and hardware status
CREATE TABLE Devices (
    DeviceID INT PRIMARY KEY AUTO_INCREMENT,
    DeviceName VARCHAR(50),
    DeviceType VARCHAR(50),
    HourlyRate DECIMAL(10, 2),
    Status ENUM('Available', 'In Use', 'Maintenance', 'Reserved') DEFAULT 'Available',
    Specs TEXT,
    Location_Zone VARCHAR(50)
);

-- Table for employee information
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    Salary DECIMAL(10, 2),
    Phone VARCHAR(20)
);

-- Tracking employee work hours and cash handling
CREATE TABLE Staff_Shifts (
    ShiftID INT PRIMARY KEY AUTO_INCREMENT,
    StaffID INT,
    ShiftStart DATETIME,
    ShiftEnd DATETIME,
    Cash_In_Hand DECIMAL(10, 2),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Library of games available in the center
CREATE TABLE Games (
    GameID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Category VARCHAR(50),
    Platform VARCHAR(50),
    AgeRating VARCHAR(10)
);

-- Main table for device reservations/rentals
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    DeviceID INT,
    StaffID INT,
    StartTime DATETIME,
    EndTime DATETIME,
    TotalHours DECIMAL(5, 2),
    TotalCost DECIMAL(10, 2),
    Status ENUM('Ongoing', 'Completed', 'Cancelled'),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (DeviceID) REFERENCES Devices(DeviceID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Inventory for the cafeteria or accessory shop
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category ENUM('Drink', 'Food', 'Accessory'),
    BuyPrice DECIMAL(10, 2),
    SellPrice DECIMAL(10, 2),
    CurrentStock INT
);

-- Vendor management
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100),
    ContactPhone VARCHAR(20),
    MainCategory VARCHAR(50)
);

-- Logging hardware repairs and costs
CREATE TABLE Maintenance (
    MaintenanceID INT PRIMARY KEY AUTO_INCREMENT,
    DeviceID INT,
    StaffID INT,
    IssueDescription TEXT,
    RepairCost DECIMAL(10, 2),
    Status ENUM('Pending', 'In Progress', 'Fixed'),
    MaintenanceDate DATE,
    FOREIGN KEY (DeviceID) REFERENCES Devices(DeviceID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);



-- Billing and payment records
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    StaffID INT,
    BookingID INT NULL,
    DiscountAmount DECIMAL(10, 2) DEFAULT 0.00,
    TotalAmount DECIMAL(10, 2),
    PaymentMethod ENUM('Cash', 'Card', 'Wallet'),
    InvoiceDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Security and audit trail for system actions
CREATE TABLE SystemLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    StaffID INT,
    Action VARCHAR(255),
    ActionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);



