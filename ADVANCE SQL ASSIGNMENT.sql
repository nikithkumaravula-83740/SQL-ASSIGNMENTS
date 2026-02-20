create database advance;
use advance;

-------- Products Table --------- 
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
INSERT INTO Products VALUES 
(1, 'Keyboard', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 800),
(3, 'Chair', 'Furniture', 2500),
(4, 'Desk', 'Furniture', 5500);
select * from products;
select * from sales;

-------- Sales Table --------- 
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO Sales VALUES 
(1, 1, 4, '2024-01-05'),
(2, 2, 10, '2024-01-06'),
(3, 3, 2, '2024-01-10'),
(4, 4, 1, '2024-01-11');


-- Q1. What is a Common Table Expression (CTE), and how does it improve SQL query readability?
-- Ans)  A Common Table Expression (CTE) is a temporary result set defined within a single query using the 
--       WITH clause. It improves readability by breaking complex queries into named, reusable subqueries, avoiding nested subqueries.​

-- Example;
WITH ProductRevenue AS (
    SELECT p.ProductName, p.Price * SUM(s.Quantity) AS Revenue
    FROM Products p JOIN Sales s using (productID)
    GROUP BY p.ProductID, p.ProductName, p.Price
)
SELECT * FROM ProductRevenue;

-- Q2. Why are some views updatable while others are read-only? Explain with an example.
-- Ans) Views are updatable if they meet criteria like containing no aggregate functions, DISTINCT, GROUP BY, 
--      or joins from multiple tables, and having a one-to-one relationship with base tables. Read-only views 
--      violate these (e.g., aggregated sales view can't be updated).
-- Example updatable view:
     CREATE VIEW vwSimpleProducts AS 
     SELECT ProductID, ProductName FROM Products;

-- Read-only example:
    CREATE VIEW vwAvgPrice AS 
    SELECT Category, AVG(Price) AS AvgPrice FROM Products GROUP BY Category; --Can't INSERT/UPDATE into this.

-- Q3. What advantages do stored procedures offer compared to writing raw SQL queries repeatedly?
--  Ans)  Stored procedures offer performance gains via pre-compilation and caching, reduced network traffic (execute once on server), enhanced security (no direct table access), and reusability to avoid repeating SQL code.
--        They centralize logic and allow parameters for flexibility.

-- Q4. What is the purpose of triggers in a database? Mention one use case where a trigger is essential.
-- Ans) Triggers automatically execute SQL in response to events like INSERT, UPDATE, DELETE on a table. Essential use case: audit logging, where a DELETE trigger records changes for compliance.
-- See Q10 for example.

-- Q5. Explain the need for data modelling and normalization when designing a database.
-- Ans) Data modeling designs efficient schemas (e.g., ER diagrams). Normalization eliminates redundancy (1NF-5NF) to prevent anomalies, ensure data integrity, and save storage—e.g., splitting customer and orders tables.

-- Q6. Write a CTE to calculate the total revenue for each product
--     (Revenues = Price × Quantity), and return only products where  revenue > 3000.
--  Ans) Use CTE to compute revenue (Price * total Quantity per product), filter where >= 3000.
WITH ProductRevenues AS (
    SELECT 
        p.ProductName,
        p.Price * SUM(s.Quantity) AS Revenue
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
    GROUP BY p.ProductID, p.ProductName, p.Price
)
SELECT * FROM ProductRevenues WHERE Revenue >= 3000;

-- Q7. Create a view named that shows:
--     Category, TotalProducts, AveragePrice
CREATE VIEW vwCategorySummary AS
SELECT 
    Category,
    COUNT(*) AS TotalProducts,
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;
select * from vwCategorySummary;

-- Q8. Create an updatable view containing ProductID, ProductName, and Price. --  Then update the p
CREATE VIEW vwProductPrice AS
SELECT ProductID, ProductName, Price
FROM Products
WHERE ProductID <= 4;  -- Simple, single-table for updatability
UPDATE vwProductPrice 
SET Price = 1300 
WHERE ProductID = 1;
select * from vwProductPrice;

-- Q9. Create a stored procedure that accepts a category name and returns all products belonging to that category.
DELIMITER //
CREATE PROCEDURE GetProductsByCategory(IN catName VARCHAR(50))
BEGIN
    SELECT * FROM Products WHERE Category = catName;
END //
DELIMITER ;
CALL GetProductsByCategory('Electronics'); --it calls the procedure with 'Electronics' as parameter

-- Q10. Create an AFTER DELETE trigger on the products table that archives deleted product rows into a new
--      table productArchive. The archive should store ProductID, ProductName, Category, Price, and DeletedAt
--      timestamp.
-- 
-- First, create archive table:
CREATE TABLE ProductArchive (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Trigger:
DELIMITER //
CREATE TRIGGER trg_ProductDelete 
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductArchive (ProductID, ProductName, Category, Price)
    VALUES (OLD.ProductID, OLD.ProductName, OLD.Category, OLD.Price);
END //
DELIMITER ;
DELETE FROM Products WHERE ProductID=1; -- archives the row.






