SELECT   Category,
         sum(ISNULL(Score, 0)) AS Sum
FROM     (SELECT Score,
                 CASE WHEN Score > 500 THEN 'hight' WHEN Score > 200 THEN 'meidum' ELSE 'low' END AS Category
          FROM   Sales.Customers) AS t
GROUP BY Category
ORDER BY Sum DESC;

SELECT FirstName,
       LastName,
       Gender,
       CASE WHEN Gender = 'M' THEN 'Male' WHEN Gender = 'F' THEN 'Female' END AS [Full Gender]
FROM   Sales.Employees;

SELECT FirstName,
       LastName,
       Country
FROM   Sales.Customers;

SELECT CustomerID,
       FirstName,
       Score,
       CASE WHEN Score IS NULL THEN 0 ELSE Score END AS CleanScore,
       AVG(Score) OVER () AS AvgCustomer,
       AVG(CASE WHEN Score IS NULL THEN 0 ELSE Score END) OVER () AS CleanAvgScore
FROM   Sales.Customers;

SELECT   CustomerID,
         SUM(CASE WHEN Sales > 30 THEN 1 ELSE 0 END) AS total,
         COUNT(*)
FROM     Sales.Orders
GROUP BY CustomerID;