-- Set the seed for random number generation
SET @seed = 2024;

-- Customers Table
INSERT INTO Customers (Name, Email, Phone)
SELECT
    CONCAT('Customer', id) AS Name,
    CONCAT('customer', id, '@example.com') AS Email,
    CONCAT('555-123-456', LPAD(id, 3, '0')) AS Phone
FROM
    (SELECT (ROW_NUMBER() OVER ()) AS id FROM Information_Schema.Columns) AS t
LIMIT 100;

-- Products Table
-- Insert 10 Products with Random Prices
INSERT INTO Products (Name, Category, Price) VALUES
    ('Milk', 'Dairy', ROUND(RAND(@seed) * 5 + 1, 2)),
    ('Bread', 'Bakery', ROUND(RAND(@seed) * 4 + 1, 2)),
    ('Apples', 'Produce', ROUND(RAND(@seed) * 3 + 1, 2)),
    ('Bananas', 'Produce', ROUND(RAND(@seed) * 3 + 1, 2)),
    ('Chicken', 'Meat', ROUND(RAND(@seed) * 10 + 5, 2)),
    ('Eggs', 'Dairy', ROUND(RAND(@seed) * 3 + 2, 2)),
    ('Potatoes', 'Produce', ROUND(RAND(@seed) * 2 + 1, 2)),
    ('Cheese', 'Dairy', ROUND(RAND(@seed) * 7 + 3, 2)),
    ('Orange Juice', 'Beverages', ROUND(RAND(@seed) * 4 + 2, 2)),
    ('Pasta', 'Pantry', ROUND(RAND(@seed) * 3 + 2, 2));

-- Sales Table

-- Insert 100 Sales Instances
INSERT INTO Sales (CustomerID, ProductID, Quantity, TotalPrice, SaleDate)
SELECT
    CEIL(RAND(@seed) * 100) AS CustomerID,
    CEIL(RAND(@seed) * 10) AS ProductID,
    CEIL(RAND(@seed) * 10) AS Quantity,
    ROUND(RAND(@seed) * 50 + 1, 2) AS TotalPrice,
    DATE_ADD('2024-01-01', INTERVAL CEIL(RAND(@seed) * 365) DAY) AS SaleDate
FROM
    Information_Schema.Columns
LIMIT 100;
