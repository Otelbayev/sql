-- 1. Student o‘chirilganda bu voqeani audit jadvaliga yozadigan trigger yarat.
CREATE TABLE StudentLog (
    LogID      INT          IDENTITY (1, 1) PRIMARY KEY,
    id         INT         ,
    first_name VARCHAR (60),
    last_name  VARCHAR (60),
    group_id   INT         ,
    birthday   DATE        
);


GO
CREATE TRIGGER trg_AferDelStudent
    ON students
    AFTER DELETE
    AS BEGIN
           INSERT INTO StudentLog (
               id,
               first_name,
               last_name,
               birthday,
               group_id
           )
           SELECT id,
                  first_name,
                  last_name,
                  birthday,
                  group_id
           FROM   deleted;
       END
       DELETE students
       WHERE  id = 2002;
       SELECT *
       FROM   students;
       SELECT *
       FROM   StudentLog;
       -- 2. Student ma’lumoti yangilanganda eski va yangi qiymatlarni audit qilishni sinab ko‘r.
       CREATE TABLE StudentUpdateLog (
           LogID          INT          IDENTITY (1, 1) PRIMARY KEY,
           id             INT         ,
           old_first_name VARCHAR (60),
           new_first_name VARCHAR (60),
           old_last_name  VARCHAR (60),
           new_last_name  VARCHAR (60),
           old_birthday   DATE        ,
           new_birthday   DATE        ,
           old_group_id   INT         ,
           new_group_id   INT         
       );


GO
CREATE TRIGGER trg_AfterStudentUpdate
    ON students
    AFTER UPDATE
    AS BEGIN
           INSERT INTO StudentUpdateLog (
               id,
               old_first_name,
               new_first_name,
               old_last_name,
               new_last_name,
               old_birthday,
               new_birthday,
               old_group_id,
               new_group_id
           )
           SELECT d.id,
                  d.first_name,
                  i.first_name,
                  d.last_name,
                  i.last_name,
                  d.birthday,
                  i.birthday,
                  d.group_id,
                  i.group_id
           FROM   deleted AS d
                  INNER JOIN
                  inserted AS i
                  ON d.id = i.id;
       END
       SELECT *
       FROM   StudentUpdateLog;
       UPDATE students
       SET    first_name = 'test',
              last_name  = 'test',
              birthday   = '2005-01-01',
              group_id   = 4
       WHERE  id = 1;


GO
-- 3. Noto‘g‘ri baho kiritishga urinishda trigger yoki constraint orqali himoya mexanizmini sinab ko‘r.


CREATE TRIGGER trg_CheckGrade
    ON grades
    AFTER INSERT, UPDATE
    AS BEGIN
           IF EXISTS (SELECT 1
                      FROM   inserted
                      WHERE  grade < 0
                             OR grade > 100)
               BEGIN
                   RAISERROR ('Baho 0 dan 100 gacha bo‘lishi kerak!', 16, 1);
                   ROLLBACK;
                   RETURN;
               END
       END


-- 4. Baholar jadvaliga yangi yozuv tushganda log jadvaliga avtomatik yozuv qo‘shadigan trigger yarat.
       CREATE TABLE GradeLog (
           LogID      INT          IDENTITY (1, 1) PRIMARY KEY,
           id         INT         ,
           grade_type VARCHAR (60),
           grade      INT         ,
           created_at DATETIME2   ,
           subject_id INT         ,
           student_id INT         
       );


GO
CREATE TRIGGER trg_AddGrade
    ON grades
    AFTER INSERT
    AS BEGIN
           INSERT INTO GradeLog (
               id,
               grade_type,
               grade,
               created_at,
               subject_id,
               student_id
           )
           SELECT id,
                  grade_type,
                  grade,
                  created_at,
                  subject_id,
                  student_id
           FROM   inserted;
       END
       INSERT  INTO grades (
           grade_type,
           grade,
           created_at,
           subject_id,
           student_id
       )
       VALUES             ('qatnashgan', 40, '2005-01-01', 1, 1);
       SELECT *
       FROM   GradeLog;