-- ============================================
-- Mavzu: Data Manipulation (INSERT / UPDATE / DELETE / TRUNCATE)
-- Jadvallar: customers (id, first_name, country, score), persons (id, person_name, birth_date, email)
-- ============================================

-- 1) customers jadvaliga yangi mijoz qo'shing: id=11, first_name='Aziz', country='Uzb', score=250.
-- Yozing:


-- 2) customers jadvalidagi id va first_name ustunlarini, persons jadvaliga
--    (id, person_name, birth_date=NULL, email='unknown@mail.com' sifatida) INSERT INTO ... SELECT orqali ko'chiring.
-- Yozing:


-- 3) customers jadvalida country='Uzb' bo'lgan mijozning score qiymatini 999 ga o'zgartiring.
-- Yozing:


-- 4) id=11 bo'lgan mijozning country va score ustunlarini bir vaqtning o'zida yangilang
--    (country='Kazakhstan', score=300).
-- Yozing:


-- 5) customers jadvalidan score=0 bo'lgan barcha yozuvlarni o'chiring.
-- Yozing:


-- 6) persons jadvalidagi barcha yozuvlarni o'chiring, lekin jadval strukturasini saqlab qoling (DELETE, WHERE'siz).
-- Yozing:


-- 7) persons jadvalini TRUNCATE TABLE yordamida tozalang.
-- Yozing:


-- 8) DELETE bilan TRUNCATE orasidagi farqni bilish uchun: avval persons jadvaliga 2 ta yangi
--    qator qo'shing, so'ng TRUNCATE TABLE qiling va natijada jadval bo'sh qolganini SELECT bilan tekshiring.
-- Yozing:
