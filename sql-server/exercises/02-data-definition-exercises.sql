-- ============================================
-- Mavzu: Data Definition
-- Baza: MyDatabase
-- Eslatma: bu mavzudagi jadvallarni o'zingiz yaratasiz va oxirida o'chirasiz.
-- ============================================


-- 1) "products" nomli jadval yarating. Ustunlari:
--      id           - butun son, bo'sh bo'lishi mumkin emas, jadvalning kaliti
--      product_name - 50 belgigacha matn, bo'sh bo'lishi mumkin emas
--      price        - butun son
--      category     - 50 belgigacha matn
-- Yozing:



-- 2) "suppliers" nomli jadval yarating. Ustunlari:
--      supplier_id  - butun son, bo'sh bo'lishi mumkin emas
--      company_name - 50 belgigacha matn, bo'sh bo'lishi mumkin emas
--      phone        - 20 belgigacha matn
--      joined_date  - sana
--    supplier_id jadvalning kaliti bo'lsin va bu cheklovga pk_suppliers deb nom bering.
-- Yozing:



-- 3) products jadvaliga in_stock nomli yangi ustun qo'shing (10 belgigacha matn).
-- Yozing:



-- 4) products jadvaliga created_at nomli sana ustuni qo'shing.
-- Yozing:



-- 5) products jadvalidan category ustunini butunlay olib tashlang.
-- Yozing:



-- 6) suppliers jadvalidan phone ustunini olib tashlang.
-- Yozing:



-- 7) products jadvalining hozirgi holatini (barcha ustun va qatorlarini) ko'ring.
-- Yozing:



-- 8) suppliers jadvaliga bitta yangi qator qo'shing: supplier_id=1,
--    company_name='Alfa Trade', joined_date='2025-03-01'.
-- Yozing:



-- 9) suppliers jadvalidagi ma'lumotlar saqlanib qolsin, lekin joined_date ustuni
--    endi bo'sh bo'lishi mumkin bo'lmasin — shu talabni qo'ying.
-- Yozing:



-- 10) products jadvalini butunlay yo'q qiling: ichidagi ma'lumotlar ham,
--     jadvalning o'zi ham qolmasin.
-- Yozing:



-- 11) suppliers jadvalini ham butunlay yo'q qiling.
-- Yozing:
