-- ============================================
-- Mavzu: String Functions
-- Baza: MyDatabase
-- Jadval: customers (id, first_name, country, score)
-- Eslatma: ba'zi ismlarda boshida yoki oxirida ortiqcha bo'sh joy bor.
-- ============================================
-- 1) Har bir mijoz uchun first_name va country'ni bitta ustunga qo'shib chiqaring,
--    orasida '-' belgisi tursin (ustun nomi: name_country).
-- Yozing:
SELECT CONCAT(first_name, '-', country) AS name_country
FROM   customers;

-- 2) first_name ustunini butunlay katta harflarda chiqaring (ustun nomi: upper_name).
-- Yozing:
SELECT UPPER(first_name)
FROM   customers;

-- 3) country ustunini butunlay kichik harflarda chiqaring (ustun nomi: lower_name).
-- Yozing:
SELECT LOWER(country)
FROM   customers;

-- 4) first_name'ining boshida yoki oxirida ortiqcha bo'sh joy bor mijozlarni toping.
-- Yozing:
SELECT *
FROM   customers
WHERE  DATALENGTH(first_name) != DATALENGTH(TRIM(first_name));

-- 5) '16-05-2004' matnini shunday o'zgartiring-ki, barcha '-' belgilari '/' ga
--    almashsin. Natijada asl matn ham, o'zgargan matn ham ko'rinsin.
-- Yozing:
SELECT REPLACE('16-05-2004', '-', '/');

-- 6) Har bir mijoz uchun first_name va uning nechta belgidan iboratligini
--    chiqaring (ustun nomi: name_length).
-- Yozing:
SELECT first_name,
       LEN(first_name) AS name_length
FROM   customers;

-- 7) Har bir mijoz uchun first_name'ining (ortiqcha bo'sh joylarsiz) birinchi 3 ta
--    belgisini va oxirgi 3 ta belgisini alohida ustunlarda chiqaring
--    (ustun nomlari: left_part, right_part).
-- Yozing:
SELECT first_name,
       LEFT(TRIM(first_name), 3) AS left_part,
       RIGHT(TRIM(first_name), 3) AS right_part
FROM   customers;

-- 8) Har bir mijoz uchun first_name'ining (ortiqcha bo'sh joylarsiz) 2-belgisidan
--    boshlab 2 ta belgisini ajratib oling (ustun nomi: middle_part).
-- Yozing:
SELECT first_name,
       SUBSTRING(TRIM(first_name), 2, 2)
FROM   customers;

-- 9) Har bir mijoz uchun to'liq ismni shunday chiqaring: birinchi harfi katta,
--    qolgan harflari kichik bo'lsin (masalan 'MARIA' -> 'Maria', ustun nomi: proper_name).
--    Ismdagi ortiqcha bo'sh joylar hisobga olinmasin.
-- Yozing:
SELECT first_name,
       UPPER(LEFT(TRIM(first_name), 1)) + LOWER(SUBSTRING(TRIM(first_name), 2, LEN(TRIM(first_name)) - 1)) AS poper_name
FROM   customers;

-- 10) first_name uzunligi 5 belgidan katta bo'lgan mijozlarning ismini katta
--     harflarda chiqaring.
-- Yozing:
SELECT UPPER(first_name)
FROM   customers
WHERE  LEN(first_name) > 5;

-- 11) Har bir mijoz uchun elektron pochta manzili yasang: ismning kichik harfli
--     ko'rinishi, keyin '@', keyin davlat nomining kichik harfli ko'rinishi va
--     '.com' (masalan 'maria@germany.com', ustun nomi: email).
--     Ismdagi ortiqcha bo'sh joylar natijaga tushmasin.
-- Yozing:
SELECT first_name,
       CONCAT(TRIM(LOWER(first_name)), '@', TRIM(LOWER(country)), '.com')
FROM   customers;

-- 12) Har bir mijoz uchun ismining faqat birinchi harfini va ballini chiqaring,
--     natijani ismning birinchi harfi bo'yicha alifbo tartibida saralang
--     (ustun nomlari: initial, score).
-- Yozing:
SELECT   LEFT(TRIM(first_name), 1) AS initail,
         score
FROM     customers
ORDER BY initail;