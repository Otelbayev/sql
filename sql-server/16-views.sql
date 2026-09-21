-- VIEW virtual table based on the result set of a query, without storing the data in database. Views are presisted SQL queries in the database
-- Find the runnig total of sales for each month
WITH   CTE_Monthly_Summary
AS     (SELECT   DATETRUNC(month, OrderDate) AS OrderMonth,
                 SUM(Sales) AS TotalSales,
                 COUNT(OrderID) AS TotalOrders,
                 SUM(Quantity) AS TotalQuantities
        FROM     Sales.Orders
        GROUP BY DATETRUNC(MONTH, OrderDate))
SELECT OrderMonth,
       SUM(TotalSales) OVER (ORDER BY OrderMonth) AS RunningTotal
FROM   CTE_Monthly_Summary;

IF OBJECT_ID('Sales.V_Monthly_Summary', 'V') IS NOT NULL
    DROP VIEW Sales.V_Monthly_Summary;


GO
CREATE VIEW Sales.V_Monthly_Summary
AS
SELECT   DATETRUNC(month, OrderDate) AS OrderMonth,
         SUM(Sales) AS TotalSales,
         COUNT(OrderID) AS TotalOrders,
         SUM(Quantity) AS TotalQuantities
FROM     Sales.Orders
GROUP BY DATETRUNC(month, OrderDate);


GO
SELECT *
FROM   Sales.V_Monthly_Summary;

--Provide view that combines details from orders, products, customers and employees
IF OBJECT_ID('Sales.V_Order_Details', 'V') IS NOT NULL
    DROP VIEW Sales.V_Order_Details;


GO
CREATE VIEW Sales.V_Order_Details
AS
(SELECT o.OrderID,
        o.OrderDate,
        o.OrderStatus,
        o.Sales,
        c.FirstName AS CustomerName,
        e.FirstName AS EmployeeName,
        c.Country,
        p.Product
 FROM   Sales.Orders AS o
        LEFT OUTER JOIN
        Sales.Customers AS c
        ON o.CustomerID = c.CustomerID
        LEFT OUTER JOIN
        Sales.Employees AS e
        ON o.SalesPersonID = e.EmployeeID
        LEFT OUTER JOIN
        Sales.Products AS p
        ON o.ProductID = p.ProductID);


GO
SELECT *
FROM   Sales.V_Order_Details;

IF OBJECT_ID('Sales.V_Order_Details_EU', 'V') IS NOT NULL
    DROP VIEW Sales.V_Order_Details_EU;


GO
CREATE VIEW Sales.V_Order_Details_EU
AS
(SELECT o.OrderID,
        o.OrderDate,
        o.OrderStatus,
        o.Sales,
        c.Country,
        c.FirstName AS CustomerName,
        e.FirstName AS EmployeeName,
        p.Product
 FROM   Sales.Orders AS o
        LEFT OUTER JOIN
        Sales.Customers AS c
        ON o.CustomerID = c.CustomerID
        LEFT OUTER JOIN
        Sales.Employees AS e
        ON o.SalesPersonID = e.EmployeeID
        LEFT OUTER JOIN
        Sales.Products AS p
        ON o.ProductID = p.ProductID
 WHERE  c.Country != 'USA');


GO
SELECT *
FROM   Sales.V_Order_Details_EU;