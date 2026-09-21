-- Common table expression 
--NON RECURSIVE CTE
-- Standalone CTE: Define and Used independently 
WITH   CTE_Total_Sales
AS     (SELECT   CustomerID,
                 SUM(Sales) AS Total_Sales
        FROM     Sales.Orders
        GROUP BY CustomerID)
SELECT c.FirstName,
       c.LastName,
       cts.Total_Sales
FROM   Sales.Customers AS c
       LEFT OUTER JOIN
       CTE_Total_Sales AS cts
       ON c.CustomerID = cts.CustomerID;

--Multiple Standalone CTE
WITH   CTE_Total_Sales
AS     (SELECT   CustomerID,
                 SUM(Sales) AS Total_Sales
        FROM     Sales.Orders
        GROUP BY CustomerID),
       CTE_Last_Order
AS     (SELECT   CustomerID,
                 MAX(OrderDate) AS Last_Order
        FROM     Sales.Orders
        GROUP BY CustomerID)
SELECT c.FirstName,
       c.LastName,
       cts.Total_Sales,
       clo.Last_Order
FROM   Sales.Customers AS c
       LEFT OUTER JOIN
       CTE_Total_Sales AS cts
       ON c.CustomerID = cts.CustomerID
       LEFT OUTER JOIN
       CTE_Last_Order AS clo
       ON c.CustomerID = clo.CustomerID;

-- Nested CTE: CTE inside another CTE
WITH   CTE_Total_Sales
AS     (SELECT   CustomerID,
                 SUM(Sales) AS Total_Sales
        FROM     Sales.Orders
        GROUP BY CustomerID),
       CTE_Last_Order
AS     (SELECT   CustomerID,
                 MAX(OrderDate) AS Last_Order
        FROM     Sales.Orders
        GROUP BY CustomerID),
       CTE_Customer_Rank
AS     (SELECT CustomerID,
               Total_Sales,
               RANK() OVER (ORDER BY Total_Sales DESC) AS CustomerRank
        FROM   CTE_Total_Sales),
       CTE_Customer_Segment
AS     (SELECT CustomerID,
               CASE WHEN Total_Sales > 100 THEN 'HIGHT' WHEN Total_Sales > 80 THEN 'MEDIUM' ELSE 'LOW' END AS CustomerSegmet
        FROM   CTE_Total_Sales)
SELECT c.FirstName,
       c.LastName,
       cts.Total_Sales,
       clo.Last_Order,
       ccr.CustomerRank,
       ccs.CustomerSegmet
FROM   Sales.Customers AS c
       LEFT OUTER JOIN
       CTE_Total_Sales AS cts
       ON c.CustomerID = cts.CustomerID
       LEFT OUTER JOIN
       CTE_Last_Order AS clo
       ON c.CustomerID = clo.CustomerID
       LEFT OUTER JOIN
       CTE_Customer_Rank AS ccr
       ON c.CustomerID = ccr.CustomerID
       LEFT OUTER JOIN
       CTE_Customer_Segment AS ccs
       ON c.CustomerID = ccs.CustomerID;

-- RECURSIVE CTE
WITH   Sreies
AS     (SELECT 1 AS MyNumber
        UNION ALL
        SELECT MyNumber + 1
        FROM   Sreies
        WHERE  MyNumber < 300)
SELECT *
FROM   Sreies
OPTION (MAXRECURSION 300); -- by default max recursion is 100 but we can control it with function option!

WITH   CTE_Emp_Hierarchy
AS     (SELECT EmployeeID,
               FirstName,
               ManagerID,
               1 AS Level
        FROM   Sales.Employees
        WHERE  ManagerID IS NULL
        UNION ALL
        SELECT e.EmployeeID,
               e.FirstName,
               e.ManagerID,
               Level + 1
        FROM   Sales.Employees AS e
               INNER JOIN
               CTE_Emp_Hierarchy AS ceh
               ON e.ManagerID = ceh.EmployeeID)
SELECT *
FROM   CTE_Emp_Hierarchy;