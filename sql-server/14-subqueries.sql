--MAIN QUERY
SELECT *
FROM   -- SUB QUERY
       (SELECT ProductID,
               Price,
               AVG(Price) OVER () AS avg_price
        FROM   Sales.Products) AS t
WHERE  Price > avg_price;

-- MAIN QUERY
SELECT *,
       RANK() OVER (ORDER BY TotalSales DESC) AS CustomerRank
FROM   -- SUB QUERY
       (SELECT   CustomerID,
                 SUM(Sales) AS TotalSales
        FROM     Sales.Orders
        GROUP BY CustomerID) AS t;

SELECT Product,
       Price,
       Price,
       (SELECT COUNT(*)
        FROM   Sales.Products) AS total_orders
FROM   Sales.Products;

SELECT *
FROM   Sales.Customers AS c
       LEFT OUTER JOIN
       (SELECT   CustomerID,
                 COUNT(*) AS TotalOrders
        FROM     Sales.Orders
        GROUP BY CustomerID) AS o
       ON c.CustomerID = o.CustomerID;

SELECT *
FROM   Sales.Products
WHERE  Price > (SELECT AVG(Price)
                FROM   Sales.Products);

SELECT *
FROM   Sales.Customers AS c
       LEFT OUTER JOIN
       Sales.Orders AS o
       ON c.CustomerID = o.CustomerID
WHERE  c.Country = 'Germany';

SELECT *
FROM   Sales.Orders
WHERE  CustomerID NOT IN (SELECT CustomerID
                          FROM   Sales.Customers
                          WHERE  Country = 'Germany');

SELECT EmployeeID,
       FirstName,
       Salary
FROM   Sales.Employees
WHERE  Gender = 'F'
       AND Salary > ANY (SELECT Salary
                         FROM   Sales.Employees
                         WHERE  Gender = 'M');

SELECT EmployeeID,
       FirstName,
       Salary
FROM   Sales.Employees
WHERE  Gender = 'F'
       AND Salary > ALL (SELECT Salary
                         FROM   Sales.Employees
                         WHERE  Gender = 'M');

SELECT *,
       (SELECT COUNT(*)
        FROM   Sales.Orders AS o
        WHERE  o.CustomerID = c.CustomerID)
FROM   Sales.Customers AS c;

SELECT *
FROM   Sales.Orders AS o
WHERE  EXISTS (SELECT 1
               FROM   Sales.Customers AS c
               WHERE  Country = 'Germany'
                      AND o.CustomerID = c.CustomerID);