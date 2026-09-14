-- ============================================
-- Mavzu: NULL Functions
-- Baza: SalesDB
-- Jadvallar: Sales.Customers (CustomerID, FirstName, LastName, Country, Score)
--            Sales.Orders    (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate,
--                             ShipDate, OrderStatus, ShipAddress, BillAddress,
--                             Quantity, Sales, CreationTime)
-- Eslatma: bu jadvallarda ba'zi ustunlar bo'sh (NULL) qiymatga ega.
-- ============================================
-- 1) Score qiymati berilmagan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   Sales.Customers
WHERE  Score IS NULL;

-- 2) Score qiymati berilgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   Sales.Customers
WHERE  Score IS NOT NULL;

-- 3) Har bir mijoz uchun CustomerID, FirstName va Score'ni chiqaring, lekin Score
--    bo'sh bo'lsa uning o'rniga 0 ko'rinsin (ustun nomi: clean_score).
-- Yozing:
SELECT CustomerID,
       FirstName,
       COALESCE (Score, 0) AS cleam_score
FROM   Sales.Customers;

-- 4) Har bir mijoz uchun to'liq ismni bitta ustunda chiqaring (FirstName va LastName
--    orasida bo'sh joy bilan). LastName bo'sh bo'lgan mijozda ham natija bo'sh
--    bo'lib qolmasin — LastName o'rniga 'Unknown' yozilsin.
-- Yozing:
SELECT CONCAT(FirstName, ' ', COALESCE (LastName, 'Unknown'))
FROM   Sales.Customers;

-- 5) Har bir mijozning ballini 10 ballga oshirib chiqaring. Ball berilmagan
--    mijozda natija 10 bo'lsin, bo'sh qolmasin (ustun nomi: bonus_score).
-- Yozing:
SELECT FirstName,
       Score,
       COALESCE (Score, 0) + 10 AS bonus_score
FROM   Sales.Customers;

-- 6) Har bir buyurtma uchun yetkazib berish manzilini chiqaring: agar ShipAddress
--    bo'sh bo'lsa BillAddress olinsin, u ham bo'sh bo'lsa 'N/A' yozilsin
--    (ustun nomi: delivery_address).
-- Yozing:
SELECT COALESCE (ShipAddress, BillAddress, 'N/A')
FROM   Sales.Orders;

-- 7) Har bir buyurtma uchun OrderID, Quantity va bir dona mahsulot narxini
--    (Sales / Quantity) chiqaring. Quantity 0 bo'lgan qatorda so'rov xatolik
--    bermasin — u yerda natija bo'sh qolsin.
-- Yozing:
SELECT OrderID,
       Quantity,
       CAST (Sales AS DECIMAL (10, 2)) / (NULLIF (Quantity, 0))
FROM   Sales.Orders;

-- 8) Har bir mijoz uchun CustomerID, Score va qo'shimcha belgi ustunini chiqaring:
--    Score bo'sh bo'lsa 1, aks holda 0 (ustun nomi: is_missing_score).
--    Natijani Score bo'yicha saralang.
-- Yozing:
SELECT   CustomerID,
         Score,
         COALESCE (Score * 0, 1) AS is_missing_score
FROM     Sales.Customers
ORDER BY Score;

-- 9) Barcha mijozlarning o'rtacha ballini ikki xil usulda hisoblab, ikkala natijani
--    yonma-yon chiqaring: (a) bo'sh ballar hisobga olinmagan holda,
--    (b) bo'sh ballar 0 deb qaralgan holda. Natijalar nima uchun farq qilishini
--    so'rov ostiga izoh sifatida yozib qo'ying.
-- Yozing:
SELECT AVG(CAST (Score AS DECIMAL (10, 2))) AS avg_excluding_nulls,
       AVG(CAST (COALESCE (Score, 0) AS DECIMAL (10, 2))) AS avg_including_nulls
FROM   Sales.Customers;

-- Farq maxrajda: AVG NULL larni butunlay tashlab ketadi, shuning uchun birinchi
-- ustunda yig'indi faqat bali bor mijozlar soniga bo'linadi. Ikkinchisida NULL
-- 0 ga aylantirilgani uchun u qator ham sanoqqa kiradi — maxraj kattalashadi,
-- o'rtacha esa pasayadi.
-- 10) Hech qanday buyurtma bermagan mijozlarni toping: ularning CustomerID va
--     FirstName'ini chiqaring.
-- Yozing:
SELECT c.CustomerID,
       c.FirstName
FROM   Sales.Customers AS c
       LEFT OUTER JOIN
       Sales.Orders AS o
       ON c.CustomerID = o.CustomerID
WHERE  o.CustomerID IS NULL;

-- 11) Mijozlarni shunday saralang-ki, bali bo'sh bo'lganlar ro'yxatning eng oxirida
--     tursin, qolganlari esa bal bo'yicha kamayish tartibida joylashsin.
-- Yozing:
SELECT   *
FROM     Sales.Customers
ORDER BY IIF (Score IS NULL, 1, 0), Score DESC;

-- 12) Har bir davlat uchun bitta qator chiqaring: davlat nomi, mijozlar soni va
--     bali berilmagan mijozlar soni (ustun nomlari: total_customers, missing_scores).
-- Yozing:
SELECT   Country,
         COUNT(*) AS total_customers,
         COUNT(*) - COUNT(Score) AS missing_scores
FROM     Sales.Customers
GROUP BY Country;