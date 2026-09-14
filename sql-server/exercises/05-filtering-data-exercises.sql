-- ============================================
-- Mavzu: Filtering Data
-- Baza: MyDatabase
-- Jadval: customers (id, first_name, country, score)
-- ============================================
-- 1) country qiymati 'USA' bo'lgan va ayni paytda score'i 500 dan katta bo'lgan
--    mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  country = 'USA'
       AND score > 500;

-- 2) country qiymati 'USA' bo'lgan yoki score'i 500 dan katta bo'lgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  country = 'USA'
       OR score > 500;

-- 3) score'i 500 dan kichik bo'lmagan mijozlarni chiqaring — shartni inkor orqali yozing.
-- Yozing:
SELECT *
FROM   customers
WHERE  NOT score < 500;

-- 4) score'i 100 dan 500 gacha (ikkala chegara ham kiradi) bo'lgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  score BETWEEN 100 AND 500;

-- 5) country qiymati 'USA' yoki 'UK' bo'lgan mijozlarni chiqaring — bu shartni
--    OR ishlatmasdan, bitta ro'yxat orqali yozing.
-- Yozing:
SELECT *
FROM   customers
WHERE  country IN ('USA', 'UK');

-- 6) country qiymati na 'USA', na 'UK' bo'lgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  country NOT IN ('USA', 'UK');

-- 7) first_name 'M' harfi bilan boshlanadigan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  first_name LIKE 'M%';

-- 8) first_name 'n' harfi bilan tugaydigan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  first_name LIKE '%n';

-- 9) first_name ichida (qayerda bo'lishidan qat'i nazar) 'r' harfi bor mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  first_name LIKE '%r%';

-- 10) first_name'ning uchinchi harfi 'r' bo'lgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  first_name LIKE '__r%';

-- 11) country qiymati 'USA' yoki 'UK' bo'lgan va score'i 100 dan 500 gacha bo'lgan
--     mijozlarni chiqaring, natija score bo'yicha kamayish tartibida bo'lsin.
-- Yozing:
SELECT   *
FROM     customers
WHERE    country IN ('USA', 'UK')
         AND score BETWEEN 100 AND 500
ORDER BY score DESC;

-- 12) 'Germany' davlatidan bo'lmagan, score'i 300 dan katta va ismi 'M' harfi bilan
--     boshlanmaydigan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  country != 'Germany'
       AND score > 300
       AND first_name NOT LIKE 'M%';