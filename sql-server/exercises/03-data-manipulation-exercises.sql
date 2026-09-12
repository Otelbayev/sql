-- ============================================
-- Mavzu: Data Manipulation
-- Baza: MyDatabase
-- Jadvallar: customers (id, first_name, country, score)
--            persons   (id, person_name, birth_date, phone)
-- Eslatma: persons jadvali bo'lmasa, avval uni yuqoridagi ustunlar bilan yarating.
-- ============================================


-- 1) customers jadvaliga bitta yangi mijoz qo'shing:
--    id=6, first_name='Aziz', country='Uzb', score=250.
-- Yozing:



-- 2) customers jadvaliga bir buyruqning o'zida uchta yangi mijoz qo'shing:
--    (7, 'Dilnoza', 'Uzb', 640), (8, 'Olim', 'UK', 120), (9, 'Sardor', 'USA', 480).
-- Yozing:



-- 3) customers jadvaliga id=10, first_name='Nodira' bo'lgan mijoz qo'shing.
--    country va score ustunlariga qiymat berilmasin.
-- Yozing:



-- 4) customers jadvalidagi har bir mijoz uchun persons jadvaliga bittadan qator
--    yozing: id ustuniga mijozning id'si, person_name ustuniga first_name,
--    birth_date bo'sh qolsin, phone ustuniga 'Unknown' matni tushsin.
--    Qiymatlarni qo'lda yozmang — customers jadvalidan o'qib yozing.
-- Yozing:



-- 5) country qiymati 'Uzb' bo'lgan barcha mijozlarning score'ini 999 ga o'zgartiring.
-- Yozing:



-- 6) id=10 bo'lgan mijozning country va score ustunlarini bitta buyruqda yangilang:
--    country='Kazakhstan', score=300.
-- Yozing:



-- 7) score qiymati bo'sh (qiymat berilmagan) bo'lgan barcha mijozlarning score'ini 0 ga tenglang.
-- Yozing:



-- 8) score'i 400 dan kichik bo'lgan mijozlarning score'ini hozirgi qiymatidan 50 ga oshiring.
-- Yozing:



-- 9) customers jadvalidan id qiymati 5 dan katta bo'lgan barcha mijozlarni o'chiring.
-- Yozing:



-- 10) persons jadvalidagi barcha qatorlarni o'chiring, lekin jadvalning o'zi
--     (ustunlari bilan birga) joyida qolsin.
-- Yozing:



-- 11) persons jadvaliga 2 ta yangi qator qo'shing, so'ng jadvalni yana bo'shating —
--     bu safar qatorlarni bitta-bitta o'chirmasdan, butun jadvalni bir zumda tozalaydigan
--     va o'chirilgan qatorlarni jurnalga yozmaydigan buyruqni ishlating.
-- Yozing:



-- 12) 10- va 11-mashqda ishlatgan ikki buyruq bir xil natija berdimi? Jadval bo'sh
--     qolganini tekshiradigan so'rov yozing va ikki buyruq farqini shu yerga izoh
--     (comment) sifatida 1-2 satrda yozib qo'ying.
-- Yozing:
