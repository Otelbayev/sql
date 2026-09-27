--1
SELECT *
FROM   students;

--2 status field yartilmagan
--3 qabul qilgan yili column bor emas
--4
SELECT *
FROM   students
WHERE  first_name LIKE 'j%';

--5
SELECT *
FROM   grades
WHERE  grade BETWEEN 1 AND 3;

--6
SELECT   last_name,
         first_name
FROM     students
ORDER BY last_name;

--7
SELECT   TOP 3 *
FROM     students
ORDER BY id DESC;