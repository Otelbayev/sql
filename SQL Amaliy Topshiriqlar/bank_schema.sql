/* =====================================================================
   BANK PRACTICE DATABASE  —  SQL amaliyot uchun mashq bazasi
   ---------------------------------------------------------------------
   Dialekt: SQL Server (T-SQL) — kursdagi muhitga mos (SSMS)
   Oracle uchun o'zgartirishlar fayl oxirida keltirilgan.

   Ma'lumotlar ATAYLAB "iflos" qilingan:
     - NULL qiymatlar (email, phone, paid_date, manager_id, officer_id)
     - Mijozlar hisobsiz (16, 20), filial xodimsiz (5)
     - Hisoblar tranzaksiyasiz (1024, 1029, 1030)
     - Oylar orasida bo'shliqlar (gaps & islands mashqi uchun)
     - Failed / Pending statuslar
     - To'lanmagan va qisman to'langan kredit to'lovlari
   ===================================================================== */

-- CREATE DATABASE BankPractice;
-- GO
-- USE BankPractice;
-- GO

/* ------------------------- 1. DDL ------------------------- */

DROP TABLE IF EXISTS loan_payments;
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS cards;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS branches;
DROP TABLE IF EXISTS exchange_rates;
GO

CREATE TABLE branches (
    branch_id    INT PRIMARY KEY,
    branch_name  NVARCHAR(60)  NOT NULL,
    city         NVARCHAR(40)  NOT NULL,
    region       NVARCHAR(40)  NOT NULL,
    opened_date  DATE          NOT NULL
);

