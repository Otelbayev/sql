-- PERMANENT TABLE
IF OBJECT_ID('Sales.MonthlyOrders', 'U') IS NOT NULL
    DROP TABLE Sales.MonthlyOrders;

SELECT   DATENAME(MONTH, OrderDate) AS OrderDate,
         COUNT(OrderID) AS TotalOrders
INTO     Sales.MonthlyOrders
FROM     Sales.Orders
GROUP BY DATENAME(MONTH, OrderDate);

SELECT *
FROM   Sales.MonthlyOrders;

-- TEMPORARY TABLE
SELECT *
INTO   #Orders
FROM   Sales.Orders;

SELECT *
FROM   #Orders;

DELETE #Orders
WHERE  OrderStatus = 'Delivered';