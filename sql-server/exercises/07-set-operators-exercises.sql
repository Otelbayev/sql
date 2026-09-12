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



-- 2) Xuddi shu ro'yxatni yana chiqaring, lekin bu safar takrorlangan qatorlar
--    o'chirilmasin — hamma qator o'z holicha qolsin.
-- Yozing:



-- 3) 1- va 2-mashq natijalaridagi qatorlar sonini hisoblang (ikkita alohida so'rov yozing)
--    va sonlar farq qilgan-qilmaganini ko'ring.
-- Yozing:



-- 4) Faqat mijozlar ro'yxatida bor, lekin xodimlar ro'yxatida uchramaydigan
--    (ID, FirstName, LastName uchligi bo'yicha) odamlarni chiqaring.
-- Yozing:



-- 5) Endi teskarisini toping: faqat xodimlar ro'yxatida bor, lekin mijozlar
--    ro'yxatida yo'q odamlarni chiqaring.
-- Yozing:



-- 6) Ikkala ro'yxatda ham bir xil (ID, FirstName, LastName) bilan uchraydigan
--    odamlarni chiqaring.
-- Yozing:



-- 7) Sales.Orders va Sales.OrdersArchive jadvallaridagi barcha buyurtmalarni bitta
--    ro'yxatga yig'ing. Har bir qatorda qo'shimcha ustun bo'lsin (ustun nomi: SourceTable):
--    joriy jadvaldan kelgan qatorlarda 'current', arxivdan kelganlarda 'archive' yozilsin.
--    Natija OrderID bo'yicha saralansin.
-- Yozing:



-- 8) 7-mashqdagi umumiy ro'yxatdan faqat Quantity qiymati 1 dan katta bo'lgan
--    qatorlarni chiqaring.
-- Yozing:



-- 9) Arxivda bor, lekin joriy Sales.Orders jadvalida yo'q bo'lgan OrderID'larni toping.
-- Yozing:



-- 10) Mijozlar jadvalidagi davlatlar ro'yxatini va qo'lda yozilgan 'Germany',
--     'USA', 'France' qiymatlarini bitta ustunga takrorlarsiz birlashtiring
--     (ustun nomi: Country).
-- Yozing:



-- 11) Buyurtma bergan mijozlarning CustomerID'lari bilan umuman buyurtma bermagan
--     mijozlarning CustomerID'larini ikkita alohida ro'yxat sifatida oling, so'ng
--     ularni bitta natijaga yig'ing: har bir qatorda CustomerID va holatini
--     bildiruvchi ustun ('has orders' / 'no orders', ustun nomi: OrderState) bo'lsin.
-- Yozing:
