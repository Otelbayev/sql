INSERT  INTO faculties (
    faculty_name
)
VALUES                ('Iqtisodiyot'),
('Aviatsiya'),
('Axboroat tizmlari'),
('Kiber xafvsizlik');

SELECT   *
FROM     faculties
ORDER BY id;

----------------------------------------------------------
INSERT  INTO departments (
    faculty_id,
    department_name
)
VALUES                  (1, 'Bugalteriay'),
(1, 'Biznesni boshqarish'),
(2, 'Samalyot sozlik'),
(2, 'Uchuvchilik'),
(3, 'Dasturiy injenering'),
(3, 'Azborort tizimlar va texnologiyalai'),
(5, 'Kiber xujumlarni'),
(5, 'Python va sql');

SELECT *
FROM   departments;

----------------------------------------------------------
INSERT  INTO student_groups (
    department_id,
    group_name
)
VALUES                     (1, 'BUG-1'),
(1, 'BUG-2'),
(2, 'BB'),
(3, 'SS-2'),
(4, 'U-1'),
(5, 'DI-2'),
(6, 'AT-1'),
(7, 'KX-1'),
(8, 'PS-1');

SELECT *
FROM   student_groups;

----------------------------------------------------------
INSERT  INTO students (
    group_id,
    first_name,
    last_name,
    birthday
)
VALUES               (1, 'Jasur', 'Otelbayev', '2003-05-14'),
(1, 'Sardor', 'Rahimov', '2003-08-22'),
(1, 'Malika', 'Aliyeva', '2004-01-10'),
(1, 'Bobur', 'Karimov', '2003-11-05'),
(1, 'Nigora', 'Qosimova', '2004-03-18'),
(2, 'Azizbek', 'Toshpulatov', '2003-02-19'),
(2, 'Diyorbek', 'Ismoilov', '2003-07-12'),
(2, 'Madina', 'Usmonova', '2004-04-25'),
(2, 'Shoxrux', 'Narzullayev', '2003-09-30'),
(2, 'Sevara', 'Yuldasheva', '2004-06-15'),
(3, 'Javohir', 'Sattorov', '2003-03-08'),
(3, 'Otabek', 'Mahmudov', '2003-10-14'),
(3, 'Gulnoza', 'Rustamova', '2004-02-28'),
(3, 'Farruh', 'Xalilov', '2003-12-01'),
(3, 'Laylo', 'Zokirova', '2004-05-09'),
(4, 'Bekzod', 'Nurmatov', '2003-01-20'),
(4, 'Anvar', 'Ergashev', '2003-06-17'),
(4, 'Zuhra', 'Sobirova', '2004-07-22'),
(4, 'Umidjon', 'Niyozov', '2003-08-04'),
(4, 'Dildora', 'Axmedova', '2004-09-11'),
(5, 'Sardorbek', 'Jumayev', '2003-04-03'),
(5, 'Mirzo', 'Ulugbekov', '2003-11-29'),
(5, 'Shahnoza', 'Mirzayeva', '2004-03-14'),
(5, 'Asadbek', 'Xaydarov', '2003-07-08'),
(5, 'Kamola', 'Tursunova', '2004-10-19'),
(6, 'Doniyor', 'Kamilov', '2003-05-27'),
(6, 'Sherzod', 'Abduvaliyev', '2003-09-02'),
(6, 'Mohira', 'Yoqubova', '2004-01-31'),
(6, 'Husniddin', 'Jorayev', '2003-12-16'),
(6, 'Zilola', 'Oripova', '2004-08-07'),
(7, 'Jahongir', 'Ostonov', '2003-02-11'),
(7, 'Islom', 'Sharipov', '2003-06-24'),
(7, 'Rayhona', 'Gafurova', '2004-04-05'),
(7, 'Sanjar', 'Davronov', '2003-10-18'),
(7, 'Feruza', 'Botirova', '2004-11-23'),
(8, 'Eldor', 'Sultonov', '2003-03-15'),
(8, 'Shohjahon', 'Akramov', '2003-07-31'),
(8, 'Maftuna', 'Nazarova', '2004-02-12'),
(8, 'Ulugbek', 'Qodirov', '2003-09-09'),
(8, 'Nozima', 'Ibrohimova', '2004-06-30'),
(9, 'Nodirbek', 'Murodov', '2003-04-21'),
(9, 'Abbos', 'Xolmuratov', '2003-08-13'),
(9, 'Sitora', 'Shukurova', '2004-05-17'),
(9, 'Otabek', 'Vahobov', '2003-10-06'),
(9, 'Diyora', 'Rasulova', '2004-12-04');

