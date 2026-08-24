-- ============================================
-- Mavzu: Data Manipulation
-- Jadvallar: customers (id, first_name, country, score), persons (id, person_name, birth_date, email)
-- ============================================
-- 1) customers jadvaliga yangi mijoz qo'shing: id=11, first_name='Aziz', country='Uzb', score=250.
-- Yozing:
INSERT  INTO customers (
    id,
    first_name,
    country,
    score
)
VALUES                (11, 'Aziz', 'UZB', 250);

-- 2) customers jadvalidagi id va first_name ustunlarini, persons jadvaliga
--    (id, person_name, birth_date=NULL, email='unknown@mail.com' sifatida) ko'chiring.
-- Yozing:
INSERT INTO persons (
    id,
    person_name,
    birth_date,
    phone
)
SELECT id,
       first_name,
       '2004-04-16',
       'phone'
FROM   customers;

-- 3) customers jadvalida country='Uzb' bo'lgan mijozning score qiymatini 999 ga o'zgartiring.
-- Yozing:
UPDATE customers
SET    score = 999
WHERE  country = 'UZB';

-- 4) id=11 bo'lgan mijozning country va score ustunlarini bir vaqtning o'zida yangilang
--    (country='Kazakhstan', score=300).
-- Yozing:
UPDATE customers
SET    country = 'Kazakistan',
       score   = 300
WHERE  id = 11;

-- 5) customers jadvalidan score=0 bo'lgan barcha yozuvlarni o'chiring.
-- Yozing:
DELETE customers
WHERE  score = 0;

-- 6) persons jadvalidagi barcha yozuvlarni o'chiring, lekin jadval strukturasini saqlab qoling.
-- Yozing:
DELETE persons;

-- 7) persons jadvalini bir buyruq bilan to'liq tozalang (identity hisobi ham qaytadan boshlansin).
-- Yozing:
TRUNCATE TABLE persons;


-- 8) 6- va 7-mashqdagi ikki xil tozalash usulining farqini tekshiring: avval persons jadvaliga 2 ta yangi
--    qator qo'shing, so'ng jadvalni tozalab, natijada bo'sh qolganini tekshiring.
-- Yozing: