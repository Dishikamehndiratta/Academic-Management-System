**Academic Management System**
**Overview**
The Academic Management System is a database-driven project designed to efficiently handle the management of student information, course details, and enrollment records in an educational institution. By leveraging SQL, this project demonstrates how relational databases can be utilized to organize, store, and retrieve academic data systematically.

**The primary objective of this project is to develop a system that allows administrators to:**

    1) Manage student data, including personal and contact information.
    2) Maintain and organize course details along with assigned instructors.
    3) Track and update enrollment statuses of students in various courses.

**Features**
**1)Student Management**
        Stores essential information such as names, contact details, and addresses.
        Ensures unique identification of students via a primary key.
**2)Course Management**
        Maintains a catalog of available courses.
        Links courses to their respective instructors for clarity and organization.

**3)Enrollment Tracking**
        Tracks which students are enrolled in which courses.
        Maintains enrollment status to reflect current progress.

  **4)Query and Reporting**
        Facilitates retrieval of student and course data for analysis.
        Generates insights such as the number of enrollments per course or student lists for specific courses.

**Database Structure**
The project utilizes a relational database with three core tables:

    StudentInfo: Contains personal and contact details of students.
    CoursesInfo: Stores details about courses and instructors.
    EnrollmentInfo: Tracks the relationship between students and courses, ensuring proper enrollment records.

**Relationships between the tables are enforced through foreign keys, maintaining referential integrity across the database.
Technologies Used**

    1) SQL: For creating, querying, and managing the database.
    2) Database System: Compatible with PostgreSQL, MySQL, and SQL Server.
