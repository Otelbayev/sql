-- ============================================
-- Mavzu: Date & Numeric Functions
-- Jadvallar: Sales.Orders (OrderID, OrderDate, ShipDate, CreationTime, Sales, Quantity),
--            customers (score)
-- ============================================

-- ---- SANA FUNKSIYALARI ----

-- 1) Har bir buyurtma uchun OrderDate'dan kun, oy va yilni alohida ustunlarda chiqaring
--    (DAY, MONTH, YEAR).
-- Yozing:


-- 2) Hozirgi sana va vaqtni GETDATE() yordamida chiqaring.
-- Yozing:


-- 3) Har bir buyurtmaning OrderDate'i qaysi hafta kuniga (masalan "Monday") to'g'ri
--    kelishini DATENAME yordamida chiqaring.
-- Yozing:


-- 4) DATEPART yordamida har bir OrderDate'ning yil ichidagi qaysi haftasiga (week)
--    to'g'ri kelishini toping.
-- Yozing:


-- 5) CreationTime qiymatini DATETRUNC yordamida daqiqagacha, kungacha va oygacha qisqartirib,
--    uchala natijani alohida ustunlarda chiqaring.
-- Yozing:


-- 6) Oy nomi (DATENAME(MONTH, OrderDate)) bo'yicha guruhlab, har bir oyda nechta
--    buyurtma qilinganini hisoblang.
-- Yozing:


-- 7) Faqat may oyida (OrderDate) qilingan buyurtmalarni chiqaring.
-- Yozing:


-- 8) Har bir buyurtma uchun ShipDate va OrderDate orasidagi kunlar farqini
--    DATEDIFF yordamida hisoblang.
-- Yozing:


-- ---- SONLI (NUMERIC) FUNKSIYALAR ----

-- 9) customers jadvalidagi score qiymatlarini ROUND yordamida eng yaqin o'nlikgacha
--    yaxlitlab chiqaring (masalan ROUND(score, -1)).
-- Yozing:


-- 10) Sales.Orders jadvalidagi Sales ustunini CEILING (yuqoriga) va FLOOR (pastga)
--     yaxlitlab, ikkala natijani bir qatorda solishtiring.
-- Yozing:


-- 11) Har bir buyurtma uchun Sales / Quantity nisbatini hisoblang va natijani
--     ABS yordamida har doim musbat bo'lishini ta'minlang.
-- Yozing:


-- 12) Har bir buyurtma uchun Sales qiymatini POWER yordamida kvadratga (2-darajaga) oshiring.
-- Yozing:
