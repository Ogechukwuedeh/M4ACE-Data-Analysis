-- WEEK 16 ASSIGNMENT 
-- DATA MANIPULATION AND OPTIMIZATION


-- CREATE DATABASE

CREATE DATABASE Store;

USE Store;


-- NORMALIZE DATA
-- Data is structured into two related tables to remove redundancy.

CREATE TABLE Customers (
	Customer_id INT PRIMARY KEY,
	Customer_name VARCHAR(50),
	City VARCHAR(50)
	);

CREATE TABLE Orders (
	Order_id INT PRIMARY KEY,
	Customer_id INT,
	Product_name VARCHAR(50),
	Amount INT

	FOREIGN KEY (Customer_id)
	REFERENCES Customers(Customer_id)
	);


-- INSERT DATA TO TABLES

INSERT INTO Customers VALUES 
(1, 'John', 'Lagos'),
(2, 'Mary', 'Abuja'),
(3, 'David', 'Enugu'),
(4, 'Grace', 'Benin'),
(5, 'Daniel', 'Port Harcourt'),
(6, 'Esther', 'Ibadan'),
(7, 'Micheal', 'Asaba'),
(8, 'Sarah', 'Owerri'),
(9, 'Paul', 'Kaduna'),
(10, 'Ruth', 'Uyo');

INSERT INTO Orders VALUES
(101, 1, 'Laptop', 350000),
(102, 2, 'Phone', 180000),
(103, 3, 'Headset', 25000),
(104, 4, 'Keyboard', 15000),
(105, 5, 'Mouse', 8000),
(106, 6, 'Monitor', 120000),
(107, 7, 'Tablet', 95000),
(108, 8, 'Printer', 70000),
(109, 9, 'Speaker', 30000),
(110, 10, 'Router', 20000);


-- VIEW TABLES

SELECT * FROM Customers;

SELECT * FROM Orders;


-- OPTIMIZE QUERIES
-- Improve performance using indexing and selective retrieval.

-- Original query
SELECT *
FROM Orders
WHERE Customer_id = 5;

-- Create index to improve performance.
CREATE INDEX IX_Orders_CustomerID
ON Orders(Customer_id);

-- Optimized query
SELECT 
	Order_id,
	Product_name,
	Amount
FROM Orders
WHERE Customer_id = 5;


-- IMPLEMENT BEST PRACTICES

-- INDEXING

CREATE INDEX IX_Customers_City
on Customers(City);

-- PROPER JOINS

-- INNER JOIN (Only matching records)
SELECT
	c.Customer_name,
	c.City,
	o.Product_name,
	o.Amount
FROM Customers c
INNER JOIN Orders o
ON c.Customer_id = o.Customer_id;

-- LEFT JOIN ( all customers plus matching orders)
SELECT
	c.Customer_name,
	o.Product_name
FROM Customers c
LEFT JOIN Orders o
ON c.Customer_id = o.Customer_id;

-- RIGHT JOIN (all orders plus matching customers)
SELECT
	c.Customer_name,
	o.Product_name
FROM Customers c
RIGHT JOIN Orders o
ON c.Customer_id = o.Customer_id;

-- FULL OUTER JOIN (all records from both tables)
SELECT
	c.Customer_name,
	o.Product_name
FROM Customers c
FULL OUTER JOIN Orders o
ON c.Customer_id = o.Customer_id;


-- FINAL DATA CHECK
SELECT * FROM Customers;
SELECT * FROM Orders;