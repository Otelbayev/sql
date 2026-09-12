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



-- 2) Har bir buyurtma qatoriga o'sha buyurtmadagi mahsulot (ProductID) bo'yicha
--    umumiy savdo summasini qo'shing (ustun nomi: TotalSalesByProduct).
-- Yozing:



-- 3) Bitta natijada uchta yig'indini yonma-yon ko'rsating: barcha buyurtmalar
--    bo'yicha umumiy savdo, mahsulot bo'yicha savdo va mahsulot + OrderStatus
--    juftligi bo'yicha savdo.
-- Yozing:



-- 4) Har bir buyurtma uchun uning savdosi umumiy savdoning necha foizini
--    tashkil qilishini 2 xonagacha aniqlikda hisoblang (ustun nomi: SalesPercentage).
-- Yozing:



-- 5) Har bir buyurtma qatorida umumiy o'rtacha savdo va o'sha mahsulot bo'yicha
--    o'rtacha savdo ko'rinsin (ustun nomlari: AvgSales, AvgSalesByProduct).
-- Yozing:



-- 6) O'rtacha savdodan yuqori bo'lgan buyurtmalarni chiqaring: OrderID, ProductID,
--    Sales va o'rtacha savdo ustuni ko'rinsin.
-- Yozing:



-- 7) Har bir buyurtma qatorida eng kichik va eng katta savdo qiymatlari ko'rinsin:
--    ham umumiy bo'yicha, ham o'sha mahsulot bo'yicha (4 ta ustun).
-- Yozing:



-- 8) Eng yuqori maosh oladigan xodim(lar)ni toping — maoshi eng katta qiymatga
--    teng bo'lgan barcha qatorlar chiqsin.
-- Yozing:



-- 9) Buyurtmalarni Sales bo'yicha kamayish tartibida uch xil usulda raqamlang va
--    natijalarni yonma-yon solishtiring: (a) har bir qatorga uzluksiz tartib raqami,
--    (b) teng qiymatlarga bir xil o'rin beriladigan va keyingi o'rin(lar) tashlab
--    ketiladigan usul, (c) teng qiymatlarga bir xil o'rin beriladigan, lekin o'rinlar
--    tashlab ketilmaydigan usul.
-- Yozing:



-- 10) Har bir mahsulot ichida buyurtmalarni Sales bo'yicha kamayish tartibida
--     raqamlang: har bir mahsulotning eng katta savdosi 1-o'rin bo'lsin
--     (ustun nomi: RankByProduct).
-- Yozing:



-- 11) Har bir mijoz uchun umumiy savdo summasini hisoblang va shulardan eng kam
--     savdo qilgan 2 ta mijozni chiqaring. Natijani TOP ishlatmasdan, tartib raqami
--     orqali cheklang.
-- Yozing:



-- 12) Sales.OrdersArchive jadvalida OrderID takrorlanadimi yoki yo'qmi — shuni
--     tekshiradigan so'rov yozing: har bir qatorda o'sha OrderID necha marta
--     uchraganini ko'rsatuvchi ustun bo'lsin (ustun nomi: CheckPK).
-- Yozing:



-- 13) Har bir mahsulot uchun buyurtmalarni OrderDate bo'yicha tartiblab, savdoning
--     to'planib boruvchi (yig'ilib boradigan) yig'indisini chiqaring
--     (ustun nomi: RunningTotal).
-- Yozing:



-- 14) Har bir buyurtma uchun oldingi buyurtmaning OrderDate'ini va ikki buyurtma
--     orasida necha kun o'tganini chiqaring (buyurtmalar sana bo'yicha tartiblansin,
--     ustun nomlari: PrevOrderDate, DaysBetween).
-- Yozing:



-- 15) Buyurtmalarni savdosi bo'yicha kamayish tartibida 3 ta teng guruhga bo'ling va
--     har bir buyurtma qaysi guruhga tushganini ko'rsating (ustun nomi: Bucket).
-- Yozing:
