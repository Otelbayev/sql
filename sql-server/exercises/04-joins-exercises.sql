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



-- 2) Har bir buyurtma uchun OrderID va buyurtma qilingan mahsulot nomini (Product)
--    chiqaring. Mahsuloti topilmagan buyurtmalar ham natijada qolsin.
-- Yozing:



-- 3) Har bir buyurtma uchun OrderID, mijozning to'liq ismi (FirstName va LastName
--    bitta ustunda, orasida bo'sh joy bilan, ustun nomi: Customer) va buyurtmani
--    rasmiylashtirgan xodimning FirstName'ini (ustun nomi: Employee) chiqaring.
-- Yozing:



-- 4) Bitta natijada quyidagi ustunlarni birlashtiring: OrderID, Sales,
--    mijoz ismi (Customer), mahsulot nomi (Product) va xodim ismi (Employee).
-- Yozing:



-- 5) Har bir buyurtma uchun OrderID, mahsulot nomi, Quantity, mahsulotning Price'i
--    va Quantity * Price ko'paytmasini (ustun nomi: ExpectedTotal) chiqaring.
-- Yozing:



-- 6) Faqat Sales qiymati 30 dan katta bo'lgan buyurtmalar uchun mijozning
--    LastName'ini va Sales'ni chiqaring.
-- Yozing:



-- 7) Faqat 'Clothing' kategoriyasidagi mahsulotlarga tegishli buyurtmalarni chiqaring:
--    OrderID, Product, Category, Sales.
-- Yozing:



-- 8) Har bir xodim uchun uning nomi va o'sha xodim rasmiylashtirgan buyurtmalar sonini
--    chiqaring (ustun nomi: TotalOrders). Bitta ham buyurtmasi bo'lmagan xodimlar ham
--    ro'yxatda ko'rinsin va ularda 0 tursin.
-- Yozing:



-- 9) Har bir mijoz uchun uning ismi va o'sha mijoz qilgan buyurtmalarning umumiy
--    savdo summasini (ustun nomi: TotalSales) chiqaring. Natijani summasi ko'p
--    mijozdan boshlab saralang.
-- Yozing:



-- 10) Har bir mahsulot kategoriyasi (Category) bo'yicha bitta qator chiqaring:
--     kategoriya nomi, o'sha kategoriyada sotilgan umumiy Quantity va umumiy Sales.
-- Yozing:



-- 11) Har bir xodim uchun uning ismi va uning boshlig'ining ismini (ustun nomi: Manager)
--     chiqaring. Boshlig'i yo'q xodim ham ro'yxatda qolsin.
--     (Ikkala ism ham Sales.Employees jadvalidan olinadi.)
-- Yozing:



-- 12) 'Germany' davlatidagi mijozlarning 2025-yil fevral oyida qilgan buyurtmalarini
--     chiqaring: OrderID, OrderDate, mijoz ismi, mahsulot nomi va Sales.
--     Natija OrderDate bo'yicha o'sish tartibida bo'lsin.
-- Yozing:
