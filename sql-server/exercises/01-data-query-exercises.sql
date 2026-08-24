-- ============================================
-- Mavzu: Data Query (SELECT asoslari)
-- Jadval: customers (id, first_name, country, score)
-- ============================================
-- 1) customers jadvalidagi barcha ustun va qatorlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers;

-- 2) Faqat first_name va score ustunlarini chiqaring.
-- Yozing:
SELECT first_name,
       score
FROM   customers;

-- 3) score qiymati 400 dan katta bo'lgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  score > 400;

-- 4) country = 'UK' bo'lgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  country = 'UK';

-- 5) score noldan farqli bo'lgan mijozlarni score bo'yicha o'sish tartibida saralang.
-- Yozing:
SELECT   *
FROM     customers
WHERE    score != 0
ORDER BY score ASC;

-- 6) Har bir davlat (country) bo'yicha guruhlab, jami score ni chiqaring.
-- Yozing:
SELECT   country,
         SUM(score) AS sum_score
FROM     customers
GROUP BY country;

-- 7) Har bir davlat bo'yicha o'rtacha score'ni hisoblang va faqat o'rtachasi 300 dan katta bo'lgan davlatlarni qoldiring.
-- Yozing:
SELECT   country,
         AVG(score) AS avg_score
FROM     customers
GROUP BY country
HAVING   AVG(score) > 300;

-- 8) customers jadvalidagi takrorlanmas davlatlar ro'yxatini chiqaring.
-- Yozing:
SELECT DISTINCT country, first_name
FROM   customers;


-- 9) Eng yuqori score'ga ega bo'lgan 5 ta mijozni chiqaring.
-- Yozing:
SELECT   TOP 5 *
FROM     customers
ORDER BY score DESC;


-- 10) country = 'USA' bo'lgan mijozlar orasidan score bo'yicha eng past 2 tasini chiqaring.
-- Yozing:
SELECT   TOP 2 *
FROM     customers
WHERE    country = 'USA'
ORDER BY score ASC;