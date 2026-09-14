-- ============================================
-- Mavzu: Aggregate Functions
-- Baza: MyDatabase
-- Jadvallar: orders    (order_id, customer_id, order_date, sales)
--            customers (id, first_name, country, score)
-- ============================================
-- 1) orders jadvalidagi jami buyurtmalar sonini chiqaring (ustun nomi: total_orders).
-- Yozing:
SELECT COUNT(order_id)
FROM   orders;

-- 2) Barcha buyurtmalarning umumiy savdo summasini, o'rtachasini, eng kattasini va
--    eng kichigini bitta qatorda chiqaring
--    (ustun nomlari: total_sales, avg_sales, max_sales, min_sales).
-- Yozing:
SELECT SUM(sales) AS total_sales,
       AVG(sales) AS avg_sales,
       MAX(sales) AS max_sales,
       MIN(sales) AS min_sales
FROM   orders;

-- 3) Har bir mijoz uchun bitta qator chiqaring: customer_id va o'sha mijozning
--    buyurtmalari soni (ustun nomi: total_nr_orders).
-- Yozing:
SELECT   c.id,
         c.first_name,
         COUNT(order_id) AS total_nr_orders
FROM     customers AS c
         LEFT OUTER JOIN
         orders AS o
         ON c.id = o.customer_id
GROUP BY c.id, c.first_name;

-- 4) Har bir mijoz uchun buyurtmalar soni, umumiy savdosi, o'rtacha savdosi,
--    eng katta va eng kichik buyurtmasini bitta qatorda chiqaring.
-- Yozing:
SELECT   c.id,
         c.first_name,
         COUNT(o.order_id) AS total_orders,
         AVG(o.sales) AS avg_sales,
         MAX(o.sales) AS max_sales,
         MIN(o.sales) AS min_sales
FROM     customers AS c
         LEFT OUTER JOIN
         orders AS o
         ON c.id = o.customer_id
GROUP BY c.id, c.first_name;

-- 5) Nechta har xil mijoz umuman buyurtma berganini hisoblang — bitta son chiqsin
--    (ustun nomi: buyers_count).
-- Yozing:
SELECT COUNT(DISTINCT c.id) AS buyers_count
FROM   customers AS c
       LEFT OUTER JOIN
       orders AS o
       ON c.id = o.customer_id
WHERE  o.customer_id IS NOT NULL;

-- 6) Buyurtmalarning eng erta va eng kech sanasini chiqaring
--    (ustun nomlari: first_order_date, last_order_date).
-- Yozing:
SELECT min(order_date) AS first_order_date,
       max(order_date) AS last_order_date
FROM   orders;

-- 7) Har bir mijoz uchun umumiy savdo summasini hisoblang va natijada faqat
--    summasi 20 dan katta bo'lgan mijozlar qolsin.
-- Yozing:
SELECT   c.id,
         c.first_name,
         sum(o.sales) AS total_sales
FROM     customers AS c
         LEFT OUTER JOIN
         orders AS o
         ON c.id = o.customer_id
GROUP BY c.id, c.first_name
HAVING   sum(o.sales) > 20;

-- 8) Mijozlar jadvali bo'yicha: jami nechta mijoz borligini va shulardan nechtasining
--    bali berilganini bitta qatorda chiqaring (ustun nomlari: total_customers,
--    customers_with_score).
-- Yozing:
SELECT count(id) AS total_customers,
       count(score) AS coustomers_with_score
FROM   customers;

-- 9) Har bir davlat uchun o'rtacha ballni hisoblang va natijani o'rtachasi yuqori
--    davlatdan boshlab saralang.
-- Yozing:
SELECT   country,
         AVG(score) AS avg_score
FROM     customers
GROUP BY country
ORDER BY AVG(score) DESC;

-- 10) Har bir mijoz uchun ismini va uning buyurtmalarining umumiy summasini chiqaring.
--     Buyurtma bermagan mijozlarda 0 ko'rinsin (ustun nomi: total_sales).
-- Yozing:
SELECT   c.id,
         c.first_name,
         SUM(COALESCE (o.sales, 0)) AS total_sales
FROM     customers AS c
         LEFT OUTER JOIN
         orders AS o
         ON c.id = o.customer_id
GROUP BY c.id, c.first_name;

-- 11) Buyurtmalarni yil va oy bo'yicha guruhlab, har bir oyda nechta buyurtma
--     bo'lganini va o'sha oydagi umumiy savdoni chiqaring. Natija sana bo'yicha
--     o'sish tartibida bo'lsin.
-- Yozing:
SELECT   YEAR(order_date) AS order_year,
         MONTH(order_date) AS order_month,
         COUNT(order_id) AS total_orders,
         SUM(sales) AS total_sales
FROM     orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

-- 12) O'rtacha buyurtma summasidan katta bo'lgan buyurtmalarni chiqaring:
--     order_id, customer_id va sales ko'rinsin.
-- Yozing:
SELECT order_id,
       customer_id,
       sales
FROM   orders
WHERE  sales > (SELECT AVG(sales)
                FROM   orders);