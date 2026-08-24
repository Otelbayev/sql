-- ============================================
-- Mavzu: Set Operators
-- Jadvallar: Sales.Customers (CustomerID, FirstName, LastName),
--            Sales.Employees (EmployeeID, FirstName, LastName),
--            Sales.Orders, Sales.OrdersArchive (bir xil ustunlar)
-- ============================================

-- 1) Sales.Customers va Sales.Employees'dagi ID, FirstName, LastName ma'lumotlarini
--    bitta ro'yxatga, takrorlanuvchi qatorlarsiz birlashtiring.
-- Yozing:


-- 2) Xuddi shu ustunlarni, lekin takrorlanuvchi qatorlarni saqlagan holda birlashtiring.
-- Yozing:


-- 3) 1- va 2-natijalar orasidagi qatorlar sonini solishtiring
--    (ikkita alohida so'rov yozing).
-- Yozing:


-- 4) Sales.Customers'da mavjud, lekin Sales.Employees'da (ID, FirstName, LastName
--    bo'yicha) mavjud bo'lmagan qatorlarni toping.
-- Yozing:


-- 5) Ikkala jadvalda ham (ID, FirstName, LastName bo'yicha) bir xil bo'lgan
--    qatorlarni toping.
-- Yozing:


-- 6) Sales.Orders va Sales.OrdersArchive jadvallarini bitta natijaga birlashtiring va
--    har bir qatorga qaysi jadvaldan kelganini bildiruvchi qo'shimcha ustun qo'shing
--    ('current' yoki 'archive' literal qiymat sifatida). Natijani OrderID bo'yicha saralang.
-- Yozing:


-- 7) 6-mashqdagi natijadan faqat Quantity qiymati 1 dan katta bo'lgan qatorlarni chiqaring.
-- Yozing:
