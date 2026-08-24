-- ============================================
-- Mavzu: String Functions
-- Jadval: customers (id, first_name, country, score)
-- ============================================
-- 1) first_name va country'ni '_' belgisi bilan birlashtirib yangi ustun sifatida chiqaring.
-- Yozing:
SELECT first_name,
       country,
       CONCAT(first_name, '-', country)
FROM   customers;

-- 2) first_name ustunini katta harflarga o'girib chiqaring.
-- Yozing:
SELECT UPPER(first_name)
FROM   customers;

-- 3) country ustunini kichik harflarga o'girib chiqaring.
-- Yozing:
SELECT LOWER(country)
FROM   customers;

-- 4) first_name boshida yoki oxirida ortiqcha bo'sh joy (space) bo'lgan mijozlarni toping.
-- Yozing:
SELECT *
FROM   customers
WHERE  TRIM(first_name) != first_name;

-- 5) '2024/08/24' matnidagi barcha '/' belgilarini '-' ga almashtiring.
-- Yozing:
SELECT '2024/08/24',
       REPLACE('2024/08/24', '/', '-');

-- 6) Har bir mijoz uchun first_name'ning uzunligini hisoblab chiqaring.
-- Yozing:
SELECT len(first_name),
       first_name
FROM   customers;

-- 7) Har bir mijoz uchun first_name'ning (bo'sh joylari olib tashlangan) birinchi 2 ta va
--    oxirgi 2 ta harfini alohida ustunlarda chiqaring.
-- Yozing:
SELECT first_name,
       LEFT(TRIM(first_name), 2),
       RIGHT(TRIM(first_name), 2)
FROM   customers;

-- 8) Har bir mijoz uchun first_name'ning (bo'sh joylari olib tashlangan) 2-harfidan
--    boshlab 3 ta harfini ajratib oling.
-- Yozing:
SELECT first_name,
       SUBSTRING(TRIM(first_name), 2, 3)
FROM   customers;

-- 9) first_name uzunligi 5 tadan katta bo'lgan mijozlarning ismini katta harflarda chiqaring.
-- Yozing:
SELECT UPPER(first_name)
FROM   customers
WHERE  LEN(first_name) > 5;