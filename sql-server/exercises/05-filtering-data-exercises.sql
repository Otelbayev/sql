-- ============================================
-- Mavzu: Filtering Data
-- Jadval: customers (id, first_name, country, score)
-- ============================================
-- 1) country = 'USA' VA score 200 dan katta bo'lgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  country = 'USA'
       AND score > 200;

-- 2) country = 'UK' YOKI score 800 dan katta bo'lgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  country = 'UK'
       OR score > 800;

-- 3) score 300 dan kichik BO'LMAGAN mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  NOT score < 300;

-- 4) score 200 va 600 oralig'ida bo'lgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  score BETWEEN 200 AND 600;

-- 5) country ustuni 'USA', 'UK' yoki 'Uzb' bo'lgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  country IN ('USA', 'UK', 'UZB');

-- 6) first_name 'A' harfi bilan boshlanuvchi mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  first_name LIKE 'A%';

-- 7) first_name 'a' harfi bilan tugaydigan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  first_name LIKE '%a';

-- 8) first_name tarkibida 'ar' harflar ketma-ketligi bor mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  first_name LIKE '%ar%';

-- 9) first_name aynan 4 ta harfdan iborat bo'lgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  first_name LIKE '____';

SELECT *
FROM   customers
WHERE  LEN(first_name) = 4;

-- 10) country 'USA' yoki 'UK' bo'lgan va score 100 dan 500 gacha bo'lgan
--     mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  country IN ('USA', 'UK')
       AND score BETWEEN 100 AND 500;