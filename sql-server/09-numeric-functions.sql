SELECT OrderId,
       DAY(GETDATE()) AS 'day',
       MONTH(GETDATE()) AS 'month',
       YEAR(GETDATE()) AS 'year',
       DATEPART(MONTH, OrderDate) AS 'month',
       DATEPART(week, OrderDate) AS 'day',
       DATENAME(WEEKDAY, OrderDate),
       DATETRUNC(MINUTE, CreationTime),
       DATETRUNC(DAY, CreationTime),
       DATETRUNC(MONTH, CreationTime)
FROM   Sales.Orders;

SELECT   DATENAME(MONTH, OrderDate) AS OrderDate,
         COUNT(*)
FROM     Sales.Orders
GROUP BY DATENAME(MONTH, OrderDate);

SELECT *
FROM   Sales.Orders
WHERE  MONTH(OrderDate) = 2;