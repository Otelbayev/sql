-- ============================================
-- Mavzu: Data Query
-- Baza: MyDatabase
-- Jadval: customers (id, first_name, country, score)
-- ============================================
-- 1) customers jadvalidagi barcha ustun va barcha qatorlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers;

-- 2) Faqat first_name va score ustunlarini chiqaring.
-- Yozing:
SELECT first_name,
       score
FROM   customers;

-- 3) score qiymati 500 dan katta bo'lgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  score > 500;

-- 4) country qiymati 'Germany' bo'lgan mijozlarni chiqaring.
-- Yozing:
SELECT *
FROM   customers
WHERE  country = 'Germany';

-- 5) Barcha mijozlarni score bo'yicha kamayish tartibida chiqaring.
-- Yozing:
SELECT   *
FROM     customers
ORDER BY score DESC;

-- 6) score qiymati 0 ga teng bo'lmagan mijozlarni chiqaring: avval country bo'yicha
SELECT   *
FROM     customers
WHERE    score != 0
ORDER BY country;

--    alifbo teskari tartibida, keyin ayni bir davlat ichida score o'sish tartibida saralansin.
-- Yozing:
SELECT   *
FROM     customers
ORDER BY country ASC, score DESC;

-- 7) customers jadvalidagi davlatlar ro'yxatini chiqaring, har bir davlat nomi
--    natijada faqat bir marta ko'rinsin.
-- Yozing:
SELECT DISTINCT country
FROM   customers;

-- 8) Har bir davlat uchun bitta qator chiqaring: country va o'sha davlatdagi
--    mijozlar score'larining yig'indisi (ustun nomi: total_score).
-- Yozing:
SELECT   country,
         SUM(score) AS total_score
FROM     customers
GROUP BY country;

-- 9) Har bir davlat uchun mijozlar score'larining yig'indisini hisoblang, lekin
--    natijada faqat yig'indisi 800 dan katta bo'lgan davlatlar qolsin.
-- Yozing:
SELECT   country,
         SUM(score) AS total_score
FROM     customers
GROUP BY country
HAVING   SUM(score) > 800;

-- 10) score qiymati 0 ga teng bo'lmagan mijozlar bo'yicha har bir davlatning o'rtacha
--     score'ini hisoblang (ustun nomi: average_score) va natijada faqat o'rtachasi
--     450 dan katta bo'lgan davlatlarni qoldiring.
-- Yozing:
SELECT   country,
         AVG(score) AS avarage_score
FROM     customers
WHERE    score != 0
GROUP BY country
HAVING   AVG(score) < 450;

-- 11) Eng yuqori score'ga ega 3 ta mijozni chiqaring.
-- Yozing:
SELECT   TOP 3 *
FROM     customers
ORDER BY score DESC;

-- 12) country qiymati 'USA' bo'lgan mijozlar orasidan eng past score'ga ega 2 tasini chiqaring.
-- Yozing:
SELECT   TOP 2 *
FROM     customers
WHERE    country = 'USA'
ORDER BY score;