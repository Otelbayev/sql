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
SELECT OrderID,
       CreationTime,
       FORMAT(CreationTime, 'dd'),
       FORMAT(CreationTime, 'ddd'),
       FORMAT(CreationTime, 'dddd'),
       FORMAT(CreationTime, 'MM'),
       FORMAT(CreationTime, 'MMM'),
       FORMAT(CreationTime, 'MMMM'),
       FORMAT(CreationTime, 'MM-dd-yyyy') as usa,
       FORMAT(CreationTime, 'dd-MM-yyyy') as europe,
       FORMAT(CreationTime, 'yyyy-MM-dd') as inernational
FROM   Sales.Orders;
SELECT 'Day ' + FORMAT(CreationTime, 'ddd ' + 'MMM ' + 'Q' + DATENAME(QUARTER, CreationTime) + ' yyyy ' + 'HH:mm:ss tt')
FROM   Sales.Orders;
SELECT   FORMAT(OrderDate, 'MMM yy'),
         COUNT(*) 
FROM     Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yy');
SELECT CAST ('23423' AS INT) AS [string to number],
       CAST (23423 AS VARCHAR) AS [number to string],
       CAST ('2020-02-02' AS DATE) AS [string to date],
       CAST ('2020-02-02' AS DATETIME2) AS [string to datetime];
SELECT DATEADD(MONTH, 14, GETDATE()),
       DATEADD(DAY, -30, GETDATE());
SELECT DATEDIFF(year, GETDATE(), DATEADD(YEAR, 90, GETDATE()));
SELECT DATEDIFF(YEAR, BirthDate, GETDATE()) AS age,
       BirthDate
FROM   Sales.Employees;
SELECT   DATENAME(MONTH, OrderDate),
         AVG(DATEDIFF(DAY, OrderDate, ShipDate))
FROM     Sales.Orders
GROUP BY DATENAME(MONTH, OrderDate);
SELECT OrderID,
       OrderDate,
       LAG(OrderDate) OVER (ORDER BY OrderDate),
       DATEDIFF(DAY, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate)
FROM   Sales.Orders;

SELECT ISDATE('2022-02')