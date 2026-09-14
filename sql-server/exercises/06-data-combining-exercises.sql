-- ============================================
-- Mavzu: Data Combining
-- Baza: MyDatabase
-- Jadvallar: customers (id, first_name, country, score)
--            orders    (order_id, customer_id, order_date, sales)
-- ============================================
-- 1) Buyurtma bergan mijozlar bo'yicha natija chiqaring: mijozning id'si, first_name,
--    order_id va sales. Natijada faqat mijoz bilan buyurtma bir-biriga mos kelgan
--    qatorlar bo'lsin.
-- Yozing:
SELECT c.id,
       c.first_name,
       o.order_id,
       o.sales
FROM   customers AS c
       INNER JOIN
       orders AS o
       ON c.id = o.customer_id;

-- 2) Barcha mijozlarni chiqaring va har biriga o'z buyurtmasini biriktiring.
--    Buyurtma bermagan mijozlar ham ro'yxatda qolsin — ularda buyurtma ustunlari bo'sh bo'lsin.
-- Yozing:
SELECT *
FROM   customers AS c
       LEFT OUTER JOIN
       orders AS o
       ON c.id = o.customer_id;

-- 3) Bitta ham buyurtma bermagan mijozlarni toping: faqat ularning id va first_name'ini chiqaring.
-- Yozing:
SELECT c.id,
       c.first_name
FROM   customers AS c
       LEFT OUTER JOIN
       orders AS o
       ON c.id = o.customer_id
WHERE  o.customer_id IS NULL;

-- 4) Barcha buyurtmalarni chiqaring va har biriga mijozini biriktiring. customers
--    jadvalida mijozi topilmagan buyurtmalar ham ro'yxatda qolsin.
-- Yozing:
SELECT *
FROM   orders
       LEFT OUTER JOIN
       customers
       ON orders.customer_id = customers.id;

-- 5) customers jadvalida mos mijozi yo'q buyurtmalarni toping (ya'ni "egasiz" buyurtmalar).
-- Yozing:
SELECT *
FROM   orders AS o
       LEFT OUTER JOIN
       customers AS c
       ON o.customer_id = c.id
WHERE  c.id IS NULL;

-- 6) Mijozlar va buyurtmalarni shunday birlashtiring-ki, natijada har ikkala jadvalning
--    hamma qatorlari qatnashsin: mos kelganlari ham, mos keluvchisi topilmaganlari ham.
-- Yozing:
SELECT *
FROM   customers AS c
       FULL OUTER JOIN
       orders AS o
       ON c.id = o.customer_id;

-- 7) 6-mashqdagi natijadan faqat juftini topa olmagan qatorlarni qoldiring:
--    ya'ni buyurtmasiz mijozlar va mijozsiz buyurtmalar bitta ro'yxatda chiqsin.
-- Yozing:
SELECT *
FROM   customers AS c
       FULL OUTER JOIN
       orders AS o
       ON c.id = o.customer_id
WHERE  c.id IS NULL
       OR o.customer_id IS NULL;

-- 8) Har bir mijozni har bir buyurtma bilan juftlab, barcha mumkin bo'lgan
--    kombinatsiyalarni chiqaring. Natijada nechta qator hosil bo'lganini ham tekshiring.
-- Yozing:
SELECT *
FROM   customers CROSS JOIN orders;

SELECT COUNT(*) AS row_count
FROM   customers CROSS JOIN orders;

-- 9) sales qiymati 20 dan katta bo'lgan buyurtmalar uchun mijozning first_name'ini,
--    order_date va sales'ni chiqaring.
-- Yozing:
SELECT o.order_date,
       o.sales,
       c.first_name
FROM   orders AS o
       LEFT OUTER JOIN
       customers AS c
       ON o.customer_id = c.id
WHERE  o.sales > 20;

-- 10) Har bir mijoz uchun bitta qator chiqaring: first_name va o'sha mijozning
--     buyurtmalari soni (ustun nomi: orders_count). Buyurtma bermagan mijozda 0 tursin.
-- Yozing:
SELECT   c.id,
         c.first_name,
         COUNT(o.order_id) AS orders_count
FROM     customers AS c
         LEFT OUTER JOIN
         orders AS o
         ON c.id = o.customer_id
GROUP BY c.id, c.first_name;

-- 11) 2021-yilning birinchi yarmida (yanvar–iyun) qilingan buyurtmalarni chiqaring:
--     mijoz ismi, order_date va sales. Natija sanaga ko'ra o'sish tartibida bo'lsin.
-- Yozing:
SELECT   c.first_name,
         o.order_date,
         o.sales
FROM     orders AS o
         LEFT OUTER JOIN
         customers AS c
         ON o.customer_id = c.id
WHERE    o.order_date BETWEEN '2021-01-01' AND '2021-07-01'
ORDER BY o.order_date;

-- 12) Har bir davlat uchun bitta qator chiqaring: country, o'sha davlat mijozlari
--     bergan buyurtmalar soni va ularning umumiy sales summasi. Buyurtmasi bo'lmagan
--     davlatlar ham ro'yxatda ko'rinsin.
-- Yozing:
SELECT   c.country,
         count(o.order_id),
         SUM(o.sales)
FROM     customers AS c
         LEFT OUTER JOIN
         orders AS o
         ON c.id = o.customer_id
GROUP BY c.country;