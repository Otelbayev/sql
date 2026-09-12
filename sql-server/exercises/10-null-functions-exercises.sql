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



-- 2) Score qiymati berilgan mijozlarni chiqaring.
-- Yozing:



-- 3) Har bir mijoz uchun CustomerID, FirstName va Score'ni chiqaring, lekin Score
--    bo'sh bo'lsa uning o'rniga 0 ko'rinsin (ustun nomi: clean_score).
-- Yozing:



-- 4) Har bir mijoz uchun to'liq ismni bitta ustunda chiqaring (FirstName va LastName
--    orasida bo'sh joy bilan). LastName bo'sh bo'lgan mijozda ham natija bo'sh
--    bo'lib qolmasin — LastName o'rniga 'Unknown' yozilsin.
-- Yozing:



-- 5) Har bir mijozning ballini 10 ballga oshirib chiqaring. Ball berilmagan
--    mijozda natija 10 bo'lsin, bo'sh qolmasin (ustun nomi: bonus_score).
-- Yozing:



-- 6) Har bir buyurtma uchun yetkazib berish manzilini chiqaring: agar ShipAddress
--    bo'sh bo'lsa BillAddress olinsin, u ham bo'sh bo'lsa 'N/A' yozilsin
--    (ustun nomi: delivery_address).
-- Yozing:



-- 7) Har bir buyurtma uchun OrderID, Quantity va bir dona mahsulot narxini
--    (Sales / Quantity) chiqaring. Quantity 0 bo'lgan qatorda so'rov xatolik
--    bermasin — u yerda natija bo'sh qolsin.
-- Yozing:



-- 8) Har bir mijoz uchun CustomerID, Score va qo'shimcha belgi ustunini chiqaring:
--    Score bo'sh bo'lsa 1, aks holda 0 (ustun nomi: is_missing_score).
--    Natijani Score bo'yicha saralang.
-- Yozing:



-- 9) Barcha mijozlarning o'rtacha ballini ikki xil usulda hisoblab, ikkala natijani
--    yonma-yon chiqaring: (a) bo'sh ballar hisobga olinmagan holda,
--    (b) bo'sh ballar 0 deb qaralgan holda. Natijalar nima uchun farq qilishini
--    so'rov ostiga izoh sifatida yozib qo'ying.
-- Yozing:



-- 10) Hech qanday buyurtma bermagan mijozlarni toping: ularning CustomerID va
--     FirstName'ini chiqaring.
-- Yozing:



-- 11) Mijozlarni shunday saralang-ki, bali bo'sh bo'lganlar ro'yxatning eng oxirida
--     tursin, qolganlari esa bal bo'yicha kamayish tartibida joylashsin.
-- Yozing:



-- 12) Har bir davlat uchun bitta qator chiqaring: davlat nomi, mijozlar soni va
--     bali berilmagan mijozlar soni (ustun nomlari: total_customers, missing_scores).
-- Yozing:
