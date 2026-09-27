--1 Studentlar va ularning o‘rtacha baholarini hisoblaydigan CTE yarat
WITH     StudentsAvgScore
AS       (SELECT   s.id,
                   s.first_name,
                   s.last_name,
                   AVG(grade) AS avg
          FROM     grades AS g
                   INNER JOIN
                   students AS s
                   ON g.student_id = s.id
          GROUP BY s.id, s.first_name, s.last_name)
SELECT   *
FROM     StudentsAvgScore
ORDER BY avg;

-- 2 CTE natijasidan foydalanib o‘rtacha bahosi belgilangan qiymatdan yuqori studentlarni chiqar.
WITH     StudentsAvgScore
AS       (SELECT   s.id,
                   s.first_name,
                   s.last_name,
                   AVG(grade) AS avg
          FROM     grades AS g
                   INNER JOIN
                   students AS s
                   ON g.student_id = s.id
          GROUP BY s.id, s.first_name, s.last_name)
SELECT   *
FROM     StudentsAvgScore
WHERE    avg > 3
ORDER BY avg;

-- 3 Birinchi CTE’da studentning jami bahosini, ikkinchi CTE’da baholar sonini hisobla va ularni birlashtir.
WITH   SumGredes
AS     (SELECT   student_id,
                 SUM(grade) AS sum
        FROM     grades
        GROUP BY student_id),
       CountGrades
AS     (SELECT   student_id,
                 COUNT(grade) AS count
        FROM     grades
        GROUP BY student_id)
SELECT sg.student_id,
       sum,
       count
FROM   SumGredes AS sg
       INNER JOIN
       CountGrades AS cg
       ON sg.student_id = cg.student_id;

-- 4 Faculty -> Department -> Group kabi ierarxik ma’lumotni recursive CTE bilan tajriba tariqasida chiqar.
WITH     UniversityHierarchy
AS       (-- 1-daraja: Faculty
          SELECT f.id,
                 f.faculty_name AS name,
                 1 AS level
          FROM   faculties AS f
          UNION ALL
          -- 2-daraja: Department
          SELECT d.id,
                 d.department_name,
                 2
          FROM   departments AS d
          UNION ALL
          -- 3-daraja: Group
          SELECT sg.id,
                 sg.group_name,
                 3
          FROM   student_groups AS sg)
SELECT   *
FROM     UniversityHierarchy
ORDER BY level, id;

-- 5. CTE yordamida har bir department bo‘yicha studentlar sonini hisobla va eng kattalarini sarala.
WITH     CTE_DepartmentStudents
AS       (SELECT   d.department_name,
                   count(s.id) AS count
          FROM     student_groups AS sg
                   INNER JOIN
                   departments AS d
                   ON sg.department_id = d.id
                   INNER JOIN
                   students AS s
                   ON sg.id = s.group_id
          GROUP BY d.department_name)
SELECT   *
FROM     CTE_DepartmentStudents
ORDER BY [count] DESC;