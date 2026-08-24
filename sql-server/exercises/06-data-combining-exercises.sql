-- ============================================
-- Mavzu: Data Combining (jadvallarni birlashtirish)
-- Jadvallar: customers (id, first_name), orders (order_id, sales, customer_id)
-- ============================================
-- 1) Faqat bir-biriga mos kelgan qatorlar uchun mijozning first_name'i,
--    order_id va sales'ni chiqaring.
-- Yozing:
SELECT c.first_name,
       o.order_id,
       o.sales
FROM   customers AS c
       INNER JOIN
       orders AS o
       ON c.id = o.customer_id;

-- 2) Barcha mijozlarni chiqaring — buyurtmasi bo'lmaganlari ham natijada ko'rinsin.
-- Yozing:
SELECT *
FROM   customers
       LEFT OUTER JOIN
       orders
       ON customers.id = orders.customer_id;

-- 3) Hech qanday buyurtma bermagan mijozlarni toping.
-- Yozing:
SELECT *
FROM   customers
       LEFT OUTER JOIN
       orders
       ON customers.id = orders.customer_id
WHERE  orders.customer_id IS NULL;

-- 4) Barcha buyurtmalarni chiqaring — mijozi topilmaganlari ham natijada ko'rinsin.
-- Yozing:
SELECT *
FROM   orders
       LEFT OUTER JOIN
       customers
       ON orders.customer_id = customers.id;

-- 5) Hech qaysi mijozga bog'lanmagan buyurtmalarni toping.
-- Yozing:
SELECT *
FROM   orders
       LEFT OUTER JOIN
       customers
       ON orders.customer_id = customers.id
WHERE  customers.id IS NULL;

-- 6) Mijozlar va buyurtmalarning barcha holatlarini (mos kelgan va kelmaganlarini)
--    bitta natijada chiqaring.
-- Yozing:
SELECT *
FROM   customers
       FULL OUTER JOIN
       orders
       ON customers.id = orders.customer_id;

-- 7) 6-mashqdagi natijadan faqat bir-biriga mos kelmagan qatorlarni chiqaring
--    (ya'ni customer_id IS NULL yoki id IS NULL).
-- Yozing:
SELECT *
FROM   customers
       FULL OUTER JOIN
       orders
       ON customers.id = orders.customer_id
WHERE  orders.customer_id IS NULL
       OR customers.id IS NULL;

-- 8) Har bir mijozni har bir buyurtma bilan juftlab chiqaring va
--    nechta qator hosil bo'lishini tekshiring.
-- Yozing:
SELECT COUNT(customers.id)
FROM   customers CROSS JOIN orders;

-- 9) sales qiymati 500 dan katta bo'lgan buyurtmalar uchun mijoz ismini chiqaring.
-- Yozing:
SELECT customers.first_name
FROM   customers
       INNER JOIN
       orders
       ON customers.id = orders.customer_id
WHERE  orders.sales > 500;