INSERT  INTO students (
    group_id,
    first_name,
    last_name,
    birthday
)
VALUES               (1, 'Jasur', 'Otelbayev', '2003-05-14')

SELECT *
FROM   students;


----------------------------------------------------------

INSERT INTO teachers (department_id, first_name, last_name) VALUES 
(1, 'Anvar', 'Shorahimov'),
(1, 'Dilshod', 'Karimov'),
(1, 'Nigora', 'Azimova'),
(1, 'Otabek', 'Tursunov'),
(1, 'Gulnora', 'Usmonova'),

(2, 'Bobur', 'Valiyev'),
(2, 'Rustam', 'Gofurov'),
(2, 'Shoxrux', 'Sobirov'),
(2, 'Feruza', 'Toshpulatova'),
(2, 'Javohir', 'Nazarov'),

(3, 'Ulugbek', 'Abduvaliyev'),
(3, 'Sardor', 'Ismoilov'),
(3, 'Malika', 'Qosimova'),
(3, 'Asadbek', 'Xalilov'),
(3, 'Dildora', 'Raximova'),

(4, 'Farrux', 'Jumayev'),
(4, 'Sherzod', 'Ergashev'),
(4, 'Lola', 'Mirzayeva'),
(4, 'Bekzod', 'Sattorov'),
(4, 'Shahnoza', 'Yoqubova'),

(5, 'Jamshid', 'Ostonov'),
(5, 'Alisher', 'Niyozov'),
(5, 'Zilola', 'Axmedova'),
(5, 'Husniddin', 'Jorayev'),
(5, 'Madina', 'Yuldasheva'),

(6, 'Nodirbek', 'Murodov'),
(6, 'Jahongir', 'Sharipov'),
(6, 'Sevara', 'Botirova'),
(6, 'Eldor', 'Sultonov'),
(6, 'Rayhona', 'Ibrohimova'),

(7, 'Otabek', 'Mahmudov'),
(7, 'Sanjar', 'Davronov'),
(7, 'Maftuna', 'Akramova'),
(7, 'Abbos', 'Xolmuratov'),
(7, 'Diyora', 'Rasulova'),

(8, 'Umidjon', 'Nurmatov'),
(8, 'Doniyor', 'Kamilov'),
(8, 'Mohira', 'Shukurova'),
(8, 'Shohjahon', 'Qodirov'),
(8, 'Kamola', 'Zokirova');


SELECT * 
FROM teachers
----------------------------------------------------------

INSERT INTO subjects (subject_name, credit) VALUES 
('Matematika', 6),
('Fizika', 5),
('Dasturlash (Python / C++)', 6),
('Malumotlar bazasi (SQL)', 5),
('Veb-dasturlash (Frontend / Backend)', 6),
('Diskret matematika', 4),
('Kompyuter tarmoqlari', 5),
('Algoritmlar va malumotlar tuzilmasi', 6),
('Operatsion tizimlar', 4),
('Shtat va kiberxavfsizlik asoslari', 4),
('Suniy intellekt asoslari', 5),
('Ingliz tili (IT uchun)', 3),
('Mikroprotsessorlar va apparat taminoti', 4),
('Mobil ilovalarni ishlab chiqish', 5),
('Loyiha boshqaruvi (Project Management)', 3);

INSERT INTO subjects (subject_name, credit) VALUES 
('test', 6)

SELECT * FROM subjects
----------------------------------------------------------

