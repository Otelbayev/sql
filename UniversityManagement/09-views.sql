-- 1. Student, group, department va faculty ma’lumotlarini bitta joyda ko‘rsatadigan view yarat.
IF OBJECT_ID('V_StudentData', 'V') IS NOT NULL
    DROP VIEW V_StudentData;


GO
CREATE VIEW V_StudentData
AS
SELECT s.first_name,
       s.last_name,
       s.birthday,
       sg.group_name,
       d.department_name,
       f.faculty_name
FROM   students AS s
       INNER JOIN
       student_groups AS sg
       ON s.group_id = sg.id
       INNER JOIN
       departments AS d
       ON sg.department_id = d.id
       INNER JOIN
       faculties AS f
       ON d.faculty_id = f.id;


GO
-- 2. Har bir studentning o‘rtacha bahosini ko‘rsatadigan view yarat.
IF OBJECT_ID('V_AVG_Score', 'V') IS NOT NULL
    DROP VIEW V_AVG_Score;


GO
CREATE VIEW V_AVG_Score
AS
SELECT   s.id,
         s.first_name,
         s.last_name,
         AVG(CAST (g.grade AS DECIMAL (4, 2))) AS avg_grade
FROM     students AS s
         LEFT OUTER JOIN
         grades AS g
         ON s.id = g.student_id
GROUP BY s.id, s.first_name, s.last_name;


GO
-- 3. Har bir group bo‘yicha studentlar sonini ko‘rsatadigan view yarat.
IF OBJECT_ID('V_CountStudents', 'V') IS NOT NULL
    DROP VIEW V_CountStudents;


GO
CREATE VIEW V_CountStudents
AS
SELECT   sg.id AS group_id,
         sg.group_name,
         COUNT(s.id) AS student_count
FROM     student_groups AS sg
         LEFT OUTER JOIN
         students AS s
         ON sg.id = s.group_id
GROUP BY sg.id, sg.group_name;


GO
-- 4. Attendance statistikasi uchun alohida view yarat.
IF OBJECT_ID('V_Attendance', 'V') IS NOT NULL
    DROP VIEW V_Attendance;


GO
CREATE VIEW V_Attendance
AS
(SELECT s.first_name,
        s.last_name,
        sub.subject_name,
        a.[status]
 FROM   attendance AS a
        INNER JOIN
        students AS s
        ON a.student_id = s.id
        INNER JOIN
        subjects AS sub
        ON a.subject_id = sub.id);


GO
-- 5. Yaratilgan view’lardan oddiy jadval kabi SELECT qilib ko‘r.
SELECT *
FROM   V_StudentData;

SELECT *
FROM   V_AVG_Score;

SELECT *
FROM   V_CountStudents;

SELECT *
FROM   V_Attendance;
