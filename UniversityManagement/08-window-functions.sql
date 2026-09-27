-- 1. Har bir studentni o‘rtacha bahosi bo‘yicha ROW_NUMBER bilan tartibla.
SELECT   s.id,
         s.first_name,
         AVG(g.grade) AS AVG,
         ROW_NUMBER() OVER (ORDER BY AVG(g.grade)) AS row_number
FROM     students AS s
         INNER JOIN
         grades AS g
         ON s.id = g.student_id
GROUP BY s.id, s.first_name;

-- 2. RANK va DENSE_RANK orqali studentlar reytingini tuz.
SELECT   s.id,
         s.first_name,
         s.last_name,
         AVG(g.grade) AS avg_grade,
         RANK() OVER (ORDER BY AVG(g.grade)) AS rank,
         DENSE_RANK() OVER (ORDER BY AVG(g.grade)) AS dense_rank
FROM     students AS s
         INNER JOIN
         grades AS g
         ON s.id = g.student_id
GROUP BY s.id, s.first_name, s.last_name;

-- 3. Har bir department ichida studentlarni alohida reyting qil.
SELECT   d.id,
         d.department_name,
         s.first_name,
         s.last_name,
         SUM(g.grade) AS total_grade,
         RANK() OVER (PARTITION BY d.id ORDER BY sum(g.grade))
FROM     student_groups AS sg
         INNER JOIN
         students AS s
         ON sg.id = s.group_id
         INNER JOIN
         departments AS d
         ON sg.department_id = d.id
         INNER JOIN
         grades AS g
         ON s.id = g.student_id
GROUP BY d.id, d.department_name, s.first_name, s.last_name;

-- 4. NTILE yordamida studentlarni natijasiga qarab 4 guruhga bo‘l.
SELECT   s.id,
         s.first_name,
         s.last_name,
         SUM(g.grade) AS total_grades,
         NTILE(4) OVER (ORDER BY SUM(g.grade) DESC) AS ntile_group
FROM     students AS s
         INNER JOIN
         grades AS g
         ON s.id = g.student_id
GROUP BY s.id, s.first_name, s.last_name;

-- 5. Har bir studentning bahosini oldingi bahosi bilan LAG orqali solishtir.
SELECT s.id,
       s.first_name,
       s.last_name,
       g.grade,
       g.created_at,
       LAG(g.grade) OVER (PARTITION BY s.id ORDER BY g.created_at) AS previous_grade
FROM   students AS s
       INNER JOIN
       grades AS g
       ON s.id = g.student_id;

-- 6. Running total yoki running average misolini baholar ustida bajar.
SELECT s.id,
       s.first_name,
       s.last_name,
       g.grade,
       g.created_at,
       AVG(g.grade * 1.0) OVER (PARTITION BY s.id ORDER BY g.created_at ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_avg,
       SUM(g.grade * 1.0) OVER (PARTITION BY s.id ORDER BY g.created_at ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_sum
FROM   students AS s
       INNER JOIN
       grades AS g
       ON s.id = g.student_id;