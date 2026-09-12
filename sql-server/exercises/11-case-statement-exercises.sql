-- ============================================
-- Mavzu: CASE Statement
-- Baza: SalesDB
-- Jadvallar: Sales.Customers (CustomerID, FirstName, LastName, Country, Score)
--            Sales.Employees (EmployeeID, FirstName, LastName, Department,
--                             BirthDate, Gender, Salary, ManagerID)
--            Sales.Orders    (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate,
--                             ShipDate, OrderStatus, Quantity, Sales, CreationTime)
-- ============================================


-- 1) Har bir xodim uchun FirstName, LastName, Gender va jinsining to'liq nomini
--    chiqaring: 'M' uchun 'Male', 'F' uchun 'Female' (ustun nomi: full_gender).
-- Yozing:



-- 2) Har bir mijozga ball darajasini bering: 500 dan katta bo'lsa 'high',
--    200 dan katta bo'lsa 'medium', qolgan hollarda 'low' (ustun nomi: category).
--    Natijada CustomerID, Score va category ko'rinsin.
-- Yozing:



-- 3) Har bir daraja (high / medium / low) uchun nechta mijoz borligini hisoblang.
--    Bali berilmagan mijozlar 'low' guruhiga tushsin.
-- Yozing:



-- 4) Har bir daraja bo'yicha mijozlar ballarining yig'indisini chiqaring va natijani
--    yig'indisi katta guruhdan boshlab saralang. Bali bo'sh mijozlar 0 deb hisoblansin.
-- Yozing:



-- 5) Har bir buyurtma uchun OrderID, Sales va buyurtma hajmi ustunini chiqaring:
--    Sales 50 dan katta bo'lsa 'big', 20 dan katta bo'lsa 'average',
--    qolganlarida 'small' (ustun nomi: order_size).
-- Yozing:



-- 6) Har bir buyurtma uchun OrderStatus ustunini o'zbekchaga o'giring:
--    'Delivered' -> 'Yetkazilgan', 'Shipped' -> 'Jonatildi', boshqa qiymatlar uchun
--    'Nomalum' (ustun nomi: status_uz).
-- Yozing:



-- 7) Har bir mijoz uchun bir qatorda quyidagilarni chiqaring: CustomerID, Score,
--    bo'sh ballar 0 ga almashtirilgan ustun (clean_score), barcha mijozlar bo'yicha
--    o'rtacha ball va bo'sh ballar 0 deb olingandagi o'rtacha ball.
-- Yozing:



-- 8) Har bir mijoz uchun bitta qator chiqaring: CustomerID, uning jami buyurtmalari soni
--    va shulardan nechtasi 30 dan katta savdo bo'lganini ko'rsatuvchi ustun
--    (ustun nomi: big_orders).
-- Yozing:



-- 9) Har bir xodim uchun ismini, Salary'sini va maosh darajasini chiqaring:
--    70000 dan yuqori bo'lsa 'senior', 60000 dan yuqori bo'lsa 'middle',
--    qolganlarida 'junior' (ustun nomi: salary_level).
-- Yozing:



-- 10) Har bir bo'lim (Department) uchun bitta qator chiqaring: bo'lim nomi,
--     undagi erkak xodimlar soni va ayol xodimlar soni
--     (ustun nomlari: male_count, female_count).
-- Yozing:



-- 11) Mijozlarni shunday saralang: avval 'Germany' davlatidagilar, keyin 'USA'
--     davlatidagilar, undan keyin qolgan barcha davlatlar. Har bir guruh ichida
--     esa Score kamayish tartibida joylashsin.
-- Yozing:



-- 12) Har bir buyurtma uchun yetkazib berish tezligini baholang: OrderDate va
--     ShipDate orasidagi farq 5 kundan kam bo'lsa 'fast', 5 dan 10 kungacha bo'lsa
--     'normal', undan ko'p bo'lsa 'slow' (ustun nomi: delivery_speed).
-- Yozing:
