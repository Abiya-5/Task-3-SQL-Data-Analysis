-- 1. SELECT
SELECT
    "Order ID",
    "Order Date",
    "Customer Name",
    Category,
    Sales,
    Profit
FROM orders;


-- 2. WHERE
SELECT
    "Order ID",
    "Customer Name",
    Category,
    Sales,
    Profit
FROM orders
WHERE Sales > 500;


-- 3. ORDER BY
SELECT
    "Order ID",
    "Customer Name",
    Category,
    Sales,
    Profit
FROM orders
ORDER BY Sales DESC;


-- 4. GROUP BY
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 5. AGGREGATE FUNCTIONS
SELECT
    SUM(Sales) AS Total_Sales,
    AVG(Sales) AS Average_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Profit) AS Average_Profit,
    SUM(Quantity) AS Total_Quantity
FROM orders;


-- 6. SALES BY REGION
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 7. CUSTOMER REVENUE
SELECT
    "Customer Name",
    SUM(Sales) AS Total_Revenue
FROM orders
GROUP BY "Customer Name"
ORDER BY Total_Revenue DESC;


-- 8. AVERAGE REVENUE PER USER
SELECT
    AVG(Total_Revenue) AS Average_Revenue_Per_User
FROM
(
    SELECT
        "Customer Name",
        SUM(Sales) AS Total_Revenue
    FROM orders
    GROUP BY "Customer Name"
);


-- 9. CREATE CUSTOMERS TABLE FOR JOIN
CREATE TABLE customers AS
SELECT DISTINCT
    "Customer Name",
    City,
    Country,
    State,
    Region,
    Segment
FROM orders;


-- 10. INNER JOIN
SELECT
    c."Customer Name",
    c.Country,
    c.Region,
    o."Order ID",
    o.Sales,
    o.Profit
FROM customers c
INNER JOIN orders o
ON c."Customer Name" = o."Customer Name";


-- 11. LEFT JOIN
SELECT
    c."Customer Name",
    c.Country,
    o."Order ID",
    o.Sales
FROM customers c
LEFT JOIN orders o
ON c."Customer Name" = o."Customer Name";


-- 12. CREATE VIEW
CREATE VIEW category_sales AS
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM orders
GROUP BY Category;


-- 13. DISPLAY VIEW
SELECT *
FROM category_sales
ORDER BY Total_Sales DESC;


-- 14. CREATE INDEX
CREATE INDEX idx_customer_name
ON orders("Customer Name");


-- 15. CREATE INDEX ON CATEGORY
CREATE INDEX idx_category
ON orders(Category);


-- 16. CHECK INDEXES
PRAGMA index_list(orders);