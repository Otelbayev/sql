-- ============================================
-- Mavzu: Joins (ko'p jadvalli birlashtirish)
-- Jadvallar: Sales.Orders (OrderID, ProductID, CustomerID, SalesPersonID, Sales, ...),
--            Sales.Customers (CustomerID, FirstName, LastName),
--            Sales.Products (ProductID, Product),
--            Sales.Employees (EmployeeID, FirstName, LastName)elect list because it is not contained in either an aggregate function or the GROUP
-- ============================================
SELECT *
FROM   Sales.Customers;

SELECT *
FROM   Sales.Orders;

SELECT *
FROM   Sales.Products;

SELECT *
FROM   Sales.Employees;

-- 1) Har bir buyurtma uchun OrderID, Sales va mijozning FirstName'ini chiqaring.
--    Mijozi topilmagan buyurtmalar ham natijada ko'rinsin.
-- Yozing:
SELECT o.OrderID,
       o.Sales,
       c.FirstName
FROM   Sales.Orders AS o
       LEFT OUTER JOIN
       Sales.Customers AS c
       ON o.CustomerID = c.CustomerID;

-- 2) Har bir buyurtma uchun OrderID va mahsulot nomini (Product) chiqaring.
--    Mahsuloti topilmagan buyurtmalar ham natijada ko'rinsin.
-- Yozing:
SELECT o.OrderID,
       p.Product
FROM   Sales.Orders AS o
       LEFT OUTER JOIN
       Sales.Products AS p
       ON o.ProductID = p.ProductID;

-- 3) Har bir buyurtma uchun OrderID, mijoz ismi (Customer nomi bilan) va
--    xodim ismi (Employee nomi bilan) ustunlarini bitta natijada chiqaring.
-- Yozing:
SELECT o.OrderID,
       c.FirstName AS 'Customer',
       e.FirstName AS 'Employee'
FROM   Sales.Orders AS o
       LEFT OUTER JOIN
       Sales.Customers AS c
       ON o.CustomerID = c.CustomerID
       LEFT OUTER JOIN
       Sales.Employees AS e
       ON o.SalesPersonID = e.EmployeeID;

-- 4) Har bir buyurtma uchun OrderID, Sales, mijoz ismi, mahsulot nomi va
--    xodim ismini bitta natijada chiqaring.
-- Yozing:
SELECT o.OrderID,
       o.Sales,
       c.FirstName AS 'Customer',
       p.Product,
       e.FirstName AS 'Employee'
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

-- 5) Har bir xodim (Sales.Employees) uchun ular amalga oshirgan buyurtmalar sonini hisoblang.
-- Yozing:
SELECT   e.EmployeeID,
         e.LastName,
         COUNT(O.OrderID) AS 'Count of orders'
FROM     Sales.Employees AS e
         LEFT OUTER JOIN
         Sales.Orders AS o
         ON e.EmployeeID = o.SalesPersonID
GROUP BY e.EmployeeID;

-- 6) Faqat Sales qiymati 500 dan katta bo'lgan buyurtmalar uchun
--    mijozning LastName'ini chiqaring.
-- Yozing:
SELECT c.LastName,
       o.Sales
FROM   Sales.Orders AS o
       LEFT OUTER JOIN
       Sales.Customers AS c
       ON o.CustomerID = c.CustomerID
WHERE  o.Sales > 50;