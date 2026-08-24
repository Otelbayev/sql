SELECT *
FROM   Sales.Orders;

SELECT *
FROM   Sales.OrdersArchive;

SELECT *
FROM   Sales.Products;

SELECT *
FROM   Sales.Employees;

SELECT *
FROM   Sales.Customers;

SELECT o.OrderID,
       o.Sales,
       c.FirstName AS Customer,
       p.Product,
       e.FirstName AS Employee
FROM   Sales.Orders AS o
       LEFT OUTER JOIN
       Sales.Customers AS c
       ON o.CustomerID = c.CustomerID
       LEFT OUTER JOIN
       Sales.Products AS p
       ON o.ProductID = p.ProductID
       LEFT OUTER JOIN
       Sales.Employees AS e
       ON o.SalesPersonID = e.EmployeeID;