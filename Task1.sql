CREATE DATABASE AcademicManagementSystem

USE AcademicManagementSystem;

-- Create the StudentInfo table
CREATE TABLE StudentInfo (
    STU_ID INT PRIMARY KEY IDENTITY(1,1),
    STU_NAME VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    PHONE_NO VARCHAR(15) NOT NULL,
    EMAIL_ID VARCHAR(100) NOT NULL UNIQUE,
    ADDRESS VARCHAR(255)
);

-- Create the CoursesInfo table
CREATE TABLE CoursesInfo (
    COURSE_ID INT PRIMARY KEY IDENTITY(1,1),
    COURSE_NAME VARCHAR(100) NOT NULL,
    COURSE_INSTRUCTOR_NAME VARCHAR(100) NOT NULL
);

-- Create the EnrollmentInfo table
CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID INT PRIMARY KEY IDENTITY(1,1),
    STU_ID INT NOT NULL,
    COURSE_ID INT NOT NULL,
    ENROLL_STATUS VARCHAR(20) NOT NULL CHECK (ENROLL_STATUS IN ('Enrolled', 'Not Enrolled')),
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);



CREATE TABLE StudentInfo (
    STU_ID INT PRIMARY KEY IDENTITY(1,1),
    STU_NAME VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    PHONE_NO VARCHAR(15) NOT NULL,
    EMAIL_ID VARCHAR(100) NOT NULL UNIQUE,
    ADDRESS VARCHAR(255)
);

CREATE TABLE CoursesInfo (
    COURSE_ID INT PRIMARY KEY IDENTITY(1,1),
    COURSE_NAME VARCHAR(100) NOT NULL,
    COURSE_INSTRUCTOR_NAME VARCHAR(100) NOT NULL
);

CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID INT PRIMARY KEY IDENTITY(1,1),
    STU_ID INT NOT NULL,
    COURSE_ID INT NOT NULL,
    ENROLL_STATUS VARCHAR(20) NOT NULL CHECK (ENROLL_STATUS IN ('Enrolled', 'Not Enrolled')),
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);

INSERT INTO StudentInfo (STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS)
VALUES 
('John Doe', '2000-05-15', '1234567890', 'johndoe@example.com', '123 Main Street, City A'),
('Jane Smith', '1998-08-22', '9876543210', 'janesmith@example.com', '456 Elm Street, City B'),
('Alice Johnson', '2001-03-10', '5551234567', 'alicej@example.com', '789 Oak Street, City C');

INSERT INTO CoursesInfo (COURSE_NAME, COURSE_INSTRUCTOR_NAME)
VALUES 
('Database Systems', 'Dr. James Carter'),
('Data Structures', 'Dr. Emily Davis'),
('Software Engineering', 'Dr. Robert Brown');

INSERT INTO EnrollmentInfo (STU_ID, COURSE_ID, ENROLL_STATUS)
VALUES 
(1, 1, 'Enrolled'),
(2, 2, 'Enrolled'),
(3, 3, 'Not Enrolled'),
(1, 3, 'Enrolled');

SELECT 
    s.STU_NAME AS StudentName,
    s.PHONE_NO AS ContactNumber,
    s.EMAIL_ID AS Email,
    e.ENROLL_STATUS AS EnrollmentStatus
FROM 
    StudentInfo s
JOIN 
    EnrollmentInfo e
ON 
    s.STU_ID = e.STU_ID;

--2
SELECT 
    c.COURSE_NAME AS CourseName,
    c.COURSE_INSTRUCTOR_NAME AS InstructorName,
    e.ENROLL_STATUS AS EnrollmentStatus
FROM 
    CoursesInfo c
JOIN 
    EnrollmentInfo e
ON 
    c.COURSE_ID = e.COURSE_ID
JOIN 
    StudentInfo s
ON 
    s.STU_ID = e.STU_ID
WHERE 
    s.STU_NAME = 'John Doe' AND e.ENROLL_STATUS = 'Enrolled';

--3
SELECT 
    COURSE_NAME AS CourseName,
    COURSE_INSTRUCTOR_NAME AS InstructorName
FROM 
    CoursesInfo;

--4
SELECT 
    COURSE_NAME AS CourseName,
    COURSE_INSTRUCTOR_NAME AS InstructorName
FROM 
    CoursesInfo
WHERE 
    COURSE_NAME = 'Database Systems';


--5
SELECT 
    COURSE_NAME AS CourseName,
    COURSE_INSTRUCTOR_NAME AS InstructorName
FROM 
    CoursesInfo
WHERE 
    COURSE_NAME IN ('Database Systems', 'Data Structures', 'Software Engineering');


--4a
SELECT 
    c.COURSE_NAME AS CourseName,
    COUNT(e.STU_ID) AS EnrolledStudents
FROM 
    CoursesInfo c
LEFT JOIN 
    EnrollmentInfo e
ON 
    c.COURSE_ID = e.COURSE_ID
WHERE 
    e.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    c.COURSE_NAME;

--4b
SELECT 
    s.STU_NAME AS StudentName,
    s.PHONE_NO AS ContactNumber,
    s.EMAIL_ID AS Email
FROM 
    StudentInfo s
JOIN 
    EnrollmentInfo e
ON 
    s.STU_ID = e.STU_ID
JOIN 
    CoursesInfo c
ON 
    e.COURSE_ID = c.COURSE_ID
WHERE 
    c.COURSE_NAME = 'Database Systems' AND e.ENROLL_STATUS = 'Enrolled';


--4c
SELECT 
    c.COURSE_INSTRUCTOR_NAME AS InstructorName,
    COUNT(e.STU_ID) AS EnrolledStudents
FROM 
    CoursesInfo c
JOIN 
    EnrollmentInfo e
ON 
    c.COURSE_ID = e.COURSE_ID
WHERE 
    e.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    c.COURSE_INSTRUCTOR_NAME;

--4d
SELECT 
    s.STU_NAME AS StudentName,
    s.PHONE_NO AS ContactNumber,
    s.EMAIL_ID AS Email,
    COUNT(e.COURSE_ID) AS NumberOfCourses
FROM 
    StudentInfo s
JOIN 
    EnrollmentInfo e
ON 
    s.STU_ID = e.STU_ID
WHERE 
    e.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    s.STU_NAME, s.PHONE_NO, s.EMAIL_ID
HAVING 
    COUNT(e.COURSE_ID) > 1;

--4e
SELECT 
    c.COURSE_NAME AS CourseName,
    c.COURSE_INSTRUCTOR_NAME AS InstructorName,
    COUNT(e.STU_ID) AS EnrolledStudents
FROM 
    CoursesInfo c
JOIN 
    EnrollmentInfo e
ON 
    c.COURSE_ID = e.COURSE_ID
WHERE 
    e.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    c.COURSE_NAME, c.COURSE_INSTRUCTOR_NAME
ORDER BY 
    EnrolledStudents DESC;










