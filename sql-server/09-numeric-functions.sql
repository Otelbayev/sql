-- SELECT OrderId,
--        DAY(GETDATE()) AS 'day',
--        MONTH(GETDATE()) AS 'month',
--        YEAR(GETDATE()) AS 'year',
--        DATEPART(MONTH, OrderDate) AS 'month',
--        DATEPART(week, OrderDate) AS 'day',
--        DATENAME(WEEKDAY, OrderDate),
--        DATETRUNC(MINUTE, CreationTime),
--        DATETRUNC(DAY, CreationTime),
--        DATETRUNC(MONTH, CreationTime)
-- FROM   Sales.Orders;
-- SELECT   DATENAME(MONTH, OrderDate) AS OrderDate,
--          COUNT(*)
-- FROM     Sales.Orders
-- GROUP BY DATENAME(MONTH, OrderDate);
-- SELECT *
-- FROM   Sales.Orders
-- WHERE  MONTH(OrderDate) = 2;
-- SELECT OrderID,
--        CreationTime,
--        FORMAT(CreationTime, 'dd'),
--        FORMAT(CreationTime, 'ddd'),
--        FORMAT(CreationTime, 'dddd'),
--        FORMAT(CreationTime, 'MM'),
--        FORMAT(CreationTime, 'MMM'),
--        FORMAT(CreationTime, 'MMMM'),
--        FORMAT(CreationTime, 'MM-dd-yyyy') as usa,
--        FORMAT(CreationTime, 'dd-MM-yyyy') as europe,
--        FORMAT(CreationTime, 'yyyy-MM-dd') as inernational
-- FROM   Sales.Orders;
-- SELECT 'Day ' + FORMAT(CreationTime, 'ddd ' + 'MMM ' + 'Q' + DATENAME(QUARTER, CreationTime) + ' yyyy ' + 'HH:mm:ss tt')
-- FROM   Sales.Orders;


SELECT   FORMAT(OrderDate, 'MMM yy'),
         COUNT(*) 
FROM     Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yy');

