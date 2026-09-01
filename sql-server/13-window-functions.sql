SELECT   OrderID,
         OrderDate,
         ProductID,
         SUM(Sales) AS TotalSales
FROM     Sales.Orders
GROUP BY ProductID, OrderID, OrderDate;

SELECT OrderID,
       OrderDate,
       ProductID,
       SUM(Sales) OVER (PARTITION BY ProductID) AS TotalSalsByProductID
FROM   Sales.Orders;

SELECT OrderID,
       OrderDate,
       ProductID,
       Sales,
       OrderStatus,
       SUM(Sales) OVER () AS TotalSales,
       SUM(Sales) OVER (PARTITION BY ProductID) AS TotalSalsByProductID,
       SUM(Sales) OVER (PARTITION BY ProductID, OrderStatus) AS TotalSalsByProductIDandOrderStatus
FROM   Sales.Orders;

SELECT OrderID,
       OrderDate,
       Sales,
       RANK() OVER (ORDER BY Sales DESC) AS RankSales
FROM   Sales.Orders;

SELECT OrderID,
       OrderDate,
       OrderStatus,
       Sales,
       SUM(Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING)
FROM   Sales.Orders;

SELECT OrderID,
       OrderDate,
       CustomerID,
       COUNT(*) OVER () AS TotalOrders,
       COUNT(*) OVER (PARTITION BY CustomerID) AS OrdersByCustomers
FROM   Sales.Orders;

SELECT CustomerID,
       FirstName,
       LastName,
       Country,
       Score,
       COUNT(*) OVER () AS TotalCustomers,
       COUNT(Score) OVER () AS TotaScoreCustomers
FROM   Sales.Customers;

SELECT OrderID,
       COUNT(*) OVER (PARTITION BY OrderID) AS CheckPK
FROM   Sales.OrdersArchive;

SELECT OrderId,
       OrderDate,
       Sales,
       ProductID,
       SUM(Sales) OVER () AS total_sales,
       SUM(Sales) OVER (PARTITION BY ProductID) AS each_product_sales
FROM   Sales.Orders;

SELECT OrderID,
       ProductID,
       Sales,
       SUM(Sales) OVER (),
       ROUND((CAST (Sales AS FLOAT) / SUM(Sales) OVER ()) * 100, 2)
FROM   Sales.Orders;

SELECT OrderID,
       OrderDate,
       AVG(Sales) OVER () AS AvarageSales,
       AVG(Sales) OVER (PARTITION BY ProductID) AS AvarageSalesByProduct
FROM   Sales.Orders;

SELECT CustomerID,
       LastName,
       Score,
       AVG(Score) OVER ()
FROM   Sales.Customers;

SELECT *
FROM   (SELECT OrderID,
               ProductID,
               Sales,
               AVG(Sales) OVER () AS AvgSales
        FROM   Sales.Orders) AS t
WHERE  Sales > AvgSales;

SELECT OrderID,
       OrderDate,
       Sales,
       ProductID,
       MIN(Sales) OVER () AS min_sales,
       MAX(Sales) OVER () AS max_sales,
       MIN(Sales) OVER (PARTITION BY ProductID) AS min_sales_by_product,
       MAX(Sales) OVER (PARTITION BY ProductID) AS max_sales_by_product
FROM   Sales.Orders;

SELECT *
FROM   (SELECT *,
               MAX(Salary) OVER () AS HighestSalary
        FROM   Sales.Employees) AS t
WHERE  Salary = HighestSalary;