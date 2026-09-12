-- ============================================
-- Mavzu: String Functions
-- Baza: MyDatabase
-- Jadval: customers (id, first_name, country, score)
-- Eslatma: ba'zi ismlarda boshida yoki oxirida ortiqcha bo'sh joy bor.
-- ============================================


-- 1) Har bir mijoz uchun first_name va country'ni bitta ustunga qo'shib chiqaring,
--    orasida '-' belgisi tursin (ustun nomi: name_country).
-- Yozing:



-- 2) first_name ustunini butunlay katta harflarda chiqaring (ustun nomi: upper_name).
-- Yozing:



-- 3) country ustunini butunlay kichik harflarda chiqaring (ustun nomi: lower_name).
-- Yozing:



-- 4) first_name'ining boshida yoki oxirida ortiqcha bo'sh joy bor mijozlarni toping.
-- Yozing:



-- 5) '16-05-2004' matnini shunday o'zgartiring-ki, barcha '-' belgilari '/' ga
--    almashsin. Natijada asl matn ham, o'zgargan matn ham ko'rinsin.
-- Yozing:



-- 6) Har bir mijoz uchun first_name va uning nechta belgidan iboratligini
--    chiqaring (ustun nomi: name_length).
-- Yozing:



-- 7) Har bir mijoz uchun first_name'ining (ortiqcha bo'sh joylarsiz) birinchi 3 ta
--    belgisini va oxirgi 3 ta belgisini alohida ustunlarda chiqaring
--    (ustun nomlari: left_part, right_part).
-- Yozing:



-- 8) Har bir mijoz uchun first_name'ining (ortiqcha bo'sh joylarsiz) 2-belgisidan
--    boshlab 2 ta belgisini ajratib oling (ustun nomi: middle_part).
-- Yozing:



-- 9) Har bir mijoz uchun to'liq ismni shunday chiqaring: birinchi harfi katta,
--    qolgan harflari kichik bo'lsin (masalan 'MARIA' -> 'Maria', ustun nomi: proper_name).
--    Ismdagi ortiqcha bo'sh joylar hisobga olinmasin.
-- Yozing:



-- 10) first_name uzunligi 5 belgidan katta bo'lgan mijozlarning ismini katta
--     harflarda chiqaring.
-- Yozing:



-- 11) Har bir mijoz uchun elektron pochta manzili yasang: ismning kichik harfli
--     ko'rinishi, keyin '@', keyin davlat nomining kichik harfli ko'rinishi va
--     '.com' (masalan 'maria@germany.com', ustun nomi: email).
--     Ismdagi ortiqcha bo'sh joylar natijaga tushmasin.
-- Yozing:



-- 12) Har bir mijoz uchun ismining faqat birinchi harfini va ballini chiqaring,
--     natijani ismning birinchi harfi bo'yicha alifbo tartibida saralang
--     (ustun nomlari: initial, score).
-- Yozing:
