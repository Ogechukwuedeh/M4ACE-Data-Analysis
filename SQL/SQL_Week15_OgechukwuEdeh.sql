-- WEEK 14 ASSIGNMENT - WORKING WITH TABLES


-- CREATE DATABASE

--CREATE DATABASE Store;

--USE Store;


---- Create two related tables and establish foreign key relationships.

---- CREATE TABLES

---- Create Table 1: Customers

--CREATE TABLE Customers (
--	Customer_id INT PRIMARY KEY,
--	Customer_name VARCHAR(50),
--	City VARCHAR(50)
--	);

---- Create Table 2: Orders

--CREATE TABLE Orders (
--	Order_id INT PRIMARY KEY,
--	Customer_id INT,
--	Product_name VARCHAR(50),
--	Amount INT

--	FOREIGN KEY (Customer_id)
--	REFERENCES Customers(Customer_id)
--	);


---- INSERT DATA TO TABLES

---- Insert data into Customers table.

--INSERT INTO Customers VALUES 
--(1, 'John', 'Lagos'),
--(2, 'Mary', 'Abuja'),
--(3, 'David', 'Enugu'),
--(4, 'Grace', 'Benin'),
--(5, 'Daniel', 'Port Harcourt'),
--(6, 'Esther', 'Ibadan'),
--(7, 'Micheal', 'Asaba'),
--(8, 'Sarah', 'Owerri'),
--(9, 'Paul', 'Kaduna'),
--(10, 'Ruth', 'Uyo');

---- Insert data into Orders table.

--INSERT INTO Orders VALUES
--(101, 1, 'Laptop', 350000),
--(102, 2, 'Phone', 180000),
--(103, 3, 'Headset', 25000),
--(104, 4, 'Keyboard', 15000),
--(105, 5, 'Mouse', 8000),
--(106, 6, 'Monitor', 120000),
--(107, 7, 'Tablet', 95000),
--(108, 8, 'Printer', 70000),
--(109, 9, 'Speaker', 30000),
--(110, 10, 'Router', 20000);


---- VIEW TABLES

--SELECT * FROM Customers;

--SELECT * FROM Orders;


---- Use JOIN queries to merge data across tables.

---- INNER JOIN

--SELECT
--	Customers.Customer_name,
--	Orders.Product_name
--FROM Customers
--INNER JOIN Orders
--	ON Customers.Customer_id = Orders.Customer_id;

---- RIGHT JOIN

--SELECT
--	Customers.Customer_name,
--	Orders.Product_name
--FROM Customers
--RIGHT JOIN Orders
--	ON Customers.Customer_id = Orders.Customer_id;

---- FULL OUTER JOIN

--SELECT
--	Customers.Customer_name,
--	Orders.Product_name
--FROM Customers
--FULL OUTER JOIN Orders
--	ON Customers.Customer_id = Orders.Customer_id;


---- Perform aggregation operations to summarize data.

---- AGGREGATION FUNCTION 

---- Total Customers

--SELECT COUNT(*) AS Total_customers
--FROM Customers;

---- Total Sales

--SELECT SUM(Amount) AS Total_sales
--FROM Orders;

---- Average Sales

--SELECT AVG(Amount) AS Average_sales
--FROM Orders;

---- Highest Sale

--SELECT MAX(Amount) AS Highest_sale
--FROM Orders;

---- Lowest Sale

--SELECT MIN(Amount) AS Lowest_sale
--FROM Orders;


---- CASE STATEMENT

--SELECT Product_name, Amount,
--CASE
--	WHEN Amount >= 100000 THEN 'Expensive Product'
--	ELSE 'Affordable Product'
--END AS Product_category
--FROM Orders;


---- UNION OPERATOR

--SELECT Customer_name AS Names
--FROM Customers
--UNION
--SELECT Product_name
--FROM Orders;


---- Practice updating and deleting records.

----UPDATE RECORD

--UPDATE Customers
--SET City = 'Calabar'
--WHERE Customer_id = 3;

---- View Updated Customer

--SELECT *
--FROM Customers
--WHERE Customer_id = 3;


---- DELETE RECORD

--DELETE FROM Orders
--WHERE Order_id = 110;


---- View Updated Tables

--SELECT * FROM Customers;

--SELECT * FROM Orders;




-- WEEK 15 ASSIGNMENT

USE Store;

-- Use subqueries to extract specific data.

-- Finding customers whose order amount is above the average order amount.

SELECT 
	Customer_id,
	Product_name,
	Amount
FROM Orders
WHERE Amount > (SELECT AVG(Amount) FROM Orders);

SELECT 
	Customer_id,
	Product_name,
	Amount,
	(SELECT AVG(Amount) FROM Orders) AS Avg_amount
FROM Orders;

SELECT 
	Customer_id,
	Product_name,
	Amount,
	AVG(Amount) OVER () AS Avg_amount
FROM Orders;


-- Common Table Expression (CTE)

WITH SalesCTE AS (
	SELECT
		Customer_id,
		Product_name,
		Amount
	FROM Orders
)
SELECT * FROM SalesCTE;


-- Temporary Table (Temp table)

CREATE TABLE #HighValueOrders ( 
	Order_id INT,
	Product_name VARCHAR(50),
	Amount INT
);

INSERT INTO #HighValueOrders
SELECT
	Order_id,
	Product_name,
	Amount
FROM Orders
WHERE Amount > 50000;

SELECT * FROM #HighValueOrders;


-- Implement window functions to rank data.

-- Rank orders from highest to lowest amount.

SELECT
	Order_id,
	Product_name,
	Amount,
	RANK() OVER (ORDER BY Amount DESC) AS Sales_rank
FROM Orders;


-- Optimize database performance using indexes.
CREATE INDEX IX_Orders_CustomerID
ON Orders(Customer_id);

CREATE INDEX IX_Orders_Customers_City
ON Customers(City);

SELECT * FROM Orders;

SELECT * FROM Customers;