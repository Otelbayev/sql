SELECT SUM(Sales)
FROM   Sales.Orders;

SELECT   ProductID,
         SUM(Sales)
FROM     Sales.Orders
GROUP BY ProductID;

SELECT ProductID,
       OrderDate,
       OrderID,
       SUM(Sales) OVER (PARTITION BY ProductID)
FROM   Sales.Orders;