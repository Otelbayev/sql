-- ============================================
-- Mavzu: Set Operators (UNION, UNION ALL, EXCEPT, INTERSECT)
-- Jadvallar: Sales.Customers (CustomerID, FirstName, LastName),
--            Sales.Employees (EmployeeID, FirstName, LastName),
--            Sales.Orders, Sales.OrdersArchive (bir xil ustunlar)
-- ============================================

-- 1) UNION yordamida Sales.Customers va Sales.Employees'dagi ID, FirstName, LastName
--    ma'lumotlarini takrorlarsiz birlashtiring.
-- Yozing:


-- 2) UNION ALL yordamida xuddi shu ustunlarni, lekin takrorlarni saqlagan holda birlashtiring.
-- Yozing:


-- 3) 1- va 2-natijalar orasidagi qatorlar sonini COUNT(*) bilan solishtiring
--    (ikkita alohida so'rov yozing).
-- Yozing:


-- 4) EXCEPT yordamida Sales.Customers'da mavjud, lekin Sales.Employees'da
--    (ID, FirstName, LastName bo'yicha) mavjud bo'lmagan qatorlarni toping.
-- Yozing:


-- 5) INTERSECT yordamida ikkala jadvalda ham (ID, FirstName, LastName bo'yicha)
--    bir xil bo'lgan qatorlarni toping.
-- Yozing:


-- 6) Sales.Orders va Sales.OrdersArchive jadvallarini UNION bilan birlashtiring va
--    har bir qatorga qaysi jadvaldan kelganini bildiruvchi qo'shimcha ustun qo'shing
--    ('current' yoki 'archive' literal qiymat sifatida). Natijani OrderID bo'yicha saralang.
-- Yozing:


-- 7) 6-mashqdagi natijadan faqat Quantity qiymati 1 dan katta bo'lgan qatorlarni chiqaring.
-- Yozing:
