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
SELECT FirstName,
       LastName,
       Gender,
       CASE WHEN Gender = 'M' THEN 'Male' ELSE 'Female' END
FROM   Sales.Employees;

-- 2) Har bir mijozga ball darajasini bering: 500 dan katta bo'lsa 'high',
--    200 dan katta bo'lsa 'medium', qolgan hollarda 'low' (ustun nomi: category).
--    Natijada CustomerID, Score va category ko'rinsin.
-- Yozing:
SELECT *,
       CASE WHEN Score > 500 THEN 'high' WHEN Score > 200 THEN 'medium' ELSE 'low' END AS category
FROM   Sales.Customers;

-- 3) Har bir daraja (high / medium / low) uchun nechta mijoz borligini hisoblang.
--    Bali berilmagan mijozlar 'low' guruhiga tushsin.
-- Yozing:
SELECT   CASE WHEN Score > 500 THEN 'high' WHEN Score > 200 THEN 'medium' ELSE 'low' END AS category,
         COUNT(CustomerID) AS count
FROM     Sales.Customers
GROUP BY CASE WHEN Score > 500 THEN 'high' WHEN Score > 200 THEN 'medium' ELSE 'low' END;

-- 4) Har bir daraja bo'yicha mijozlar ballarining yig'indisini chiqaring va natijani
--    yig'indisi katta guruhdan boshlab saralang. Bali bo'sh mijozlar 0 deb hisoblansin.
-- Yozing:
SELECT   CASE WHEN Score > 500 THEN 'high' WHEN Score > 200 THEN 'medium' ELSE 'low' END AS category,
         sum(COALESCE (Score, 0)) AS sum_of_score
FROM     Sales.Customers
GROUP BY CASE WHEN Score > 500 THEN 'high' WHEN Score > 200 THEN 'medium' ELSE 'low' END
ORDER BY sum_of_score DESC;

-- 5) Har bir buyurtma uchun OrderID, Sales va buyurtma hajmi ustunini chiqaring:
--    Sales 50 dan katta bo'lsa 'big', 20 dan katta bo'lsa 'average',
--    qolganlarida 'small' (ustun nomi: order_size).
-- Yozing:
SELECT OrderID,
       Sales,
       Quantity,
       CASE WHEN Sales > 50 THEN 'big' WHEN Sales > 20 THEN 'average' ELSE 'small' END AS order_size
FROM   Sales.Orders;

-- 6) Har bir buyurtma uchun OrderStatus ustunini o'zbekchaga o'giring:
--    'Delivered' -> 'Yetkazilgan', 'Shipped' -> 'Jonatildi', boshqa qiymatlar uchun
--    'Nomalum' (ustun nomi: status_uz).
-- Yozing:
SELECT OrderID,
       OrderStatus,
       CASE WHEN OrderStatus = 'Delivered' THEN 'Yetkazilgan' WHEN OrderStatus = 'Shipped' THEN 'Jonatildi' ELSE 'Nomalum' END AS status_uz
FROM   Sales.Orders;

-- 7) Har bir mijoz uchun bir qatorda quyidagilarni chiqaring: CustomerID, Score,
--    bo'sh ballar 0 ga almashtirilgan ustun (clean_score), barcha mijozlar bo'yicha
--    o'rtacha ball va bo'sh ballar 0 deb olingandagi o'rtacha ball.
-- Yozing:
SELECT CustomerID,
       Score,
       COALESCE (Score, 0) AS clean_score,
       AVG(Score) OVER (),
       AVG(COALESCE (Score, 0)) OVER ()
FROM   Sales.Customers;

-- 8) Har bir mijoz uchun bitta qator chiqaring: CustomerID, uning jami buyurtmalari soni
--    va shulardan nechtasi 30 dan katta savdo bo'lganini ko'rsatuvchi ustun
--    (ustun nomi: big_orders).
-- Yozing:
SELECT   c.CustomerID,
         Count(OrderID) AS Count,
         sum(CASE WHEN o.Sales > 30 THEN 1 ELSE 0 END)
FROM     Sales.Customers AS c
         LEFT OUTER JOIN
         Sales.Orders AS o
         ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

-- 9) Har bir xodim uchun ismini, Salary'sini va maosh darajasini chiqaring:
--    70000 dan yuqori bo'lsa 'senior', 60000 dan yuqori bo'lsa 'middle',
--    qolganlarida 'junior' (ustun nomi: salary_level).
-- Yozing:
SELECT FirstName,
       Salary,
       CASE WHEN Salary > 70000 THEN 'senior' WHEN Salary > 60000 THEN 'middle' ELSE 'junior' END AS salary_level
FROM   Sales.Employees;

-- 10) Har bir bo'lim (Department) uchun bitta qator chiqaring: bo'lim nomi,
--     undagi erkak xodimlar soni va ayol xodimlar soni
--     (ustun nomlari: male_count, female_count).
-- Yozing:
SELECT   Department,
         COUNT(EmployeeID) AS count,
         sum(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS 'male_count',
         sum(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS 'female_count'
FROM     Sales.Employees
GROUP BY Department;

-- 11) Mijozlarni shunday saralang: avval 'Germany' davlatidagilar, keyin 'USA'
--     davlatidagilar, undan keyin qolgan barcha davlatlar. Har bir guruh ichida
--     esa Score kamayish tartibida joylashsin.
-- Yozing:
SELECT   *
FROM     Sales.Customers
ORDER BY CASE WHEN Country = 'Germany' THEN 1 WHEN Country = 'USA' THEN 2 ELSE 3 END, Score DESC;

-- 12) Har bir buyurtma uchun yetkazib berish tezligini baholang: OrderDate va
--     ShipDate orasidagi farq 5 kundan kam bo'lsa 'fast', 5 dan 10 kungacha bo'lsa
--     'normal', undan ko'p bo'lsa 'slow' (ustun nomi: delivery_speed).
-- Yozing:
SELECT OrderID,
       OrderDate,
       ShipDate,
       DATEDIFF(DAY, OrderDate, ShipDate),
       CASE WHEN DATEDIFF(day, OrderDate, ShipDate) > 10 THEN 'slow' WHEN DATEDIFF(DAY, OrderDate, ShipDate) >= 5 THEN 'normal' ELSE 'fast' END AS delivery_speed
FROM   Sales.Orders;