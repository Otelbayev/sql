-- 1. Barcha studentlar ro‘yxatini qaytaradigan procedure yarat.
DROP PROCEDURE IF EXISTS StudentsPro;


GO
CREATE PROCEDURE StudentsPro
AS
BEGIN
    SELECT *
    FROM   students;
END


GO
EXECUTE StudentsPro ;

-- 2. Group ID qabul qilib, faqat shu guruh studentlarini qaytaradigan procedure yarat.
DROP PROCEDURE IF EXISTS StudentsByGroupID;


GO
CREATE PROCEDURE StudentsByGroupID
@group_id INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT *
    FROM   students
    WHERE  group_id = @group_id;
END


GO
EXECUTE StudentsByGroupID @group_id = 1;

-- 3. Faculty nomi yoki ID bo‘yicha studentlarni chiqaradigan procedure yarat.
DROP PROCEDURE IF EXISTS StudentsByFacultyID;


GO
CREATE PROCEDURE StudentsByFacultyID
@faculty_id INT
AS
BEGIN
    SELECT s.first_name,
           s.last_name,
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
           ON d.faculty_id = f.id
    WHERE  f.id = @faculty_id;
END


GO
EXECUTE StudentsByFacultyID @faculty_id = 1;

-- 4. Student ID qabul qilib, uning fanlari va baholarini chiqaradigan procedure yarat.
DROP PROCEDURE IF EXISTS GetStudetnData;


GO
CREATE PROCEDURE GetStudetnData
@student_id INT
AS
BEGIN
    SELECT sub.subject_name,
           g.grade
    FROM   subjects AS sub
           INNER JOIN
           grades AS g
           ON sub.id = g.subject_id
           INNER JOIN
           students AS s
           ON s.id = g.student_id
    WHERE  s.id = @student_id;
END


GO
EXECUTE GetStudetnData @student_id = 1;

-- 5. Yangi student qo‘shish uchun parameterli procedure yarat.
DROP PROCEDURE IF EXISTS AddStudent;


GO
CREATE PROCEDURE AddStudent
@first_name NVARCHAR (60), @last_name NVARCHAR (60), @birthday DATE, @group_id INT
AS
BEGIN
    INSERT  INTO students (
        first_name,
        last_name,
        birthday,
        group_id
    )
    VALUES               (@first_name, @last_name, @birthday, @group_id);
END


GO
EXECUTE AddStudent @first_name = 'InsertPro', @last_name = 'Test', @birthday = '2005-01-01', @group_id = 1;

-- 6. Pagination qiladigan procedure yarat: page number va page size qabul qilsin.
DROP PROCEDURE IF EXISTS Pagination;


GO
CREATE PROCEDURE Pagination
@page_number INT=1, @page_size INT=10
AS
BEGIN
    SELECT   *
    FROM     students
    ORDER BY id
    OFFSET (@page_number - 1) * @page_size ROWS FETCH NEXT @page_size ROWS ONLY;
END


GO
EXECUTE Pagination @page_number = 3