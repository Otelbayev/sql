-- ============================================
-- Mavzu: Set Operators
-- Baza: SalesDB
-- Jadvallar: Sales.Customers    (CustomerID, FirstName, LastName, Country, Score)
--            Sales.Employees    (EmployeeID, FirstName, LastName, Department,
--                                BirthDate, Gender, Salary, ManagerID)
--            Sales.Orders       (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate,
--                                ShipDate, OrderStatus, ShipAddress, BillAddress,
--                                Quantity, Sales, CreationTime)
--            Sales.OrdersArchive (Sales.Orders bilan bir xil ustunlar)
-- ============================================
-- 1) Sales.Customers va Sales.Employees dagi odamlarni bitta ro'yxatga yig'ing:
--    ustunlar ID (mijozda CustomerID, xodimda EmployeeID), FirstName, LastName bo'lsin.
--    Ikkala jadvalda ham bir xil takrorlangan qatorlar natijada bir marta ko'rinsin.
-- Yozing:
SELECT CustomerID AS ID,
       FirstName,
       LastName
FROM   Sales.Customers
UNION
SELECT EmployeeID,
       FirstName,
       LastName
FROM   Sales.Employees;

-- 2) Xuddi shu ro'yxatni yana chiqaring, lekin bu safar takrorlangan qatorlar
--    o'chirilmasin — hamma qator o'z holicha qolsin.
-- Yozing:
SELECT CustomerID AS ID,
       FirstName,
       LastName
FROM   Sales.Customers
UNION ALL
SELECT EmployeeID,
       FirstName,
       LastName
FROM   Sales.Employees;

-- 3) 1- va 2-mashq natijalaridagi qatorlar sonini hisoblang (ikkita alohida so'rov yozing)
--    va sonlar farq qilgan-qilmaganini ko'ring.
-- Yozing:
SELECT COUNT(*) AS first_query_row_count
FROM   (SELECT CustomerID AS ID,
               FirstName,
               LastName
        FROM   Sales.Customers
        UNION
        SELECT EmployeeID,
               FirstName,
               LastName
        FROM   Sales.Employees) AS t;

SELECT COUNT(*) AS second_query_row_count
FROM   (SELECT CustomerID AS ID,
               FirstName,
               LastName
        FROM   Sales.Customers
        UNION ALL
        SELECT EmployeeID,
               FirstName,
               LastName
        FROM   Sales.Employees) AS t;

-- 4) Faqat mijozlar ro'yxatida bor, lekin xodimlar ro'yxatida uchramaydigan
--    (ID, FirstName, LastName uchligi bo'yicha) odamlarni chiqaring.
-- Yozing:
SELECT CustomerID AS ID,
       FirstName,
       LastName
FROM   Sales.Customers
EXCEPT
SELECT EmployeeID,
       FirstName,
       LastName
FROM   Sales.Employees;

-- 5) Endi teskarisini toping: faqat xodimlar ro'yxatida bor, lekin mijozlar
--    ro'yxatida yo'q odamlarni chiqaring.
-- Yozing:
SELECT EmployeeID AS ID,
       FirstName,
       LastName
FROM   Sales.Employees
EXCEPT
SELECT CustomerID,
       FirstName,
       LastName
FROM   Sales.Customers;

-- 6) Ikkala ro'yxatda ham bir xil (ID, FirstName, LastName) bilan uchraydigan
--    odamlarni chiqaring.
-- Yozing:
SELECT CustomerID AS ID,
       FirstName,
       LastName
FROM   Sales.Customers
INTERSECT
SELECT EmployeeID,
       FirstName,
       LastName
FROM   Sales.Employees;

-- 7) Sales.Orders va Sales.OrdersArchive jadvallaridagi barcha buyurtmalarni bitta
--    ro'yxatga yig'ing. Har bir qatorda qo'shimcha ustun bo'lsin (ustun nomi: SourceTable):
--    joriy jadvaldan kelgan qatorlarda 'current', arxivdan kelganlarda 'archive' yozilsin.
--    Natija OrderID bo'yicha saralansin.
-- Yozing:
SELECT   *,
         'current' AS SourceTable
FROM     Sales.Orders
UNION ALL
SELECT   *,
         'archive'
FROM     Sales.OrdersArchive
ORDER BY OrderID;

-- 8) 7-mashqdagi umumiy ro'yxatdan faqat Quantity qiymati 1 dan katta bo'lgan
--    qatorlarni chiqaring.
-- Yozing:
SELECT   *,
         'current' AS SourceTable
FROM     Sales.Orders
WHERE    Quantity > 1
UNION ALL
SELECT   *,
         'archive'
FROM     Sales.OrdersArchive
WHERE    Quantity > 1
ORDER BY OrderID;

-- 9) Arxivda bor, lekin joriy Sales.Orders jadvalida yo'q bo'lgan OrderID'larni toping.
-- Yozing:
SELECT OrderID
FROM   Sales.OrdersArchive
EXCEPT
SELECT OrderID
FROM   Sales.Orders;

-- 10) Mijozlar jadvalidagi davlatlar ro'yxatini va qo'lda yozilgan 'Germany',
--     'USA', 'France' qiymatlarini bitta ustunga takrorlarsiz birlashtiring
--     (ustun nomi: Country).
-- Yozing:
SELECT Country
FROM   Sales.Customers
UNION
SELECT 'Germany'
UNION
SELECT 'USA'
UNION
SELECT 'France';

-- 11) Buyurtma bergan mijozlarning CustomerID'lari bilan umuman buyurtma bermagan
--     mijozlarning CustomerID'larini ikkita alohida ro'yxat sifatida oling, so'ng
--     ularni bitta natijaga yig'ing: har bir qatorda CustomerID va holatini
--     bildiruvchi ustun ('has orders' / 'no orders', ustun nomi: OrderState) bo'lsin.
-- Yozing:
SELECT   c.CustomerID,
         'has orders' AS OrderState
FROM     Sales.Customers AS c
         INNER JOIN
         Sales.Orders AS o
         ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
UNION ALL
SELECT   c.CustomerID,
         'no orders'
FROM     Sales.Customers AS c
         LEFT OUTER JOIN
         Sales.Orders AS o
         ON c.CustomerID = o.CustomerID
WHERE    o.OrderID IS NULL
GROUP BY c.CustomerID;