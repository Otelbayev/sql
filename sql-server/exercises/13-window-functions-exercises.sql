-- ============================================
-- Mavzu: Window Functions
-- Baza: SalesDB
-- Jadvallar: Sales.Orders       (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate,
--                                ShipDate, OrderStatus, Quantity, Sales, CreationTime)
--            Sales.Customers    (CustomerID, FirstName, LastName, Country, Score)
--            Sales.Employees    (EmployeeID, FirstName, LastName, Department,
--                                BirthDate, Gender, Salary, ManagerID)
--            Sales.OrdersArchive (Sales.Orders bilan bir xil ustunlar)
-- ============================================
-- 1) Har bir buyurtma qatorida OrderID, OrderDate, Sales va yonida barcha
--    buyurtmalarning umumiy savdo summasi tursin (ustun nomi: TotalSales).
--    Qatorlar soni kamaymasin — har bir buyurtma alohida qator bo'lib qolsin.
-- Yozing:
SELECT OrderID,
       OrderDate,
       Sales,
       SUM(Sales) OVER () AS TotalSales
FROM   Sales.Orders;

-- 2) Har bir buyurtma qatoriga o'sha buyurtmadagi mahsulot (ProductID) bo'yicha
--    umumiy savdo summasini qo'shing (ustun nomi: TotalSalesByProduct).
-- Yozing:
SELECT *,
       sum(Sales) OVER (PARTITION BY ProductID) AS TotalSalesByProduct
FROM   Sales.Orders;

-- 3) Bitta natijada uchta yig'indini yonma-yon ko'rsating: barcha buyurtmalar
--    bo'yicha umumiy savdo, mahsulot bo'yicha savdo va mahsulot + OrderStatus
--    juftligi bo'yicha savdo.
-- Yozing:
SELECT OrderID,
       ProductID,
       OrderStatus,
       OrderDate,
       Sales,
       SUM(Sales) OVER () AS TotalSales,
       SUM(Sales) OVER (PARTITION BY ProductID) AS TotalSalesByProduct,
       SUM(Sales) OVER (PARTITION BY ProductID, OrderStatus) AS TotalSalesByProductAndStatus
FROM   Sales.Orders;

-- 4) Har bir buyurtma uchun uning savdosi umumiy savdoning necha foizini
--    tashkil qilishini 2 xonagacha aniqlikda hisoblang (ustun nomi: SalesPercentage).
-- Yozing:
SELECT OrderID,
       ProductID,
       Sales,
       SUM(Sales) OVER () AS TotalSales,
       (Sales * 100.0) / SUM(Sales) OVER () AS SalesPercentage
FROM   Sales.Orders;

-- 5) Har bir buyurtma qatorida umumiy o'rtacha savdo va o'sha mahsulot bo'yicha
--    o'rtacha savdo ko'rinsin (ustun nomlari: AvgSales, AvgSalesByProduct).
-- Yozing:
SELECT OrderID,
       OrderDate,
       ProductID,
       Sales,
       AVG(Sales) OVER () AS AvgSales,
       AVG(Sales) OVER (PARTITION BY ProductID) AS AvgSalesByProduct
FROM   Sales.Orders;

-- 6) O'rtacha savdodan yuqori bo'lgan buyurtmalarni chiqaring: OrderID, ProductID,
--    Sales va o'rtacha savdo ustuni ko'rinsin.
-- Yozing:
SELECT *
FROM   (SELECT OrderID,
               ProductID,
               Sales,
               AVG(Sales) OVER () AS AvgSales
        FROM   Sales.Orders) AS t
WHERE  Sales > AvgSales;

-- 7) Har bir buyurtma qatorida eng kichik va eng katta savdo qiymatlari ko'rinsin:
--    ham umumiy bo'yicha, ham o'sha mahsulot bo'yicha (4 ta ustun).
-- Yozing:
SELECT OrderID,
       ProductID,
       Sales,
       MIN(Sales) OVER () AS MinSalesOverall,
       MAX(Sales) OVER () AS MaxSalesOverall,
       MIN(Sales) OVER (PARTITION BY ProductID) AS MinSalesByProduct,
       MAX(Sales) OVER (PARTITION BY ProductID) AS MaxSalesByProduct
FROM   Sales.Orders;

-- 8) Eng yuqori maosh oladigan xodim(lar)ni toping — maoshi eng katta qiymatga
--    teng bo'lgan barcha qatorlar chiqsin.
-- Yozing:
SELECT EmployeeID,
       FirstName,
       LastName,
       Department,
       Salary
FROM   (SELECT *,
               MAX(Salary) OVER () AS MaxSalary
        FROM   Sales.Employees) AS t
WHERE  t.Salary = t.MaxSalary;

-- 9) Buyurtmalarni Sales bo'yicha kamayish tartibida uch xil usulda raqamlang va
--    natijalarni yonma-yon solishtiring: (a) har bir qatorga uzluksiz tartib raqami,
--    (b) teng qiymatlarga bir xil o'rin beriladigan va keyingi o'rin(lar) tashlab
--    ketiladigan usul, (c) teng qiymatlarga bir xil o'rin beriladigan, lekin o'rinlar
--    tashlab ketilmaydigan usul.
-- Yozing:
SELECT ROW_NUMBER() OVER (ORDER BY Sales DESC) AS a,
       RANK() OVER (ORDER BY Sales DESC) AS b,
       DENSE_RANK() OVER (ORDER BY Sales DESC) AS c,
       Sales
FROM   Sales.Orders;

-- 10) Har bir mahsulot ichida buyurtmalarni Sales bo'yicha kamayish tartibida
--     raqamlang: har bir mahsulotning eng katta savdosi 1-o'rin bo'lsin
--     (ustun nomi: RankByProduct).
-- Yozing:
SELECT ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY Sales DESC) AS RankByProduct,
       *
FROM   Sales.Orders;

-- 11) Har bir mijoz uchun umumiy savdo summasini hisoblang va shulardan eng kam
--     savdo qilgan 2 ta mijozni chiqaring. Natijani TOP ishlatmasdan, tartib raqami
--     orqali cheklang.
-- Yozing:
SELECT *
FROM   (SELECT   CustomerID,
                 SUM(Sales) AS TotalSales,
                 ROW_NUMBER() OVER (ORDER BY SUM(Sales)) AS SalesRank
        FROM     Sales.Orders
        GROUP BY CustomerID) AS t
WHERE  t.SalesRank <= 2;

-- 12) Sales.OrdersArchive jadvalida OrderID takrorlanadimi yoki yo'qmi — shuni
--     tekshiradigan so'rov yozing: har bir qatorda o'sha OrderID necha marta
--     uchraganini ko'rsatuvchi ustun bo'lsin (ustun nomi: CheckPK).
-- Yozing:
SELECT CustomerID,
       ProductID,
       OrderID,
       COUNT(OrderID) OVER (PARTITION BY OrderID) AS CheckPK
FROM   Sales.OrdersArchive;

