--1  Har bir faculty’da nechta student borligini hisobla.
SELECT   faculty_name,
         COUNT(s.id) AS students_count
FROM     students AS s
         LEFT OUTER JOIN
         student_groups AS sg
         ON s.group_id = sg.id
         LEFT OUTER JOIN
         departments AS d
         ON sg.department_id = d.id
         LEFT OUTER JOIN
         faculties AS f
         ON d.faculty_id = f.id
GROUP BY faculty_name;

--2 Har bir department’da nechta teacher borligini hisobla.
SELECT   d.department_name,
         COUNT(t.id) AS teachers_count
FROM     teachers AS t
         LEFT OUTER JOIN
         departments AS d
         ON t.department_id = d.id
GROUP BY d.department_name;

--3 Har bir groupdagi studentlar sonini hisobla.
SELECT   sg.group_name,
         COUNT(s.id) AS students_count
FROM     students AS s
         LEFT OUTER JOIN
         student_groups AS sg
         ON s.group_id = sg.id
GROUP BY sg.group_name;

--4 Har bir subject bo‘yicha o‘rtacha bahoni hisobla.
SELECT   s.subject_name,
         AVG(g.grade) AS avg_greade
FROM     grades AS g
         LEFT OUTER JOIN
         subjects AS s
         ON g.subject_id = s.id
GROUP BY s.subject_name;

--5 Har bir studentning o‘rtacha bahosini top.
SELECT   s.first_name,
         avg(g.grade) AS avg_grade
FROM     grades AS g
         LEFT OUTER JOIN
         students AS s
         ON g.student_id = s.id
GROUP BY s.first_name;

--6 Eng yuqori va eng past o‘rtacha bahoga ega studentlar haqida hisobot tayyorla.
SELECT first_name
FROM   (SELECT   s.first_name,
                 avg(g.grade) AS avg_grade,
                 RANK() OVER (ORDER BY avg(g.grade)) AS min,
                 RANK() OVER (ORDER BY avg(g.grade) DESC) AS max
        FROM     grades AS g
                 LEFT OUTER JOIN
                 students AS s
                 ON g.student_id = s.id
        GROUP BY s.first_name) AS t
WHERE  min = 1
       OR max = 1;

--7
SELECT   sg.group_name,
         COUNT(s.id) AS students_count
FROM     student_groups AS sg
         LEFT OUTER JOIN
         students AS s
         ON sg.id = s.group_id
GROUP BY sg.group_name
HAVING   COUNT(s.id) > 5
ORDER BY students_count;