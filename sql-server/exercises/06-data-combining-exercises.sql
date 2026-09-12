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



-- 2) Barcha mijozlarni chiqaring va har biriga o'z buyurtmasini biriktiring.
--    Buyurtma bermagan mijozlar ham ro'yxatda qolsin — ularda buyurtma ustunlari bo'sh bo'lsin.
-- Yozing:



-- 3) Bitta ham buyurtma bermagan mijozlarni toping: faqat ularning id va first_name'ini chiqaring.
-- Yozing:



-- 4) Barcha buyurtmalarni chiqaring va har biriga mijozini biriktiring. customers
--    jadvalida mijozi topilmagan buyurtmalar ham ro'yxatda qolsin.
-- Yozing:



-- 5) customers jadvalida mos mijozi yo'q buyurtmalarni toping (ya'ni "egasiz" buyurtmalar).
-- Yozing:



-- 6) Mijozlar va buyurtmalarni shunday birlashtiring-ki, natijada har ikkala jadvalning
--    hamma qatorlari qatnashsin: mos kelganlari ham, mos keluvchisi topilmaganlari ham.
-- Yozing:



-- 7) 6-mashqdagi natijadan faqat juftini topa olmagan qatorlarni qoldiring:
--    ya'ni buyurtmasiz mijozlar va mijozsiz buyurtmalar bitta ro'yxatda chiqsin.
-- Yozing:



-- 8) Har bir mijozni har bir buyurtma bilan juftlab, barcha mumkin bo'lgan
--    kombinatsiyalarni chiqaring. Natijada nechta qator hosil bo'lganini ham tekshiring.
-- Yozing:



-- 9) sales qiymati 20 dan katta bo'lgan buyurtmalar uchun mijozning first_name'ini,
--    order_date va sales'ni chiqaring.
-- Yozing:



-- 10) Har bir mijoz uchun bitta qator chiqaring: first_name va o'sha mijozning
--     buyurtmalari soni (ustun nomi: orders_count). Buyurtma bermagan mijozda 0 tursin.
-- Yozing:



-- 11) 2021-yilning birinchi yarmida (yanvar–iyun) qilingan buyurtmalarni chiqaring:
--     mijoz ismi, order_date va sales. Natija sanaga ko'ra o'sish tartibida bo'lsin.
-- Yozing:



-- 12) Har bir davlat uchun bitta qator chiqaring: country, o'sha davlat mijozlari
--     bergan buyurtmalar soni va ularning umumiy sales summasi. Buyurtmasi bo'lmagan
--     davlatlar ham ro'yxatda ko'rinsin.
-- Yozing:
