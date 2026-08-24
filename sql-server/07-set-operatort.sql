SELECT CustomerID AS ID,
       FirstName,
       LastName
FROM   Sales.Customers
UNION
SELECT EmployeeID,
       FirstName,
       LastName
FROM   Sales.Employees;

SELECT CustomerID AS ID,
       FirstName,
       LastName
FROM   Sales.Customers
UNION ALL
SELECT EmployeeID,
       FirstName,
       LastName
FROM   Sales.Employees;

SELECT CustomerID AS ID,
       FirstName,
       LastName
FROM   Sales.Customers
EXCEPT
SELECT EmployeeID,
       FirstName,
       LastName
FROM   Sales.Employees;

SELECT CustomerID AS ID,
       FirstName,
       LastName
FROM   Sales.Customers
INTERSECT
SELECT EmployeeID,
       FirstName,
       LastName
FROM   Sales.Employees;

SELECT 'hi' AS OrderString,
       [OrderID],
       [ProductID],
       [CustomerID],
       [SalesPersonID],
       [OrderDate],
       [ShipDate],
       [OrderStatus],
       [ShipAddress],
       [BillAddress],
       [Quantity],
       [Sales],
       [CreationTime]
FROM   Sales.Orders
UNION
SELECT 'bye',
[OrderID],
       [ProductID],
       [CustomerID],
       [SalesPersonID],
       [OrderDate],
       [ShipDate],
       [OrderStatus],
       [ShipAddress],
       [BillAddress],
       [Quantity],
       [Sales],
       [CreationTime]
FROM   Sales.OrdersArchive
ORDER BY OrderID