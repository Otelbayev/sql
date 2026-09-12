-- ============================================
-- Mavzu: Date & Numeric Functions
-- Baza: SalesDB
-- Jadvallar: Sales.Orders    (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate,
--                             ShipDate, OrderStatus, Quantity, Sales, CreationTime)
--            Sales.Employees (EmployeeID, FirstName, LastName, BirthDate, Salary, ...)
-- ============================================


-- ---- SANA BILAN ISHLASH ----

-- 1) Hozirgi sana va vaqtni chiqaring.
-- Yozing:



-- 2) Har bir buyurtma uchun OrderID va OrderDate'ning kuni, oyi, yilini uchta
--    alohida ustunda chiqaring (ustun nomlari: order_day, order_month, order_year).
-- Yozing:



-- 3) Har bir buyurtma uchun OrderDate qaysi hafta kuniga to'g'ri kelishini
--    to'liq nom bilan chiqaring (masalan 'Monday', ustun nomi: weekday_name).
-- Yozing:



-- 4) Har bir buyurtma uchun OrderDate yilning nechanchi haftasiga tushishini
--    chiqaring (ustun nomi: week_number).
-- Yozing:



-- 5) Har bir buyurtma uchun CreationTime qiymatini uch xil aniqlikda qisqartirib
--    chiqaring: daqiqagacha, kungacha va oygacha (uchta alohida ustun).
-- Yozing:



-- 6) Har bir buyurtma uchun CreationTime'ni 'dd-MM-yyyy' ko'rinishida va
--    'yyyy-MM-dd HH:mm:ss' ko'rinishida chiqaring (ustun nomlari: europe_style,
--    international_style).
-- Yozing:



-- 7) Oy nomi bo'yicha guruhlab, har bir oyda nechta buyurtma qilinganini chiqaring
--    (ustun nomlari: order_month, total_orders).
-- Yozing:



-- 8) Faqat 2025-yil fevral oyida qilingan buyurtmalarni chiqaring.
-- Yozing:



-- 9) Har bir buyurtma uchun OrderDate va ShipDate orasida necha kun o'tganini
--    hisoblang (ustun nomi: shipping_days).
-- Yozing:



-- 10) Har bir xodim uchun ismini, BirthDate'ini va bugungi kunga necha yoshda
--     ekanini chiqaring (ustun nomi: age).
-- Yozing:



-- 11) Har bir buyurtma uchun OrderDate'ga 30 kun qo'shilgan sanani va OrderDate'dan
--     3 oy oldingi sanani chiqaring (ustun nomlari: plus_30_days, minus_3_months).
-- Yozing:



-- 12) '2025-07-15' matnini haqiqiy sana turiga, 12345 sonini esa matn turiga
--     aylantirib chiqaring (ustun nomlari: as_date, as_text).
-- Yozing:



-- ---- SONLAR BILAN ISHLASH ----

-- 13) Har bir buyurtma uchun Sales'ni Quantity'ga bo'lgan natijani 2 xonagacha
--     aniqlikda chiqaring (ustun nomi: unit_price). Quantity 0 bo'lgan qatorda
--     so'rov xatolik bermasligi kerak.
-- Yozing:



-- 14) Har bir buyurtma uchun Sales qiymatini yuqoriga va pastga butunlashtirib,
--     ikkala natijani bitta qatorda yonma-yon chiqaring.
-- Yozing:



-- 15) Har bir buyurtma uchun Sales qiymatining kvadratini hisoblang
--     (ustun nomi: sales_squared).
-- Yozing:
