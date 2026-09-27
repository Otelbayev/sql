CREATE DATABASE UniversityManagement;


GO
USE UniversityManagement;

CREATE TABLE faculties (
    id           INT          IDENTITY (1, 1) PRIMARY KEY,
    faculty_name VARCHAR (60) UNIQUE NOT NULL
);

CREATE TABLE departments (
    id              INT          IDENTITY (1, 1) PRIMARY KEY,
    faculty_id      INT          NOT NULL,
    department_name VARCHAR (60) UNIQUE NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES faculties (id)
);

CREATE TABLE student_groups (
    id            INT          IDENTITY (1, 1) PRIMARY KEY,
    group_name    VARCHAR (60) UNIQUE NOT NULL,
    department_id INT          NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments (id)
);

CREATE TABLE students (
    id         INT          IDENTITY (1, 1) PRIMARY KEY,
    first_name VARCHAR (60) NOT NULL,
    last_name  VARCHAR (60) NOT NULL,
    birthday   DATE        ,
    group_id   INT          NOT NULL,
    FOREIGN KEY (group_id) REFERENCES student_groups (id)
);

CREATE TABLE teachers (
    id            INT          IDENTITY (1, 1) PRIMARY KEY,
    first_name    VARCHAR (60) NOT NULL,
    last_name     VARCHAR (60) NOT NULL,
    department_id INT          NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments (id)
);

CREATE TABLE subjects (
    id           INT          IDENTITY (1, 1) PRIMARY KEY,
    subject_name VARCHAR (60) NOT NULL,
    credit       INT          NOT NULL
);

CREATE TABLE teacher_subjects (
    subject_id INT NOT NULL,
    teacher_id INT NOT NULL,
    PRIMARY KEY (teacher_id, subject_id),
    FOREIGN KEY (subject_id) REFERENCES subjects (id),
    FOREIGN KEY (teacher_id) REFERENCES teachers (id)
);

CREATE TABLE student_subjects (
    subject_id INT NOT NULL,
    student_id INT NOT NULL,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES students (id),
    FOREIGN KEY (subject_id) REFERENCES subjects (id)
);

CREATE TABLE grades (
    id         INT          IDENTITY (1, 1) PRIMARY KEY,
    grade_type VARCHAR (60),
    grade      INT          CHECK (grade BETWEEN 1 AND 5) NOT NULL,
    created_at DATETIME2    NOT NULL,
    subject_id INT          NOT NULL,
    student_id INT          NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students (id),
    FOREIGN KEY (subject_id) REFERENCES subjects (id)
);

CREATE TABLE attendance (
    id         INT          IDENTITY (1, 1) PRIMARY KEY,
    status     VARCHAR (60) CHECK (status IN ('qatnashgan', 'qatnashmagan')),
    created_at DATETIME2    NOT NULL,
    subject_id INT          NOT NULL,
    student_id INT          NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students (id),
    FOREIGN KEY (subject_id) REFERENCES subjects (id)
);