-- 1
SELECT s.first_name,
       s.last_name,
       sg.group_name
FROM   student_groups AS sg
       INNER JOIN
       students AS s
       ON sg.id = s.group_id;

-- 2
SELECT d.department_name,
       sg.group_name
FROM   departments AS d
       LEFT OUTER JOIN
       student_groups AS sg
       ON d.id = sg.department_id;

-- 3
SELECT first_name,
       group_name,
       department_name,
       faculty_name
FROM   students AS s
       LEFT OUTER JOIN
       student_groups AS sg
       ON s.group_id = sg.id
       LEFT OUTER JOIN
       departments AS d
       ON sg.department_id = d.id
       LEFT OUTER JOIN
       faculties AS f
       ON d.faculty_id = f.id;

-- 4
SELECT *
FROM   teachers AS t
       LEFT OUTER JOIN
       departments AS d
       ON t.department_id = d.id;

-- 5
SELECT t.first_name,
       t.last_name,
       s.subject_name,
       s.credit
FROM   teacher_subjects AS ts
       LEFT OUTER JOIN
       teachers AS t
       ON ts.teacher_id = t.id
       LEFT OUTER JOIN
       subjects AS s
       ON ts.subject_id = s.id;

-- 6
SELECT s.first_name,
       sub.subject_name
FROM   student_subjects AS ss
       LEFT OUTER JOIN
       students AS s
       ON ss.student_id = s.id
       LEFT OUTER JOIN
       subjects AS sub
       ON ss.subject_id = sub.id;

--7
SELECT *
FROM   students AS s
       LEFT OUTER JOIN
       student_subjects AS ss
       ON s.id = ss.student_id
WHERE  subject_id IS NULL;

--8
SELECT *
FROM   subjects AS s
       LEFT OUTER JOIN
       student_subjects AS ss
       ON s.id = ss.subject_id
WHERE  ss.student_id IS NULL;