INSERT INTO teacher_subjects (teacher_id, subject_id) VALUES 
(1, 1), (1, 6),
(2, 1), (2, 2),
(3, 3), (3, 8),
(4, 4), (4, 5),
(5, 5), (5, 14),
(6, 7), (6, 10),
(7, 8), (7, 3),
(8, 9), (8, 13),
(9, 11), (9, 15),
(10, 12),
(11, 1), (11, 2),
(12, 3), (12, 4),
(13, 5), (13, 6),
(14, 7), (14, 8),
(15, 9), (15, 10),
(16, 11), (16, 12),
(17, 13), (17, 14),
(18, 15), (18, 1),
(19, 2), (19, 3),
(20, 4), (20, 5),
(21, 6), (21, 7),
(22, 8), (22, 9),
(23, 10), (23, 11),
(24, 12), (24, 13),
(25, 14), (25, 15),
(26, 1), (26, 3),
(27, 2), (27, 4),
(28, 5), (28, 7),
(29, 6), (29, 8),
(30, 9), (30, 11),
(31, 10), (31, 12),
(32, 13), (32, 15),
(33, 14), (33, 1),
(34, 2), (34, 5),
(35, 3), (35, 6),
(36, 4), (36, 8),
(37, 7), (37, 9),
(38, 10), (38, 11),
(39, 12), (39, 14),
(40, 13), (40, 15);  

SELECT * from teacher_subjects

----------------------------------------------------------

INSERT INTO student_subjects (student_id, subject_id) VALUES 
(1, 1), (1, 3), (1, 4), (1, 5),
(2, 1), (2, 3), (2, 4),
(3, 1), (3, 2), (3, 6),
(4, 2), (4, 3), (4, 8),
(5, 4), (5, 5), (5, 12),
(6, 1), (6, 4), (6, 7),
(7, 2), (7, 5), (7, 8),
(8, 3), (8, 6), (8, 9),
(9, 4), (9, 10), (9, 12),
(10, 5), (10, 11), (10, 14),
(11, 1), (11, 3), (11, 5),
(12, 2), (12, 4), (12, 6),
(13, 3), (13, 7), (13, 8),
(14, 4), (14, 9), (14, 10),
(15, 5), (15, 12), (15, 15),
(16, 1), (16, 2), (16, 3),
(17, 2), (17, 4), (17, 6),
(18, 3), (18, 5), (18, 7),
(19, 4), (19, 8), (19, 9),
(20, 5), (20, 10), (20, 11),
(21, 1), (21, 6), (21, 12),
(22, 2), (22, 7), (22, 13),
(23, 3), (23, 8), (23, 14),
(24, 4), (24, 9), (24, 15),
(25, 5), (25, 10), (25, 1),
(26, 1), (26, 3), (26, 4),
(27, 2), (27, 5), (27, 6),
(28, 3), (28, 7), (28, 8),
(29, 4), (29, 9), (29, 11),
(30, 5), (30, 10), (30, 12),
(31, 1), (31, 2), (31, 13),
(32, 2), (32, 4), (32, 14),
(33, 3), (33, 5), (33, 15),
(34, 4), (34, 6), (34, 7),
(35, 5), (35, 8), (35, 9),
(36, 1), (36, 10), (36, 11),
(37, 2), (37, 12), (37, 13),
(38, 3), (38, 14), (38, 15),
(39, 4), (39, 1), (39, 5),
(40, 5), (40, 2), (40, 6),
(41, 1), (41, 3), (41, 7),
(42, 2), (42, 4), (42, 8),
(43, 3), (43, 5), (43, 9),
(44, 4), (44, 6), (44, 10),
(45, 5), (45, 7), (45, 11);

SELECT * from student_subjects
----------------------------------------------------------

INSERT INTO grades (grade_type, grade, created_at, subject_id, student_id) VALUES 
('Oraliq nazorat', 5, '2026-03-10 09:00:00', 1, 1),
('Amaliyot', 4, '2026-03-15 10:30:00', 3, 1),
('Uy vazifasi', 5, '2026-03-20 14:00:00', 4, 1),
('Yakuniy nazorat', 5, '2026-06-10 11:00:00', 5, 1),

('Oraliq nazorat', 3, '2026-03-10 09:00:00', 1, 2),
('Amaliyot', 4, '2026-03-16 10:30:00', 3, 2),
('Yakuniy nazorat', 4, '2026-06-11 09:30:00', 4, 2),

('Oraliq nazorat', 5, '2026-03-11 09:00:00', 1, 3),
('Uy vazifasi', 4, '2026-03-18 15:00:00', 2, 3),
('Amaliyot', 3, '2026-03-22 11:00:00', 6, 3),