CREATE TABLE employees (
    employee_id  INT PRIMARY KEY,
    first_name   NVARCHAR(40)  NOT NULL,
    last_name    NVARCHAR(40)  NOT NULL,
    position     NVARCHAR(40)  NOT NULL,
    branch_id    INT           NULL,
    manager_id   INT           NULL,
    hire_date    DATE          NOT NULL,
    salary       DECIMAL(18,2) NOT NULL,
    email        NVARCHAR(80)  NULL,
    CONSTRAINT fk_emp_branch  FOREIGN KEY (branch_id)  REFERENCES branches(branch_id),
    CONSTRAINT fk_emp_manager FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE customers (
    customer_id     INT PRIMARY KEY,
    first_name      NVARCHAR(40) NOT NULL,
    last_name       NVARCHAR(40) NOT NULL,
    birth_date      DATE         NOT NULL,
    gender          CHAR(1)      NOT NULL,
    city            NVARCHAR(40) NOT NULL,
    registered_date DATE         NOT NULL,
    segment         NVARCHAR(20) NOT NULL,   -- Retail / Premium / VIP / Corporate
    phone           NVARCHAR(20) NULL,
    email           NVARCHAR(80) NULL,
    branch_id       INT          NOT NULL,
    CONSTRAINT fk_cust_branch FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE accounts (
    account_id    INT PRIMARY KEY,
    customer_id   INT           NOT NULL,
    account_type  NVARCHAR(20)  NOT NULL,   -- Current / Savings / Deposit
    currency      CHAR(3)       NOT NULL,   -- UZS / USD / EUR
    opened_date   DATE          NOT NULL,
    closed_date   DATE          NULL,
    status        NVARCHAR(15)  NOT NULL,   -- Active / Closed
    balance       DECIMAL(18,2) NOT NULL,
    branch_id     INT           NOT NULL,
    CONSTRAINT fk_acc_cust   FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_acc_branch FOREIGN KEY (branch_id)   REFERENCES branches(branch_id)
);

CREATE TABLE transactions (
    transaction_id    INT PRIMARY KEY,
    account_id        INT           NOT NULL,
    txn_date          DATETIME      NOT NULL,
    txn_type          NVARCHAR(20)  NOT NULL,  -- Deposit/Withdrawal/Transfer/Payment/Fee
    amount            DECIMAL(18,2) NOT NULL,
    channel           NVARCHAR(15)  NOT NULL,  -- ATM/Mobile/Branch/POS/Online
    merchant_category NVARCHAR(30)  NULL,
    status            NVARCHAR(15)  NOT NULL,  -- Completed/Failed/Pending
    CONSTRAINT fk_txn_acc FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE cards (
    card_id     INT PRIMARY KEY,
    account_id  INT          NOT NULL,
    card_type   NVARCHAR(20) NOT NULL,   -- Visa/Mastercard/Humo/Uzcard
    issued_date DATE         NOT NULL,
    expiry_date DATE         NOT NULL,
    status      NVARCHAR(15) NOT NULL,   -- Active/Expired/Blocked
    CONSTRAINT fk_card_acc FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE loans (
    loan_id       INT PRIMARY KEY,
    customer_id   INT           NOT NULL,
    loan_type     NVARCHAR(20)  NOT NULL,  -- Mortgage/Auto/Consumer/Micro/Business
    principal     DECIMAL(18,2) NOT NULL,
    interest_rate DECIMAL(5,2)  NOT NULL,
    issued_date   DATE          NOT NULL,
    term_months   INT           NOT NULL,
    status        NVARCHAR(15)  NOT NULL,  -- Active/Closed/Overdue
    branch_id     INT           NOT NULL,
    officer_id    INT           NULL,
    CONSTRAINT fk_loan_cust    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_loan_branch  FOREIGN KEY (branch_id)   REFERENCES branches(branch_id),
    CONSTRAINT fk_loan_officer FOREIGN KEY (officer_id)  REFERENCES employees(employee_id)
);

CREATE TABLE loan_payments (
    payment_id  INT PRIMARY KEY,
    loan_id     INT           NOT NULL,
    due_date    DATE          NOT NULL,
    due_amount  DECIMAL(18,2) NOT NULL,
    paid_date   DATE          NULL,
    paid_amount DECIMAL(18,2) NULL,
    CONSTRAINT fk_pay_loan FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

CREATE TABLE exchange_rates (
    rate_date   DATE          NOT NULL,
    currency    CHAR(3)       NOT NULL,
    rate_to_uzs DECIMAL(12,2) NOT NULL,
    CONSTRAINT pk_rates PRIMARY KEY (rate_date, currency)
);
GO

/* ------------------------- 2. DATA ------------------------- */

INSERT INTO branches VALUES
(1,'Toshkent Markaziy','Toshkent','Toshkent','2015-03-01'),
(2,'Chilonzor','Toshkent','Toshkent','2017-06-15'),
(3,'Samarqand','Samarqand','Samarqand','2018-02-20'),
(4,'Buxoro','Buxoro','Buxoro','2020-09-01'),
(5,'Namangan','Namangan','Fargona','2022-11-10');

INSERT INTO employees VALUES
(1 ,'Aziz'   ,'Karimov'  ,'Director'      ,1,NULL,'2015-03-01',25000000,'aziz.karimov@bank.uz'),
(2 ,'Dilnoza','Yusupova' ,'Branch Manager',1,1   ,'2016-01-10',15000000,'d.yusupova@bank.uz'),
(3 ,'Sardor' ,'Rahimov'  ,'Branch Manager',2,1   ,'2017-06-15',14000000,'s.rahimov@bank.uz'),
(4 ,'Kamola' ,'Tosheva'  ,'Branch Manager',3,1   ,'2018-03-01',13500000,NULL),
(5 ,'Jasur'  ,'Ergashev' ,'Loan Officer'  ,1,2   ,'2019-04-12', 9000000,'j.ergashev@bank.uz'),
(6 ,'Nilufar','Saidova'  ,'Loan Officer'  ,2,3   ,'2020-02-01', 8500000,'n.saidova@bank.uz'),
(7 ,'Bekzod' ,'Umarov'   ,'Teller'        ,1,2   ,'2021-07-19', 6000000,'b.umarov@bank.uz'),
(8 ,'Zilola' ,'Nazarova' ,'Teller'        ,2,3   ,'2021-08-01', 6000000,NULL),
(9 ,'Otabek' ,'Yuldashev','Loan Officer'  ,3,4   ,'2022-01-15', 8000000,'o.yuldashev@bank.uz'),
(10,'Malika' ,'Qodirova' ,'Teller'        ,3,4   ,'2022-05-30', 5800000,'m.qodirova@bank.uz'),
(11,'Sherzod','Aliyev'   ,'Branch Manager',4,1   ,'2020-09-01',13000000,'sh.aliyev@bank.uz'),
(12,'Gulnora','Ismoilova','Teller'        ,4,11  ,'2023-03-14', 5500000,'g.ismoilova@bank.uz');

INSERT INTO customers VALUES
(1 ,'Akmal'   ,'Toshmatov' ,'1985-04-12','M','Toshkent' ,'2018-01-15','Premium'  ,'+998901234567','akmal.t@mail.uz'   ,1),
(2 ,'Nodira'  ,'Ergasheva' ,'1990-11-30','F','Toshkent' ,'2018-03-22','Retail'   ,NULL           ,'nodira@mail.uz'    ,1),
(3 ,'Rustam'  ,'Aliyev'    ,'1978-06-05','M','Samarqand','2019-05-10','VIP'      ,'+998935551122',NULL                ,3),
(4 ,'Sevara'  ,'Karimova'  ,'1995-02-18','F','Toshkent' ,'2019-07-01','Retail'   ,'+998901112233','sevara.k@mail.uz'  ,2),
(5 ,'Jamshid' ,'Nazarov'   ,'1982-09-25','M','Buxoro'   ,'2020-01-20','Premium'  ,'+998977778899',NULL                ,4),
(6 ,'Malika'  ,'Yusupova'  ,'1993-12-01','F','Toshkent' ,'2020-02-14','Retail'   ,'+998903334455','malika.y@mail.uz'  ,2),
(7 ,'Bobur'   ,'Sattorov'  ,'1975-03-08','M','Samarqand','2020-06-30','VIP'      ,'+998915556677','bobur.s@mail.uz'   ,3),
(8 ,'Dilfuza' ,'Rahmonova' ,'1998-08-19','F','Namangan' ,'2021-01-11','Retail'   ,NULL           ,NULL                ,5),
(9 ,'Sanjar'  ,'Xolmatov'  ,'1988-05-23','M','Toshkent' ,'2021-03-05','Premium'  ,'+998909998877','sanjar.x@mail.uz'  ,1),
(10,'Zarina'  ,'Umarova'   ,'1992-07-14','F','Toshkent' ,'2021-04-18','Retail'   ,'+998907776655','zarina.u@mail.uz'  ,1),
(11,'Ulugbek' ,'Qosimov'   ,'1980-10-02','M','Buxoro'   ,'2021-09-09','Corporate','+998974443322','ulugbek.q@corp.uz' ,4),
(12,'Feruza'  ,'Sobirova'  ,'1996-01-27','F','Samarqand','2022-02-01','Retail'   ,'+998932221100',NULL                ,3),
(13,'Timur'   ,'Abdullayev','1987-04-30','M','Toshkent' ,'2022-05-16','Premium'  ,'+998901010101','timur.a@mail.uz'   ,2),
(14,'Gulbahor','Islomova'  ,'1991-06-11','F','Namangan' ,'2022-08-23','Retail'   ,'+998912223344','gulbahor@mail.uz'  ,5),
(15,'Farrux'  ,'Mirzayev'  ,'1984-02-09','M','Toshkent' ,'2022-11-07','Corporate','+998908887766','farrux.m@corp.uz'  ,1),
(16,'Nigora'  ,'Tursunova' ,'1999-09-15','F','Toshkent' ,'2023-01-25','Retail'   ,NULL           ,'nigora.t@mail.uz'  ,2),
(17,'Doniyor' ,'Xasanov'   ,'1979-12-20','M','Buxoro'   ,'2023-04-03','VIP'      ,'+998971113355','doniyor.x@mail.uz' ,4),
(18,'Shahnoza','Alimova'   ,'1994-03-17','F','Samarqand','2023-06-12','Retail'   ,'+998939990011',NULL                ,3),
(19,'Islom'   ,'Nematov'   ,'1986-08-08','M','Toshkent' ,'2023-09-28','Premium'  ,'+998906665544','islom.n@mail.uz'   ,1),
(20,'Kamola'  ,'Tosheva'   ,'1997-05-05','F','Namangan' ,'2024-01-15','Retail'   ,'+998914445566',NULL                ,5);

INSERT INTO accounts VALUES
(1001,1 ,'Current','UZS','2018-01-15',NULL        ,'Active', 12500000,1),
(1002,1 ,'Savings','USD','2019-03-10',NULL        ,'Active',     4500,1),
(1003,2 ,'Current','UZS','2018-03-22',NULL        ,'Active',  3200000,1),
(1004,3 ,'Current','UZS','2019-05-10',NULL        ,'Active', 87000000,3),
(1005,3 ,'Deposit','USD','2019-06-01',NULL        ,'Active',    25000,3),
(1006,3 ,'Savings','EUR','2021-02-15',NULL        ,'Active',     8000,3),
(1007,4 ,'Current','UZS','2019-07-01',NULL        ,'Active',  1800000,2),
(1008,5 ,'Current','UZS','2020-01-20',NULL        ,'Active', 22000000,4),
(1009,5 ,'Deposit','UZS','2020-02-01','2023-02-01','Closed',        0,4),
(1010,6 ,'Current','UZS','2020-02-14',NULL        ,'Active',   950000,2),
(1011,7 ,'Current','UZS','2020-06-30',NULL        ,'Active',145000000,3),
(1012,7 ,'Savings','USD','2020-07-15',NULL        ,'Active',    62000,3),
(1013,8 ,'Current','UZS','2021-01-11',NULL        ,'Active',   420000,5),
(1014,9 ,'Current','UZS','2021-03-05',NULL        ,'Active', 18700000,1),
(1015,9 ,'Savings','UZS','2021-05-20',NULL        ,'Active', 35000000,1),
(1016,10,'Current','UZS','2021-04-18',NULL        ,'Active',  2750000,1),
(1017,11,'Current','UZS','2021-09-09',NULL        ,'Active',310000000,4),
(1018,11,'Current','USD','2021-10-01',NULL        ,'Active',   125000,4),
(1019,12,'Current','UZS','2022-02-01',NULL        ,'Active',  1100000,3),
(1020,13,'Current','UZS','2022-05-16',NULL        ,'Active',  9800000,2),
(1021,13,'Deposit','UZS','2022-06-01',NULL        ,'Active', 50000000,2),
(1022,14,'Current','UZS','2022-08-23','2024-03-15','Closed',        0,5),
(1023,15,'Current','UZS','2022-11-07',NULL        ,'Active',210000000,1),
(1024,15,'Savings','EUR','2023-01-10',NULL        ,'Active',    45000,1),
(1025,17,'Current','UZS','2023-04-03',NULL        ,'Active', 96000000,4),
(1026,17,'Deposit','USD','2023-05-01',NULL        ,'Active',    40000,4),
(1027,18,'Current','UZS','2023-06-12',NULL        ,'Active',   780000,3),
(1028,19,'Current','UZS','2023-09-28',NULL        ,'Active', 15400000,1),
(1029,19,'Savings','USD','2024-02-01',NULL        ,'Active',     3000,1),
(1030,10,'Deposit','UZS','2024-05-10',NULL        ,'Active', 20000000,1);

INSERT INTO transactions VALUES
-- account 1001
(1 ,1001,'2024-01-05 09:15','Deposit'   , 5000000,'Branch',NULL         ,'Completed'),
(2 ,1001,'2024-01-18 14:22','Payment'   ,  350000,'Online','Utilities'  ,'Completed'),
(3 ,1001,'2024-02-03 11:40','Withdrawal', 1200000,'ATM'   ,NULL         ,'Completed'),
(4 ,1001,'2024-02-20 19:05','Payment'   ,  480000,'POS'   ,'Grocery'    ,'Completed'),
(5 ,1001,'2024-03-11 08:55','Deposit'   , 6000000,'Mobile',NULL         ,'Completed'),
(6 ,1001,'2024-03-27 16:30','Payment'   , 1500000,'POS'   ,'Electronics','Completed'),
(7 ,1001,'2024-04-14 12:10','Withdrawal',  800000,'ATM'   ,NULL         ,'Completed'),
(8 ,1001,'2024-05-02 10:05','Payment'   ,  220000,'POS'   ,'Fuel'       ,'Completed'),
(9 ,1001,'2024-06-09 17:45','Deposit'   , 7000000,'Branch',NULL         ,'Completed'),
(10,1001,'2024-07-21 13:20','Payment'   ,  950000,'Online','Travel'     ,'Completed'),
(11,1001,'2024-09-15 15:00','Withdrawal', 2000000,'ATM'   ,NULL         ,'Completed'),
(12,1001,'2024-11-30 18:35','Payment'   ,  640000,'POS'   ,'Restaurant' ,'Completed'),
-- account 1003
(13,1003,'2024-02-14 10:00','Deposit'   ,  800000,'Mobile',NULL         ,'Completed'),
(14,1003,'2024-04-05 12:30','Payment'   ,  150000,'POS'   ,'Grocery'    ,'Completed'),
(15,1003,'2024-06-18 09:45','Withdrawal',  500000,'ATM'   ,NULL         ,'Completed'),
(16,1003,'2024-08-22 20:10','Payment'   ,   90000,'Online','Utilities'  ,'Failed'   ),
(17,1003,'2024-10-30 11:11','Deposit'   , 1200000,'Branch',NULL         ,'Completed'),
-- account 1004
(18,1004,'2024-01-10 09:00','Deposit'   ,50000000,'Branch',NULL         ,'Completed'),
(19,1004,'2024-01-25 14:00','Transfer'  ,12000000,'Online',NULL         ,'Completed'),
(20,1004,'2024-02-15 10:30','Payment'   , 3500000,'POS'   ,'Electronics','Completed'),
(21,1004,'2024-03-08 16:45','Withdrawal', 8000000,'Branch',NULL         ,'Completed'),
(22,1004,'2024-04-19 11:20','Deposit'   ,30000000,'Branch',NULL         ,'Completed'),
(23,1004,'2024-05-23 13:05','Transfer'  ,15000000,'Mobile',NULL         ,'Completed'),
(24,1004,'2024-06-30 17:50','Payment'   , 2200000,'POS'   ,'Travel'     ,'Completed'),
(25,1004,'2024-08-12 09:35','Withdrawal', 5000000,'ATM'   ,NULL         ,'Completed'),
(26,1004,'2024-09-27 15:15','Deposit'   ,40000000,'Branch',NULL         ,'Completed'),
(27,1004,'2024-11-05 12:00','Payment'   , 6700000,'Online','Electronics','Completed'),
(28,1004,'2024-12-20 18:00','Transfer'  ,20000000,'Mobile',NULL         ,'Pending'  ),
-- account 1011
(29,1011,'2024-01-08 08:30','Deposit'   ,80000000,'Branch',NULL         ,'Completed'),
(30,1011,'2024-02-12 10:15','Payment'   , 4500000,'POS'   ,'Electronics','Completed'),
(31,1011,'2024-03-19 14:40','Withdrawal',10000000,'Branch',NULL         ,'Completed'),
(32,1011,'2024-04-25 09:55','Deposit'   ,55000000,'Branch',NULL         ,'Completed'),
(33,1011,'2024-05-30 16:20','Transfer'  ,25000000,'Online',NULL         ,'Completed'),
(34,1011,'2024-07-14 11:05','Payment'   , 3100000,'POS'   ,'Restaurant' ,'Completed'),
(35,1011,'2024-08-28 13:35','Withdrawal', 7000000,'ATM'   ,NULL         ,'Completed'),
(36,1011,'2024-10-09 15:45','Deposit'   ,60000000,'Branch',NULL         ,'Completed'),
(37,1011,'2024-11-22 12:25','Payment'   , 8900000,'Online','Travel'     ,'Completed'),
(38,1011,'2024-12-15 17:10','Transfer'  ,30000000,'Mobile',NULL         ,'Completed'),
-- account 1014
(39,1014,'2024-01-12 09:30','Deposit'   , 8000000,'Mobile',NULL         ,'Completed'),
(40,1014,'2024-03-05 14:15','Payment'   , 1200000,'POS'   ,'Grocery'    ,'Completed'),
(41,1014,'2024-05-17 10:40','Withdrawal', 2500000,'ATM'   ,NULL         ,'Completed'),
(42,1014,'2024-07-08 16:00','Deposit'   , 9000000,'Branch',NULL         ,'Completed'),
(43,1014,'2024-09-19 11:25','Payment'   , 1800000,'Online','Utilities'  ,'Completed'),
(44,1014,'2024-12-01 13:50','Withdrawal', 3000000,'ATM'   ,NULL         ,'Completed'),
-- account 1017 (to'liq oylik seriya)
(45,1017,'2024-01-15 09:00','Deposit'   ,150000000,'Branch',NULL        ,'Completed'),
(46,1017,'2024-02-28 10:20','Transfer'  , 45000000,'Online',NULL        ,'Completed'),
(47,1017,'2024-03-30 11:35','Payment'   , 12000000,'Online','Utilities' ,'Completed'),
(48,1017,'2024-04-30 12:45','Transfer'  , 38000000,'Online',NULL        ,'Completed'),
(49,1017,'2024-05-31 09:55','Deposit'   ,200000000,'Branch',NULL        ,'Completed'),
(50,1017,'2024-06-28 14:05','Payment'   , 15000000,'Online','Utilities' ,'Completed'),
(51,1017,'2024-07-31 15:15','Transfer'  , 52000000,'Online',NULL        ,'Completed'),
(52,1017,'2024-08-30 10:25','Deposit'   ,180000000,'Branch',NULL        ,'Completed'),
(53,1017,'2024-09-30 16:35','Payment'   , 18000000,'Online','Utilities' ,'Completed'),
(54,1017,'2024-10-31 11:45','Transfer'  , 60000000,'Online',NULL        ,'Completed'),
(55,1017,'2024-11-29 09:05','Deposit'   ,220000000,'Branch',NULL        ,'Completed'),
(56,1017,'2024-12-31 17:55','Payment'   , 21000000,'Online','Utilities' ,'Completed'),
-- account 1020
(57,1020,'2024-02-05 10:10','Deposit'   , 4000000,'Mobile',NULL         ,'Completed'),
(58,1020,'2024-04-11 13:25','Payment'   ,  850000,'POS'   ,'Fuel'       ,'Completed'),
(59,1020,'2024-06-23 15:40','Withdrawal', 1500000,'ATM'   ,NULL         ,'Completed'),
(60,1020,'2024-08-14 09:20','Payment'   ,  300000,'POS'   ,'Pharmacy'   ,'Completed'),
(61,1020,'2024-10-02 12:35','Deposit'   , 5500000,'Branch',NULL         ,'Completed'),
(62,1020,'2024-11-18 18:15','Payment'   , 1100000,'Online','Electronics','Completed'),
-- account 1023
(63,1023,'2024-01-20 09:40','Deposit'   ,100000000,'Branch',NULL        ,'Completed'),
(64,1023,'2024-03-14 11:50','Transfer'  , 35000000,'Online',NULL        ,'Completed'),
(65,1023,'2024-05-09 14:20','Payment'   ,  9000000,'Online','Utilities' ,'Completed'),
(66,1023,'2024-07-25 10:30','Deposit'   ,120000000,'Branch',NULL        ,'Completed'),
(67,1023,'2024-09-11 16:10','Transfer'  , 40000000,'Online',NULL        ,'Completed'),
(68,1023,'2024-12-05 13:00','Payment'   , 11000000,'Online','Utilities' ,'Completed'),
-- account 1025
(69,1025,'2024-02-08 10:05','Deposit'   ,40000000,'Branch',NULL         ,'Completed'),
(70,1025,'2024-04-22 12:15','Payment'   , 5600000,'POS'   ,'Travel'     ,'Completed'),
(71,1025,'2024-06-15 15:25','Withdrawal', 9000000,'Branch',NULL         ,'Completed'),
(72,1025,'2024-08-19 09:35','Deposit'   ,35000000,'Branch',NULL         ,'Completed'),
(73,1025,'2024-10-24 14:45','Payment'   , 4200000,'POS'   ,'Electronics','Completed'),
(74,1025,'2024-12-11 11:55','Withdrawal', 6000000,'ATM'   ,NULL         ,'Completed'),
-- account 1008
(75,1008,'2024-03-02 10:00','Deposit'   ,10000000,'Branch',NULL         ,'Completed'),
(76,1008,'2024-06-06 13:30','Payment'   , 2300000,'POS'   ,'Grocery'    ,'Completed'),
(77,1008,'2024-09-09 15:20','Withdrawal', 4000000,'ATM'   ,NULL         ,'Completed'),
(78,1008,'2024-12-12 11:10','Deposit'   ,12000000,'Mobile',NULL         ,'Completed'),
-- account 1013
(79,1013,'2024-04-01 09:50','Deposit'   ,  500000,'Mobile',NULL         ,'Completed'),
(80,1013,'2024-07-04 17:20','Payment'   ,  120000,'POS'   ,'Grocery'    ,'Completed'),
(81,1013,'2024-10-16 12:40','Withdrawal',  200000,'ATM'   ,NULL         ,'Completed'),
-- account 1007
(82,1007,'2024-02-22 11:15','Deposit'   , 1500000,'Mobile',NULL         ,'Completed'),
(83,1007,'2024-05-13 19:30','Payment'   ,  260000,'POS'   ,'Restaurant' ,'Completed'),
(84,1007,'2024-08-07 10:45','Withdrawal',  400000,'ATM'   ,NULL         ,'Completed'),
(85,1007,'2024-11-11 14:55','Payment'   ,  180000,'Online','Pharmacy'   ,'Completed'),
-- account 1010
(86,1010,'2024-03-18 12:20','Deposit'   ,  700000,'Mobile',NULL         ,'Completed'),
(87,1010,'2024-06-26 18:40','Payment'   ,   95000,'POS'   ,'Grocery'    ,'Failed'   ),
(88,1010,'2024-09-03 09:25','Withdrawal',  300000,'ATM'   ,NULL         ,'Completed'),
-- xizmat haqi (Fee)
(89,1001,'2024-06-30 23:59','Fee'       ,   15000,'Online',NULL         ,'Completed'),
(90,1004,'2024-06-30 23:59','Fee'       ,   15000,'Online',NULL         ,'Completed'),
(91,1011,'2024-06-30 23:59','Fee'       ,   15000,'Online',NULL         ,'Completed'),
(92,1017,'2024-06-30 23:59','Fee'       ,   25000,'Online',NULL         ,'Completed');

INSERT INTO cards VALUES
(9001,1001,'Uzcard'    ,'2021-06-01','2026-06-01','Active' ),
(9002,1001,'Visa'      ,'2022-02-15','2025-02-15','Expired'),
(9003,1003,'Humo'      ,'2020-04-10','2025-04-10','Active' ),
(9004,1004,'Visa'      ,'2019-08-20','2024-08-20','Expired'),
(9005,1004,'Uzcard'    ,'2023-09-01','2028-09-01','Active' ),
(9006,1007,'Humo'      ,'2021-03-05','2026-03-05','Active' ),
(9007,1011,'Mastercard','2021-01-12','2026-01-12','Active' ),
(9008,1011,'Uzcard'    ,'2022-05-19','2027-05-19','Active' ),
(9009,1014,'Uzcard'    ,'2022-07-07','2027-07-07','Active' ),
(9010,1017,'Visa'      ,'2022-10-01','2027-10-01','Active' ),
(9011,1020,'Humo'      ,'2023-01-25','2028-01-25','Active' ),
(9012,1023,'Mastercard','2023-03-30','2028-03-30','Active' ),
(9013,1025,'Visa'      ,'2023-08-14','2028-08-14','Blocked'),
(9014,1013,'Uzcard'    ,'2021-11-11','2024-11-11','Expired');

INSERT INTO loans VALUES
(5001,1 ,'Mortgage',400000000,18.50,'2021-05-10',240,'Active' ,1,5   ),
(5002,3 ,'Auto'    ,180000000,22.00,'2022-03-15', 60,'Active' ,3,9   ),
(5003,4 ,'Consumer', 25000000,26.50,'2023-01-20', 24,'Closed' ,2,6   ),
(5004,5 ,'Mortgage',350000000,19.00,'2022-07-01',180,'Active' ,4,5   ),
(5005,7 ,'Auto'    ,220000000,21.50,'2023-04-12', 60,'Active' ,3,9   ),
(5006,9 ,'Consumer', 40000000,25.00,'2023-08-05', 36,'Active' ,1,5   ),
(5007,11,'Business',900000000,17.00,'2022-11-30',120,'Active' ,4,11  ),
(5008,13,'Consumer', 30000000,27.00,'2024-02-18', 24,'Active' ,2,6   ),
(5009,15,'Business',750000000,17.50,'2023-06-22',120,'Active' ,1,5   ),
(5010,17,'Mortgage',500000000,18.00,'2024-01-09',180,'Active' ,4,11  ),
(5011,6 ,'Micro'   , 12000000,28.00,'2023-11-14', 12,'Overdue',2,6   ),
(5012,12,'Micro'   ,  8000000,29.00,'2024-03-25', 12,'Overdue',3,NULL);

INSERT INTO loan_payments VALUES
(1 ,5001,'2024-03-31',8500000,'2024-03-28',8500000),
(2 ,5001,'2024-06-30',8500000,'2024-06-30',8500000),
(3 ,5001,'2024-09-30',8500000,'2024-10-05',8500000),
(4 ,5001,'2024-12-31',8500000,NULL        ,NULL   ),
(5 ,5002,'2024-03-31',5200000,'2024-03-31',5200000),
(6 ,5002,'2024-06-30',5200000,'2024-07-02',5200000),
(7 ,5002,'2024-09-30',5200000,'2024-09-29',5200000),
(8 ,5002,'2024-12-31',5200000,NULL        ,NULL   ),
(9 ,5005,'2024-03-31',6100000,'2024-03-30',6100000),
(10,5005,'2024-06-30',6100000,'2024-06-27',6100000),
(11,5005,'2024-09-30',6100000,'2024-09-28',6100000),
(12,5005,'2024-12-31',6100000,NULL        ,NULL   ),
(13,5006,'2024-03-31',1800000,'2024-03-29',1800000),
(14,5006,'2024-06-30',1800000,'2024-06-25',1800000),
(15,5006,'2024-09-30',1800000,'2024-09-30', 900000),
(16,5006,'2024-12-31',1800000,NULL        ,NULL   ),
(17,5008,'2024-03-31',1650000,'2024-03-31',1650000),
(18,5008,'2024-06-30',1650000,'2024-06-28',1650000),
(19,5008,'2024-09-30',1650000,NULL        ,NULL   ),
(20,5008,'2024-12-31',1650000,NULL        ,NULL   ),
(21,5010,'2024-03-31',7200000,'2024-03-25',7200000),
(22,5010,'2024-06-30',7200000,'2024-06-26',7200000),
(23,5010,'2024-09-30',7200000,'2024-09-27',7200000),
(24,5010,'2024-12-31',7200000,'2024-12-30',7200000),
(25,5011,'2024-03-31',1300000,'2024-03-30',1300000),
(26,5011,'2024-06-30',1300000,NULL        ,NULL   ),
(27,5011,'2024-09-30',1300000,NULL        ,NULL   ),
(28,5011,'2024-12-31',1300000,NULL        ,NULL   ),
(29,5012,'2024-06-30', 850000,'2024-07-20', 850000),
(30,5012,'2024-09-30', 850000,NULL        ,NULL   ),
(31,5012,'2024-12-31', 850000,NULL        ,NULL   );

INSERT INTO exchange_rates VALUES
('2024-01-01','USD',12300),('2024-02-01','USD',12350),('2024-03-01','USD',12420),
('2024-04-01','USD',12550),('2024-05-01','USD',12630),('2024-06-01','USD',12700),
('2024-07-01','USD',12680),('2024-08-01','USD',12750),('2024-09-01','USD',12800),
('2024-10-01','USD',12870),('2024-11-01','USD',12920),('2024-12-01','USD',12980),
('2024-01-01','EUR',13400),('2024-02-01','EUR',13380),('2024-03-01','EUR',13500),
('2024-04-01','EUR',13620),('2024-05-01','EUR',13700),('2024-06-01','EUR',13650),
('2024-07-01','EUR',13780),('2024-08-01','EUR',13850),('2024-09-01','EUR',13900),
('2024-10-01','EUR',13820),('2024-11-01','EUR',13950),('2024-12-01','EUR',14050);
GO

/* ------------------------- 3. TEKSHIRUV ------------------------- */
-- Kutilgan natija: 5, 12, 20, 30, 92, 14, 12, 31, 24
SELECT 'branches' AS tbl, COUNT(*) AS cnt FROM branches
UNION ALL SELECT 'employees'     , COUNT(*) FROM employees
UNION ALL SELECT 'customers'     , COUNT(*) FROM customers
UNION ALL SELECT 'accounts'      , COUNT(*) FROM accounts
UNION ALL SELECT 'transactions'  , COUNT(*) FROM transactions
UNION ALL SELECT 'cards'         , COUNT(*) FROM cards
UNION ALL SELECT 'loans'         , COUNT(*) FROM loans
UNION ALL SELECT 'loan_payments' , COUNT(*) FROM loan_payments
UNION ALL SELECT 'exchange_rates', COUNT(*) FROM exchange_rates;
GO


/* =====================================================================
   ORACLE UCHUN ADAPTATSIYA
   ---------------------------------------------------------------------
   1. Tiplar:
        NVARCHAR(n)   -> VARCHAR2(n)
        DATETIME      -> DATE yoki TIMESTAMP
        DECIMAL(18,2) -> NUMBER(18,2)
        CHAR(3)       -> CHAR(3)  (o'zgarishsiz)

   2. DROP TABLE IF EXISTS Oracle'da yo'q:
        DROP TABLE loan_payments CASCADE CONSTRAINTS;   -- xato bo'lsa e'tibor bermang
      yoki PL/SQL blokida EXCEPTION bilan o'rab oling.

   3. Ko'p qatorli INSERT ... VALUES (..),(..) Oracle'da ISHLAMAYDI.
      Har bir qatorni alohida yozing:
        INSERT INTO branches VALUES (1,'...','...','...',DATE '2015-03-01');
      yoki INSERT ALL ishlatilsin:
        INSERT ALL
          INTO branches VALUES (1,...)
          INTO branches VALUES (2,...)
        SELECT * FROM dual;

   4. Sana literali:
        '2024-01-05'          ->  DATE '2024-01-05'
        '2024-01-05 09:15'    ->  TO_DATE('2024-01-05 09:15','YYYY-MM-DD HH24:MI')

   5. GO yo'q — o'rniga ; va SQL*Plus'da /

   6. Funksiya farqlari (topshiriqlarni yechayotganda):
        GETDATE()          -> SYSDATE
        LEN()              -> LENGTH()
        ISNULL(a,b)        -> NVL(a,b)
        TOP n              -> FETCH FIRST n ROWS ONLY
        DATEADD/DATEDIFF   -> ADD_MONTHS / arifmetika / MONTHS_BETWEEN
        FORMAT()           -> TO_CHAR()
        + (birlashtirish)  -> ||
   ===================================================================== */
