-- ============================================
-- Mavzu: Set Operators
-- Jadvallar: Sales.Customers (CustomerID, FirstName, LastName),
--            Sales.Employees (EmployeeID, FirstName, LastName),
--            Sales.Orders, Sales.OrdersArchive (bir xil ustunlar)
-- ============================================
SELECT *
FROM   Sales.Customers;

SELECT *
FROM   Sales.Employees;

-- 1) Sales.Customers va Sales.Employees'dagi ID, FirstName, LastName ma'lumotlarini
--    bitta ro'yxatga, takrorlanuvchi qatorlarsiz birlashtiring.
-- Yozing:
SELECT CustomerID,
       FirstName,
       LastName
FROM   Sales.Customers
UNION
SELECT EmployeeID,
       FirstName,
       LastName
FROM   Sales.Employees;

-- 2) Xuddi shu ustunlarni, lekin takrorlanuvchi qatorlarni saqlagan holda birlashtiring.
-- Yozing:
SELECT CustomerID,
       FirstName,
       LastName
FROM   Sales.Customers
UNION ALL
SELECT EmployeeID,
       FirstName,
       LastName
FROM   Sales.Employees;

-- 3) 1- va 2-natijalar orasidagi qatorlar sonini solishtiring
--    (ikkita alohida so'rov yozing).
-- Yozing:
-- 3-mashq (1-qism): UNION natijasida nechta qator chiqqanini hisoblash
SELECT COUNT(*) AS total_rows
FROM   (SELECT CustomerID,
               FirstName,
               LastName
        FROM   Sales.Customers
        UNION
        SELECT EmployeeID,
               FirstName,
               LastName
        FROM   Sales.Employees) AS subquery_union;

-- 3-mashq (2-qism): UNION ALL natijasida nechta qator chiqqanini hisoblash
SELECT COUNT(*) AS total_rows
FROM   (SELECT CustomerID,
               FirstName,
               LastName
        FROM   Sales.Customers
        UNION ALL
        SELECT EmployeeID,
               FirstName,
               LastName
        FROM   Sales.Employees) AS subquery_union_all;

-- 4) Sales.Customers'da mavjud, lekin Sales.Employees'da (ID, FirstName, LastName
--    bo'yicha) mavjud bo'lmagan qatorlarni toping.
-- Yozing:
SELECT CustomerID,
       FirstName,
       LastName
FROM   Sales.Customers
EXCEPT
SELECT EmployeeID,
       FirstName,
       LastName
FROM   Sales.Employees;

-- 5) Ikkala jadvalda ham (ID, FirstName, LastName bo'yicha) bir xil bo'lgan
--    qatorlarni toping.
-- Yozing:
SELECT CustomerID,
       FirstName,
       LastName
FROM   Sales.Customers
INTERSECT
SELECT EmployeeID,
       FirstName,
       LastName
FROM   Sales.Employees;

-- 6) Sales.Orders va Sales.OrdersArchive jadvallarini bitta natijaga birlashtiring va
--    har bir qatorga qaysi jadvaldan kelganini bildiruvchi qo'shimcha ustun qo'shing
--    ('current' yoki 'archive' literal qiymat sifatida). Natijani OrderID bo'yicha saralang.
-- Yozing:
SELECT   OrderID,
         'current' AS which_table
FROM     Sales.Orders
UNION ALL
SELECT   OrderID,
         'archive' AS which_table
FROM     Sales.OrdersArchive
ORDER BY OrderID;

-- 7) 6-mashqdagi natijadan faqat Quantity qiymati 1 dan katta bo'lgan qatorlarni chiqaring.
-- Yozing:
SELECT   OrderID,
         'current' AS SourceTable
FROM     Sales.Orders
WHERE    Quantity > 1
UNION ALL
SELECT   OrderID,
         'archive' AS SourceTable
FROM     Sales.OrdersArchive
WHERE    Quantity > 1
ORDER BY OrderID;