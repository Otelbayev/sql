-- ISNULL
-- COALESCE
SELECT CONCAT(FirstName, ' ', LastName) AS FullName,
       COALESCE (Score, 0),
       ISNULL(Score, 0) + 10 AS [With bonuce score]
FROM   Sales.Customers;

SELECT   CustomerID,
         Score,
         CASE WHEN Score IS NULL THEN 1 ELSE 0 END
FROM     Sales.Customers
ORDER BY Score;

SELECT NULLIF (10, 11);

SELECT NULLIF (10, 10);

SELECT OrderID,
       Quantity,
       Sales / NULLIF (Quantity, 0)
FROM   Sales.Orders;

SELECT *
FROM   Sales.Customers
WHERE  Score IS NULL;

SELECT *
FROM   Sales.Customers
WHERE  Score IS NOT NULL;

SELECT *
FROM   Sales.Customers AS c
       LEFT OUTER JOIN
       Sales.Orders AS o
       ON c.CustomerID = o.CustomerID
WHERE  o.CustomerID IS NULL;