CREATE DATABASE apna_college;
USE apna_college;
CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);
INSERT INTO student VALUES
(1,"Tarun",20),
(2,"A",21);

SELECT * FROM student;
CREATE TABLE teacher (
 id INT PRIMARY KEY,
 name VARCHAR(50),
 salary INT 
 );
INSERT INTO teacher VALUES
(1,"XYZ",50000),
(2,"PQR",60000),
(3,"ABC",30000);
ALTER TABLE student ADD marks INT NOT NULL;
ALTER TABLE student ADD grade VARCHAR(1);
ALTER TABLE student ADD city VARCHAR(20);
ALTER TABLE student RENAME COLUMN id TO roll_no;
ALTER TABLE student DROP COLUMN age;
INSERT INTO student(roll_no,name,marks,grade,city) VALUES 
(101,"anil",78,"C","pune"),
(102,"bhumika",93,"A","mumbai"),
(103,"chetan",85,"B","mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"emanuel",12,"F","delhi"),
(106,"farah",82,"B","delhi");

DELETE FROM student WHERE roll_no=2;
SELECT roll_no,name FROM student WHERE marks>80 AND city="mumbai";
SELECT roll_no,name FROM student WHERE marks>80 OR city="mumbai";
SELECT roll_no,name,marks FROM student WHERE marks BETWEEN 80 AND 90;
SELECT roll_no,name,city FROM student WHERE city IN ("delhi","mumbai");
SELECT roll_no,name,city FROM student WHERE city NOT IN ("delhi","mumbai");
SELECT * FROM student LIMIT 3;
SELECT * FROM student ORDER BY grade ASC;
SELECT city,AVG(marks) FROM student GROUP BY city ORDER BY AVG(marks) ASC ;
SELECT grade,COUNT(name) FROM student GROUP BY grade ORDER BY COUNT(name) ASC ;
SELECT city,count(name) FROM student GROUP BY city HAVING MAX(marks)>80;





 