('Oraliq nazorat', 4, '2026-03-12 10:00:00', 2, 4),
('Amaliyot', 5, '2026-03-19 12:00:00', 3, 4),
('Yakuniy nazorat', 4, '2026-06-12 10:00:00', 8, 4),

('Uy vazifasi', 3, '2026-03-14 14:00:00', 4, 5),
('Oraliq nazorat', 4, '2026-03-21 09:00:00', 5, 5),
('Amaliyot', 5, '2026-03-25 16:00:00', 12, 5),

('Oraliq nazorat', 5, '2026-03-10 09:00:00', 1, 6),
('Uy vazifasi', 4, '2026-03-17 11:00:00', 4, 6),
('Yakuniy nazorat', 5, '2026-06-14 09:00:00', 7, 6),

('Amaliyot', 4, '2026-03-13 13:00:00', 2, 7),
('Oraliq nazorat', 3, '2026-03-20 10:00:00', 5, 7),
('Yakuniy nazorat', 4, '2026-06-15 14:00:00', 8, 7),

('Oraliq nazorat', 5, '2026-03-15 09:00:00', 3, 8),
('Uy vazifasi', 5, '2026-03-22 15:30:00', 6, 8),
('Amaliyot', 4, '2026-03-28 10:00:00', 9, 8),

('Oraliq nazorat', 3, '2026-03-11 11:00:00', 4, 9),
('Amaliyot', 4, '2026-03-19 14:00:00', 10, 9),
('Yakuniy nazorat', 3, '2026-06-16 11:00:00', 12, 9),

('Oraliq nazorat', 5, '2026-03-12 09:00:00', 5, 10),
('Uy vazifasi', 4, '2026-03-23 12:00:00', 11, 10),
('Yakuniy nazorat', 5, '2026-06-17 10:00:00', 14, 10);
SELECT * from grades

----------------------------------------------------------
INSERT INTO attendance (status, created_at, subject_id, student_id) VALUES 
('qatnashgan', '2026-04-01 08:30:00', 1, 1),
('qatnashgan', '2026-04-01 10:00:00', 3, 1),
('qatnashmagan', '2026-04-02 08:30:00', 4, 1),
('qatnashgan', '2026-04-02 10:00:00', 5, 1),

('qatnashgan', '2026-04-01 08:30:00', 1, 2),
('qatnashgan', '2026-04-01 10:00:00', 3, 2),
('qatnashgan', '2026-04-02 08:30:00', 4, 2),

('qatnashmagan', '2026-04-01 08:30:00', 1, 3),
('qatnashgan', '2026-04-01 10:00:00', 2, 3),
('qatnashgan', '2026-04-02 11:30:00', 6, 3),

('qatnashgan', '2026-04-01 08:30:00', 2, 4),
('qatnashmagan', '2026-04-01 10:00:00', 3, 4),
('qatnashgan', '2026-04-02 13:00:00', 8, 4),

('qatnashgan', '2026-04-01 10:00:00', 4, 5),
('qatnashgan', '2026-04-02 08:30:00', 5, 5),
('qatnashgan', '2026-04-02 10:00:00', 12, 5),

('qatnashgan', '2026-04-03 08:30:00', 1, 6),
('qatnashmagan', '2026-04-03 10:00:00', 4, 6),
('qatnashgan', '2026-04-04 08:30:00', 7, 6),

('qatnashgan', '2026-04-03 08:30:00', 2, 7),
('qatnashgan', '2026-04-03 10:00:00', 5, 7),
('qatnashgan', '2026-04-04 11:30:00', 8, 7),

('qatnashgan', '2026-04-03 10:00:00', 3, 8),
('qatnashmagan', '2026-04-04 08:30:00', 6, 8),
('qatnashgan', '2026-04-04 10:00:00', 9, 8),

('qatnashgan', '2026-04-03 11:30:00', 4, 9),
('qatnashgan', '2026-04-04 08:30:00', 10, 9),
('qatnashmagan', '2026-04-04 10:00:00', 12, 9),

('qatnashgan', '2026-04-03 08:30:00', 5, 10),
('qatnashgan', '2026-04-03 10:00:00', 11, 10),
('qatnashgan', '2026-04-04 13:00:00', 14, 10);

SELECT * from attendance