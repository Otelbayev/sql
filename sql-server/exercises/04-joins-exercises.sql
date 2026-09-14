-- ============================================
-- Mavzu: Joins
-- Baza: SalesDB
-- Jadvallar: Sales.Orders    (OrderID, ProductID, CustomerID, SalesPersonID,
--                             OrderDate, ShipDate, OrderStatus, Quantity, Sales, CreationTime)
--            Sales.Customers (CustomerID, FirstName, LastName, Country, Score)
--            Sales.Products  (ProductID, Product, Category, Price)
--            Sales.Employees (EmployeeID, FirstName, LastName, Department,
--                             BirthDate, Gender, Salary, ManagerID)
-- ============================================
-- 1) Har bir buyurtma uchun OrderID, Sales va buyurtmani bergan mijozning
--    FirstName'ini chiqaring. Mijozi topilmagan buyurtma bo'lsa ham, u qator
--    natijada ko'rinib tursin (mijoz ustunlari bo'sh bo'lsin).
-- Yozing:
SELECT o.OrderID,
       o.Sales,
       c.FirstName
FROM   Sales.Orders AS o
       LEFT OUTER JOIN
       Sales.Customers AS c
       ON c.CustomerID = o.CustomerID;

-- 2) Har bir buyurtma uchun OrderID va buyurtma qilingan mahsulot nomini (Product)
--    chiqaring. Mahsuloti topilmagan buyurtmalar ham natijada qolsin.
-- Yozing:
SELECT o.OrderID,
       p.Product
FROM   Sales.Orders AS o
       LEFT OUTER JOIN
       Sales.Products AS p
       ON o.ProductID = p.ProductID;

-- 3) Har bir buyurtma uchun OrderID, mijozning to'liq ismi (FirstName va LastName
--    bitta ustunda, orasida bo'sh joy bilan, ustun nomi: Customer) va buyurtmani
--    rasmiylashtirgan xodimning FirstName'ini (ustun nomi: Employee) chiqaring.
-- Yozing:
SELECT o.OrderID,
       CONCAT(c.FirstName, ' ', c.LastName) AS Customer,
       e.FirstName AS Employee
FROM   Sales.Orders AS o
       LEFT OUTER JOIN
       Sales.Customers AS c
       ON o.CustomerID = c.CustomerID
       LEFT OUTER JOIN
       Sales.Employees AS e
       ON o.SalesPersonID = e.EmployeeID;

-- 4) Bitta natijada quyidagi ustunlarni birlashtiring: OrderID, Sales,
--    mijoz ismi (Customer), mahsulot nomi (Product) va xodim ismi (Employee).
-- Yozing:
SELECT o.OrderID,
       o.Sales,
       CONCAT(c.FirstName, ' ', c.LastName),
       p.Product,
       e.FirstName
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

-- 5) Har bir buyurtma uchun OrderID, mahsulot nomi, Quantity, mahsulotning Price'i
--    va Quantity * Price ko'paytmasini (ustun nomi: ExpectedTotal) chiqaring.
-- Yozing:
SELECT o.OrderID,
       p.Product,
       o.Quantity,
       p.Price,
       (o.Quantity * p.Price) AS ExpectedTotal
FROM   Sales.Orders AS o
       LEFT OUTER JOIN
       Sales.Products AS p
       ON o.ProductID = p.ProductID;

-- 6) Faqat Sales qiymati 30 dan katta bo'lgan buyurtmalar uchun mijozning
--    LastName'ini va Sales'ni chiqaring.
-- Yozing:
SELECT c.LastName,
       o.Sales
FROM   Sales.Orders AS o
       LEFT OUTER JOIN
       Sales.Customers AS c
       ON o.CustomerID = c.CustomerID
WHERE  o.Sales > 30;

-- 7) Faqat 'Clothing' kategoriyasidagi mahsulotlarga tegishli buyurtmalarni chiqaring:
--    OrderID, Product, Category, Sales.
-- Yozing:
SELECT o.OrderID,
       p.Product,
       p.Category,
       o.Sales
FROM   Sales.Orders AS o
       LEFT OUTER JOIN
       Sales.Products AS p
       ON o.ProductID = p.ProductID
WHERE  p.Category = 'Clothing';

-- 8) Har bir xodim uchun uning nomi va o'sha xodim rasmiylashtirgan buyurtmalar sonini
--    chiqaring (ustun nomi: TotalOrders). Bitta ham buyurtmasi bo'lmagan xodimlar ham
--    ro'yxatda ko'rinsin va ularda 0 tursin.
-- Yozing:
SELECT   e.FirstName,
         COUNT(o.OrderID) AS TotalOrders
FROM     Sales.Employees AS e
         LEFT OUTER JOIN
         Sales.Orders AS o
         ON e.EmployeeID = o.SalesPersonID
GROUP BY e.FirstName
ORDER BY TotalOrders;

-- 9) Har bir mijoz uchun uning ismi va o'sha mijoz qilgan buyurtmalarning umumiy
--    savdo summasini (ustun nomi: TotalSales) chiqaring. Natijani summasi ko'p
--    mijozdan boshlab saralang.
-- Yozing:
SELECT   c.CustomerID,
         c.FirstName,
         SUM(o.Sales) AS TotalSales
FROM     Sales.Customers AS c
         LEFT OUTER JOIN
         Sales.Orders AS o
         ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName
ORDER BY TotalSales DESC;

-- 10) Har bir mahsulot kategoriyasi (Category) bo'yicha bitta qator chiqaring:
--     kategoriya nomi, o'sha kategoriyada sotilgan umumiy Quantity va umumiy Sales.
-- Yozing:
SELECT   p.Category,
         sum(o.Quantity),
         sum(o.Sales)
FROM     Sales.Products AS p
         LEFT OUTER JOIN
         Sales.Orders AS o
         ON p.ProductID = o.ProductID
GROUP BY p.Category;

-- 11) Har bir xodim uchun uning ismi va uning boshlig'ining ismini (ustun nomi: Manager)
--     chiqaring. Boshlig'i yo'q xodim ham ro'yxatda qolsin.
--     (Ikkala ism ham Sales.Employees jadvalidan olinadi.)
-- Yozing:
SELECT e.FirstName,
       m.FirstName AS Manager
FROM   Sales.Employees AS e
       LEFT OUTER JOIN
       Sales.Employees AS m
       ON e.EmployeeID = m.ManagerID;

-- 12) 'Germany' davlatidagi mijozlarning 2025-yil fevral oyida qilgan buyurtmalarini
--     chiqaring: OrderID, OrderDate, mijoz ismi, mahsulot nomi va Sales.
--     Natija OrderDate bo'yicha o'sish tartibida bo'lsin.
-- Yozing:
SELECT   o.OrderID,
         o.OrderDate,
         c.FirstName AS Customer,
         p.Product,
         o.Sales
FROM     Sales.Orders AS o
         INNER JOIN
         Sales.Customers AS c
         ON o.CustomerID = c.CustomerID
         INNER JOIN
         Sales.Products AS p
         ON o.ProductID = p.ProductID
WHERE    c.Country = 'Germany'
         AND o.OrderDate >= '2025-02-01'
         AND o.OrderDate < '2025-03-01'
ORDER BY o.OrderDate;