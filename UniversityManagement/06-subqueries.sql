--1 Universitet o‘rtacha bahosidan yuqori natijaga ega studentlarni top.
SELECT *
FROM   (SELECT   s.id,
                 s.first_name,
                 s.last_name,
                 AVG(g.grade) AS avg_grade
        FROM     grades AS g
                 INNER JOIN
                 students AS s
                 ON g.student_id = s.id
        GROUP BY s.id, s.first_name, s.last_name) AS t
WHERE  avg_grade > (SELECT AVG(grade)
                    FROM   grades);

--2 Eng yuqori baho olgan student yoki studentlarni subquery yordamida chiqar.
SELECT s.id,
       s.first_name,
       s.last_name,
       g.grade
FROM   grades AS g
       INNER JOIN
       students AS s
       ON g.student_id = s.id
WHERE  g.grade = (SELECT MAX(grade)
                  FROM   grades);

--3 Kamida bitta bahosi mavjud studentlarni EXISTS orqali top.
SELECT *
FROM   students
WHERE  EXISTS (SELECT 1
               FROM   grades
               WHERE  grades.student_id = students.id);

--4 Birorta ham bahosi yo‘q studentlarni NOT EXISTS yordamida top.
SELECT *
FROM   students
WHERE  NOT EXISTS (SELECT 1
                   FROM   grades
                   WHERE  grades.student_id = students.id);

--5 Ma’lum faculty ichidagi studentlarni IN subquery yordamida chiqar.
SELECT *
FROM   students
WHERE  group_id IN (SELECT id
                    FROM   student_groups
                    WHERE  department_id IN (SELECT id
                                             FROM   departments
                                             WHERE  faculty_id = 1));