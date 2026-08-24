-- ============================================
-- Mavzu: Data Combining (INNER / LEFT / RIGHT / FULL / CROSS JOIN, anti-join)
-- Jadvallar: customers (id, first_name), orders (order_id, sales, customer_id)
-- ============================================

-- 1) INNER JOIN yordamida har bir buyurtma uchun mijozning first_name'i, order_id va sales'ni chiqaring.
-- Yozing:


-- 2) LEFT JOIN yordamida buyurtmasi bo'lmagan mijozlar ham ko'rinadigan qilib barcha mijozlarni chiqaring.
-- Yozing:


-- 3) Hech qanday buyurtma bermagan mijozlarni toping (LEFT JOIN + IS NULL, anti-join).
-- Yozing:


-- 4) RIGHT JOIN yordamida mijozi bo'lmagan buyurtmalar ham ko'rinadigan qilib barcha buyurtmalarni chiqaring.
-- Yozing:


-- 5) Hech qaysi mijozga bog'lanmagan buyurtmalarni toping (RIGHT JOIN + IS NULL, anti-join).
-- Yozing:


-- 6) FULL JOIN yordamida mijozlar va buyurtmalarning barcha (mos kelgan va kelmagan) holatlarini chiqaring.
-- Yozing:


-- 7) FULL JOIN natijasidan faqat bir-biriga mos kelmagan qatorlarni chiqaring
--    (ya'ni customer_id IS NULL yoki id IS NULL).
-- Yozing:


-- 8) CROSS JOIN yordamida har bir mijozni har bir buyurtma bilan birlashtiring va
--    nechta qator hosil bo'lishini tekshiring.
-- Yozing:


-- 9) INNER JOIN va WHERE'ni birga ishlatib, sales qiymati 500 dan katta bo'lgan
--    buyurtmalar uchun mijoz ismini chiqaring.
-- Yozing:
