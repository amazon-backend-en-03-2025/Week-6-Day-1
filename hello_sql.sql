CREATE DATABASE hello_sql;

# ctrl + alt + L -> format

USE hello_sql;

CREATE TABLE course(
                       course_code VARCHAR(6) NOT NULL,
                       course_name VARCHAR(50),
                       PRIMARY KEY (course_code)
);

INSERT INTO course (course_code, course_name)
VALUES
    ('CS101', 'Intro to Java'),
    ('CS103', 'Database')
;

# SELECT course_name FROM course;
SELECT  * FROM course;

CREATE TABLE section (
                         id VARCHAR(8) NOT NULL,
                         course_code VARCHAR(6),
                         room_num INT,
                         instructor VARCHAR(255),
                         PRIMARY KEY (id),
                         FOREIGN KEY (course_code) REFERENCES course(course_code)
);

INSERT INTO section (id, course_code, room_num, instructor)
VALUES
    ('CS101-A', 'CS101', 1802, 'Balderez'),
    ('CS101-B', 'CS101', 1650, 'Su'),
    ('CS103', 'CS103', 1200, 'Rojas')
;

CREATE TABLE grade (
                       id INT NOT NULL AUTO_INCREMENT,
                       student_name VARCHAR(255),
                       section_id VARCHAR(8),
                       score INT,
                       PRIMARY KEY (id),
                       FOREIGN KEY (section_id) REFERENCES section(id)
);

INSERT INTO grade (student_name, section_id, score)
VALUES
    ('John Doe', 'CS101-A', 95),
    ('Jane Smith', 'CS101-B', 85),
    ('Alice Johnson', 'CS103', 90)
;


DROP TABLE grade;

SELECT  * FROM course;

SELECT * from course WHERE course_code = 'CS101';

SELECT * from grade WHERE score >= 90;

UPDATE grade SET score = 93 WHERE id = 1;;

SELECT * FROM grade;

UPDATE grade SET score = 92 WHERE id = 1;

DELETE  FROM grade WHERE id = 1;

# ALTER TABLE  grade
# CHANGE score score VARCHAR(8);