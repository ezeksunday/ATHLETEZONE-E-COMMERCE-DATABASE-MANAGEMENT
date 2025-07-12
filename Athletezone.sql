-- Create Database
CREATE DATABASE athletezoneDB;

--  Create Customer Table: 
CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY AUTO_INCREMENT,
	FirstName VARCHAR (50) NOT NULL,
	LastName VARCHAR (50) NOT NULL,
	Email VARCHAR (50) UNIQUE NOT NULL,
	JoinDate DATE NOT NULL);
    
-- Insert Records for atlease 3 Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, JoinDate)
VALUES	(1, 'Samuel', 'Aron', 'sam@yahoo.com', '2025-01-01'),
		(2, 'John', 'Gill', 'jonny@gmail.com', '2025-01-15'),
		(3, 'Stone', 'Garry', 'stonG77@hotmail.com', '2025-01-27'),
		(4, 'Barry', 'Adams', 'barryman@gmail.com', '2025-01-30');
    
-- Create Products Table
CREATE TABLE Products (
	ProductID INT PRIMARY KEY AUTO_INCREMENT, 
    ProductName VARCHAR (50) NOT NULL, 
    Price DECIMAL (10, 2), 
    StockQuantity INT NOT NULL);
    
-- Insert Records for atlease 3 different Products
INSERT INTO Products (ProductID, ProductName, Price, StockQuantity)
VALUES  (1, 'Treadmill', 179.99, 70),
		(2, 'Headphones', 64.99, 150),
		(3, 'Runnung Shoes', 100, 30),
		(4, 'Yoga Mat', 79.99, 200);
    
-- Create Orders Table
CREATE TABLE Orders (
	OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderDate DATE NOT NULL,
    QuantityOrdered INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID) ON DELETE CASCADE);

-- Insert Records for atleaset 3 Orders
INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, QuantityOrdered)
VALUES  (1, 3, 1, '2025-01-27', 1),
		(2, 4, 2, '2025-01-30', 3),
        (3, 2, 4, '2025-01-15', 2),
        (4, 1, 3, '2025-01-01', 2);

-- Barry has updated his email    
UPDATE Customers
SET Email = 'Barryadams777@hotmail'
WHERE FirstName = 'Barry' AND LastName = 'Adams';
-- Alternatively
UPDATE Customers
SET Email = 'Barryadams777@hotmail'
WHERE CustomerID = 4;
SELECT * FROM Customers;

-- The price of Treadmill has increase
UPDATE Products
SET Price = 199.99
WHERE ProductName = 'Treadmill';
-- Alternatively
UPDATE Products
SET Price = 199.99
WHERE ProductID = 1;

-- Customer requested a change in their order quantity from 2 to 1. Update the order record to reflect the new quantity.
UPDATE Orders
SET QuantityOrdered = 1
WHERE CustomerID = 1 AND OrderID = 4;
SELECT * FROM Orders;

-- A customer has requested that their account be deleted alter
DELETE FROM Customers
WHERE FirstName = 'John' AND LastName = 'Gill';
-- -- Alternatively
DELETE FROM Customers
WHERE CustomerID = 2;

-- One of the product is no longer available for sale and should be removed from the database.
DELETE FROM Products
WHERE ProductName = 'Running Shoes';

-- An order has been canceled by the customer (delete a specifict order recoprd)
DELETE FROM Orders
WHERE OrderID = 4;