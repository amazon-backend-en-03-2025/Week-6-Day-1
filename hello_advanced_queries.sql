USE hello_sql;

CREATE TABLE course(
                       course_code VARCHAR(6) NOT NULL,
                       course_name VARCHAR(50),
                       PRIMARY KEY (course_code)
);

CREATE TABLE section (
                         id VARCHAR(8) NOT NULL,
                         course_code VARCHAR(6),
                         room_num INT,
                         instructor VARCHAR(255),
                         PRIMARY KEY (id),
                         FOREIGN KEY (course_code) REFERENCES course(course_code)
);


CREATE TABLE grade (
                       id INT NOT NULL AUTO_INCREMENT,
                       student_name VARCHAR(255),
                       section_id VARCHAR(8),
                       score INT,
                       PRIMARY KEY (id),
                       FOREIGN KEY (section_id) REFERENCES section(id)
);


-- Seeding course and section data
INSERT INTO course (course_code, course_name) VALUES
                                                  ('CS101', 'Intro to Java'),
                                                  ('CS103', 'Databases');

INSERT INTO course (course_code, course_name) VALUES
                                                  ('CS105', 'GenAI');

INSERT INTO section (id, course_code, room_num, instructor) VALUES
                                                                ('CS101-A', 'CS101', 1802, 'Balderez'),
                                                                ('CS101-B', 'CS101', 1650, 'Su'),
                                                                ('CS103-A', 'CS103', 1200, 'Rojas'),
                                                                ('CS103-B', 'CS103', 1208, 'Tonno');


INSERT INTO section (id, course_code, room_num, instructor) VALUES
                                                                ('CS105-S', 'CS105', 1208, 'Kharpaty');

INSERT INTO section (id, course_code, room_num, instructor) VALUES
    ('CS113', null, 1208, 'Kharpa');

INSERT INTO grade (student_name, section_id, score) VALUES
                                                        ('Maya Charlotte', 'CS101-A', 98),
                                                        ('James Fields', 'CS101-A', 82),
                                                        ('Michael Alcocer', 'CS101-B', 65),
                                                        ('Maya Charlotte', 'CS103-A', 89),
                                                        ('Tomas Lacroix', 'CS101-A', 99),
                                                        ('Sara Bisat', 'CS101-A', 87),
                                                        ('James Fields', 'CS101-B', 46),
                                                        ('Helena Sepulvida', 'CS103-A', 72);

SELECT * FROM course;

SELECT section_id, COUNT(*) FROM grade GROUP BY section_id;


SELECT section_id, AVG(score) FROM grade GROUP BY section_id;

SELECT section_id, COUNT(*) FROM grade WHERE score > 80 GROUP BY section_id;


SELECT section_id, AVG(score) FROM grade GROUP BY section_id HAVING AVG(score) > 80;


SELECT student_name, MAX(score) FROM grade WHERE student_name = 'Maya Charlotte';


SELECT section_id, SUM(score), COUNT(*) as 'Total number of grades:', AVG(score), MAX(score), MIN(score)
FROM grade
WHERE section_id = 'CS101-A'
GROUP BY section_id;


SELECT * FROM grade WHERE section_id LIKE 'CS%-A';

SELECT * FROM grade WHERE score BETWEEN 85 AND 95;

SELECT * FROM grade WHERE student_name LIKE 'M%' OR score > 95;

SELECT *  FROM grade ORDER BY score  ASC LIMIT 1;

SELECT  DISTINCT student_name FROM grade;

SELECT DISTINCT student_name, score FROM grade;


SELECT id, s.course_code, c.course_code, course_name, room_num, instructor FROM section s LEFT JOIN course c ON s.course_code = c.course_code;

