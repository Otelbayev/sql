-- ============================================
-- Mavzu: Aggregate Functions
-- Baza: MyDatabase
-- Jadvallar: orders    (order_id, customer_id, order_date, sales)
--            customers (id, first_name, country, score)
-- ============================================


-- 1) orders jadvalidagi jami buyurtmalar sonini chiqaring (ustun nomi: total_orders).
-- Yozing:



-- 2) Barcha buyurtmalarning umumiy savdo summasini, o'rtachasini, eng kattasini va
--    eng kichigini bitta qatorda chiqaring
--    (ustun nomlari: total_sales, avg_sales, max_sales, min_sales).
-- Yozing:



-- 3) Har bir mijoz uchun bitta qator chiqaring: customer_id va o'sha mijozning
--    buyurtmalari soni (ustun nomi: total_nr_orders).
-- Yozing:



-- 4) Har bir mijoz uchun buyurtmalar soni, umumiy savdosi, o'rtacha savdosi,
--    eng katta va eng kichik buyurtmasini bitta qatorda chiqaring.
-- Yozing:



-- 5) Nechta har xil mijoz umuman buyurtma berganini hisoblang — bitta son chiqsin
--    (ustun nomi: buyers_count).
-- Yozing:



-- 6) Buyurtmalarning eng erta va eng kech sanasini chiqaring
--    (ustun nomlari: first_order_date, last_order_date).
-- Yozing:



-- 7) Har bir mijoz uchun umumiy savdo summasini hisoblang va natijada faqat
--    summasi 20 dan katta bo'lgan mijozlar qolsin.
-- Yozing:



-- 8) Mijozlar jadvali bo'yicha: jami nechta mijoz borligini va shulardan nechtasining
--    bali berilganini bitta qatorda chiqaring (ustun nomlari: total_customers,
--    customers_with_score).
-- Yozing:



-- 9) Har bir davlat uchun o'rtacha ballni hisoblang va natijani o'rtachasi yuqori
--    davlatdan boshlab saralang.
-- Yozing:



-- 10) Har bir mijoz uchun ismini va uning buyurtmalarining umumiy summasini chiqaring.
--     Buyurtma bermagan mijozlarda 0 ko'rinsin (ustun nomi: total_sales).
-- Yozing:



-- 11) Buyurtmalarni yil va oy bo'yicha guruhlab, har bir oyda nechta buyurtma
--     bo'lganini va o'sha oydagi umumiy savdoni chiqaring. Natija sana bo'yicha
--     o'sish tartibida bo'lsin.
-- Yozing:



-- 12) O'rtacha buyurtma summasidan katta bo'lgan buyurtmalarni chiqaring:
--     order_id, customer_id va sales ko'rinsin.
-- Yozing:
