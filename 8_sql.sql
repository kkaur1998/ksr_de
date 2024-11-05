use ksr_db;
select * from student_marks_tb;

select id, name, marks, rank() over (order by marks desc) rnk from student_marks_tb;

select id,name, rnk from (select id, name, marks, 
rank() over (order by marks desc) rnk 
from student_marks_tb) a
where rnk=4;

select id, name, marks, dense_rank() over (order by marks desc) rnk from student_marks_tb;

select id, name, marks, row_number() over (order by marks desc) rnk from student_marks_tb;

DROP TABLE IF EXISTS STUDENT_MARKS_TB_1;
CREATE TABLE STUDENT_MARKS_TB_1 (
ID INT,
NAME VARCHAR(20),
MEDIUM VARCHAR(20),
MARKS INT);

INSERT INTO STUDENT_MARKS_TB_1 VALUES(1, 'SANTHOSH','ENGLISH',75);
INSERT INTO STUDENT_MARKS_TB_1 VALUES(2, 'KIRAN','KANNADA',90);
INSERT INTO STUDENT_MARKS_TB_1 VALUES(3, 'ARJUN','KANNADA',77);
INSERT INTO STUDENT_MARKS_TB_1 VALUES(4, 'KARTHIK','ENGLISH',97);
INSERT INTO STUDENT_MARKS_TB_1 VALUES(5, 'RAJEV','ENGLISH',65);
INSERT INTO STUDENT_MARKS_TB_1 VALUES(6, 'GOPAL','KANNADA',65);
INSERT INTO STUDENT_MARKS_TB_1 VALUES(7, 'TARUN','ENGLISH',35);
INSERT INTO STUDENT_MARKS_TB_1 VALUES(8, 'DIYA','KANNADA',99);

select * from student_marks_tb_1;

select id, name, medium, marks, dense_rank() over(order by marks) from student_marks_tb_1 rnk
where medium = 'english'
union
select id, name, medium, marks, dense_rank() over(order by marks) from student_marks_tb_1 rnk
where medium = 'kannada';

select id, name, medium, marks, dense_rank() over(partition by medium order by marks desc) rnk from student_marks_tb_1 rnk;

#3rd highest rank student
select * from employee_tb;
select name, salary from 
(select name, salary, department_id, dense_rank() over(order by salary desc) rnk from employee_tb) a
where rnk=3;
#2ND HIGHEST
select name, department_id, salary from 
(select name, salary, department_id, dense_rank() over(partition by department_id order by salary desc) rnk from employee_tb) a
where rnk=2;

select * from employee_tb where salary in (select  max(salary) from employee_tb group by department_id); 