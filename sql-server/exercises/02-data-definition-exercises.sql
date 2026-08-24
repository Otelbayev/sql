-- ============================================
-- Mavzu: Data Definition
-- Eslatma: bu yerda yangi jadvallar o'zingiz yaratasiz
-- ============================================
-- 1) "products" nomli jadval yarating: id (INT, NOT NULL, PRIMARY KEY),
--    product_name (VARCHAR(50), NOT NULL), price (INT), category (VARCHAR(50)).
-- Yozing:
CREATE TABLE products (
    id           INT          NOT NULL PRIMARY KEY,
    product_name VARCHAR (50) NOT NULL,
    price        INT         ,
    category     VARCHAR (50)
);

-- 2) products jadvaliga in_stock nomli yangi ustun qo'shing (masalan VARCHAR(10)).
-- Yozing:
ALTER TABLE products
    ADD in_stock VARCHAR (10);

-- 3) products jadvalidan category ustunini o'chirib tashlang.
-- Yozing:
ALTER TABLE products DROP COLUMN category;

-- 4) "employees" nomli jadval yarating: id (INT, NOT NULL, PRIMARY KEY),
--    full_name (VARCHAR(50), NOT NULL), hire_date (DATE).
-- Yozing:
CREATE TABLE employees (
    id        INT          NOT NULL PRIMARY KEY,
    full_name VARCHAR (50) NOT NULL,
    hire_date DATE        
);

-- 5) employees jadvaliga email nomli yangi ustun qo'shing.
-- Yozing:
ALTER TABLE employees
    ADD email VARCHAR (50);

-- 6) employees jadvalidan hire_date ustunini o'chiring.
-- Yozing:
ALTER TABLE employees DROP COLUMN hire_date;

-- 7) employees jadvalidagi barcha ma'lumotlarni chiqaring.
-- Yozing:
SELECT *
FROM   employees;

-- 8) products jadvalini butunlay o'chirib tashlang.
-- Yozing:
DROP TABLE products;

-- 9) employees jadvalini ham butunlay o'chirib tashlang.
-- Yozing:
DROP TABLE employees;