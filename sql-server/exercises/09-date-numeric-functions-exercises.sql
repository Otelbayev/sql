-- ============================================
-- Mavzu: Date & Numeric Functions
-- Jadvallar: Sales.Orders (OrderID, OrderDate, ShipDate, CreationTime, Sales, Quantity),
--            customers (score)
-- ============================================
-- ---- SANA FUNKSIYALARI ----
-- 1) Har bir buyurtma uchun OrderDate'dan kun, oy va yilni alohida ustunlarda chiqaring.
-- Yozing:
SELECT OrderDate,
       DAY(OrderDate),
       MONTH(OrderDate),
       YEAR(OrderDate)
FROM   Sales.Orders;

-- 2) Hozirgi sana va vaqtni chiqaring.
-- Yozing:
SELECT GETDATE();

-- 3) Har bir buyurtmaning OrderDate'i qaysi hafta kuniga (masalan "Monday")
--    to'g'ri kelishini chiqaring.
-- Yozing:
SELECT OrderDate,
       datename(WEEKDAY, OrderDate)
FROM   Sales.Orders;

-- 4) Har bir OrderDate yil ichidagi qaysi haftaga to'g'ri kelishini toping.
-- Yozing:
SELECT OrderDate,
       DATEPART(WEEK, OrderDate)
FROM   Sales.Orders;

-- 5) CreationTime qiymatini daqiqagacha, kungacha va oygacha qisqartirib,
--    uchala natijani alohida ustunlarda chiqaring.
-- Yozing:
SELECT CreationTime,
       DATETRUNC(day, CreationTime),
       DATETRUNC(MONTH, CreationTime),
       DATETRUNC(MINUTE, CreationTime)
FROM   Sales.Orders;

-- 6) Oy nomi bo'yicha guruhlab, har bir oyda nechta buyurtma qilinganini hisoblang.
SELECT   DATENAME(MONTH, OrderDate),
         COUNT(ProductID)
FROM     Sales.Orders
GROUP BY DATENAME(MONTH, OrderDate);

-- Yozing:
-- 7) Faqat may oyida (OrderDate) qilingan buyurtmalarni chiqaring.
-- Yozing:
SELECT *
FROM   Sales.Orders
WHERE  DATEPART(MONTH, OrderDate) = 5;

-- 8) Har bir buyurtma uchun ShipDate va OrderDate orasidagi kunlar farqini hisoblang.
-- Yozing:
SELECT ShipDate,
       OrderDate,
       DATEDIFF(DAY, OrderDate, ShipDate)
FROM   Sales.Orders;

-- ---- SONLI (NUMERIC) FUNKSIYALAR ----
-- 9) customers jadvalidagi score qiymatlarini eng yaqin o'nlikgacha yaxlitlab chiqaring.
-- Yozing:
SELECT Score,
       ROUND(Score, -1)
FROM   Sales.Customers;

-- 10) Sales.Orders jadvalidagi Sales ustunini yuqoriga va pastga yaxlitlab,
--     ikkala natijani bir qatorda solishtiring.
-- Yozing:
SELECT CEILING(Sales),
       FLOOR(Sales)
FROM   Sales.Orders;

-- 11) Har bir buyurtma uchun Sales / Quantity nisbatini hisoblang va natija
--     har doim musbat bo'lishini ta'minlang.
-- Yozing:
SELECT ABS(Sales / Quantity)
FROM   Sales.Orders
WHERE  Quantity != 0;

-- 12) Har bir buyurtma uchun Sales qiymatini kvadratga (2-darajaga) oshiring.
-- Yozing:
SELECT POWER(Sales, 2),
       Sales
FROM   Sales.Orders;