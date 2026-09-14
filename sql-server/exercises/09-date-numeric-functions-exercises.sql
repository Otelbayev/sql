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
SELECT GETDATE();

-- 2) Har bir buyurtma uchun OrderID va OrderDate'ning kuni, oyi, yilini uchta
--    alohida ustunda chiqaring (ustun nomlari: order_day, order_month, order_year).
-- Yozing:
SELECT OrderID,
       OrderDate,
       DATENAME(DAY, OrderDate) AS order_day,
       DATENAME(MONTH, OrderDate) AS order_month,
       DATENAME(YEAR, OrderDate) AS order_year
FROM   Sales.Orders;

-- 3) Har bir buyurtma uchun OrderDate qaysi hafta kuniga to'g'ri kelishini
--    to'liq nom bilan chiqaring (masalan 'Monday', ustun nomi: weekday_name).
-- Yozing:
SELECT OrderID,
       OrderDate,
       DATENAME(WEEKDAY, OrderDate) AS weekday_name
FROM   Sales.Orders;

-- 4) Har bir buyurtma uchun OrderDate yilning nechanchi haftasiga tushishini
--    chiqaring (ustun nomi: week_number).
-- Yozing:
SELECT OrderID,
       OrderDate,
       DATENAME(WEEK, OrderDate) AS week_number
FROM   Sales.Orders;

-- 5) Har bir buyurtma uchun CreationTime qiymatini uch xil aniqlikda qisqartirib
--    chiqaring: daqiqagacha, kungacha va oygacha (uchta alohida ustun).
-- Yozing:
SELECT OrderID,
       CreationTime,
       DATETRUNC(MINUTE, CreationTime),
       DATETRUNC(DAY, CreationTime),
       DATETRUNC(MONTH, CreationTime)
FROM   Sales.Orders;

-- 6) Har bir buyurtma uchun CreationTime'ni 'dd-MM-yyyy' ko'rinishida va
--    'yyyy-MM-dd HH:mm:ss' ko'rinishida chiqaring (ustun nomlari: europe_style,
--    international_style).
-- Yozing:
SELECT CreationTime,
       FORMAT(CreationTime, 'dd-MM-yyyy') AS europe_style,
       FORMAT(CreationTime, 'yyyy-MM-dd HH:mm:ss') AS international_style
FROM   Sales.Orders;

-- 7) Oy nomi bo'yicha guruhlab, har bir oyda nechta buyurtma qilinganini chiqaring
--    (ustun nomlari: order_month, total_orders).
-- Yozing:
SELECT   DATENAME(MONTH, OrderDate) AS order_month,
         COUNT(OrderID) AS total_orders
FROM     Sales.Orders
GROUP BY DATENAME(MONTH, OrderDate);

-- 8) Faqat 2025-yil fevral oyida qilingan buyurtmalarni chiqaring.
-- Yozing:
SELECT *
FROM   Sales.Orders
WHERE  OrderDate >= '2025-02-01'
       AND OrderDate < '2025-03-01';

-- 9) Har bir buyurtma uchun OrderDate va ShipDate orasida necha kun o'tganini
--    hisoblang (ustun nomi: shipping_days).
-- Yozing:
SELECT DATEDIFF(DAY, OrderDate, ShipDate) AS shipping_days
FROM   Sales.Orders;

-- 10) Har bir xodim uchun ismini, BirthDate'ini va bugungi kunga necha yoshda
--     ekanini chiqaring (ustun nomi: age).
-- Yozing:
SELECT FirstName,
       BirthDate,
       DATEDIFF(YEAR, BirthDate, GETDATE()) - CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR, BirthDate, GETDATE()), BirthDate) > GETDATE() THEN 1 ELSE 0 END AS age
FROM   Sales.Employees;

-- 11) Har bir buyurtma uchun OrderDate'ga 30 kun qo'shilgan sanani va OrderDate'dan
--     3 oy oldingi sanani chiqaring (ustun nomlari: plus_30_days, minus_3_months).
-- Yozing:
SELECT OrderDate,
       DATEADD(DAY, 30, OrderDate) AS plus_30_days,
       DATEADD(MONTH, -3, OrderDate) AS minus_3_months
FROM   Sales.Orders;

-- 12) '2025-07-15' matnini haqiqiy sana turiga, 12345 sonini esa matn turiga
--     aylantirib chiqaring (ustun nomlari: as_date, as_text).
-- Yozing:
SELECT CAST ('2025-07-15' AS DATE) AS as_date,
       CAST ('1234' AS TEXT) AS as_text;

-- ---- SONLAR BILAN ISHLASH ----
-- 13) Har bir buyurtma uchun Sales'ni Quantity'ga bo'lgan natijani 2 xonagacha
--     aniqlikda chiqaring (ustun nomi: unit_price). Quantity 0 bo'lgan qatorda
--     so'rov xatolik bermasligi kerak.
-- Yozing:
SELECT OrderID,
       Quantity,
       Sales,
       ROUND(CAST (Sales AS DECIMAL (10, 2)) / NULLIF (Quantity, 0), 2) AS unit_price
FROM   Sales.Orders;

-- 14) Har bir buyurtma uchun Sales qiymatini yuqoriga va pastga butunlashtirib,
--     ikkala natijani bitta qatorda yonma-yon chiqaring.
-- Yozing:
SELECT Sales,
       FLOOR(Sales) AS rounded_down,
       CEILING(Sales) AS rounded_up
FROM   Sales.Orders;

-- 15) Har bir buyurtma uchun Sales qiymatining kvadratini hisoblang
--     (ustun nomi: sales_squared).
-- Yozing:
SELECT POWER(Sales, 2) AS sales_squared
FROM   Sales.Orders;