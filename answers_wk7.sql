-- Question 1
WITH RECURSIVE SplitProducts AS (
    SELECT
        OrderID,
        CustomerName,
        TRIM(SUBSTRING_INDEX(Products, ',', 1)) AS Product,
        SUBSTRING(Products, LENGTH(SUBSTRING_INDEX(Products, ',', 1)) + 2) AS Remaining
    FROM ProductDetail

    UNION ALL

    SELECT
        OrderID,
        CustomerName,
        TRIM(SUBSTRING_INDEX(Remaining, ',', 1)) AS Product,
        SUBSTRING(Remaining, LENGTH(SUBSTRING_INDEX(Remaining, ',', 1)) + 2)
    FROM SplitProducts
    WHERE Remaining <> ''
)

SELECT OrderID, CustomerName, Product
FROM SplitProducts
ORDER BY OrderID;
-- Question 2
SELECT DISTINCT
    OrderID,
    CustomerName
FROM
    OrderDetails;
SELECT
    OrderID,
    Product,
    Quantity
FROM
    OrderDetails;
-- Question 3
