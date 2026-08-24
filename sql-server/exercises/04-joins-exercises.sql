-- ============================================
-- Mavzu: Joins (ko'p jadvalli birlashtirish)
-- Jadvallar: Sales.Orders (OrderID, ProductID, CustomerID, SalesPersonID, Sales, ...),
--            Sales.Customers (CustomerID, FirstName, LastName),
--            Sales.Products (ProductID, Product),
--            Sales.Employees (EmployeeID, FirstName, LastName)
-- ============================================

-- 1) Sales.Orders va Sales.Customers jadvallarini LEFT JOIN qilib, har bir buyurtma uchun
--    OrderID, Sales va mijozning FirstName'ini chiqaring.
-- Yozing:


-- 2) Sales.Orders va Sales.Products jadvallarini LEFT JOIN qilib, OrderID va Product nomini chiqaring.
-- Yozing:


-- 3) Sales.Orders, Sales.Customers va Sales.Employees jadvallarini birlashtirib
--    (uch jadvalli LEFT JOIN), OrderID, mijoz ismi (Customer nomi bilan) va
--    xodim ismi (Employee nomi bilan) ustunlarini chiqaring.
-- Yozing:


-- 4) To'rtta jadvalni (Orders, Customers, Products, Employees) birlashtirib,
--    OrderID, Sales, mijoz ismi, mahsulot nomi va xodim ismini bitta natijada chiqaring.
-- Yozing:


-- 5) Har bir xodim (Sales.Employees) uchun ular amalga oshirgan buyurtmalar sonini hisoblang
--    (JOIN + GROUP BY + COUNT).
-- Yozing:


-- 6) Sales.Customers va Sales.Orders'ni birlashtirib, faqat Sales qiymati 500 dan katta
--    bo'lgan buyurtmalar uchun mijozning LastName'ini chiqaring (JOIN + WHERE).
-- Yozing:
