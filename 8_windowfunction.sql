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

select name, salary, rown from 
(select name, salary, department_id, row_number() over(order by salary desc) rown from employee_tb) a;

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

select * from student_marks_tb_1;
select * from (select name,medium,marks,dense_rank() over(partition by medium order by marks desc) as rnk from student_marks_tb_1)a;

drop table if exists window_func;
create table window_func (
year int,
sales bigint
);
insert into window_func values
(2020, 15000),
(2021, 18000),
(2022, 14500),
(2023, 32000),
(2024, 33000);

select *, ((sales-prev_sales)/prev_sales)*100 as yoy_sales
 from (select *, lag(sales) over(order by year) as prev_sales from window_func) a;

select *, lead(sales) over(order by year desc) as next_year_sales from window_func;

select *, lag(sales,1) over(order by year) as next_year_sales from window_func;

DROP TABLE IF EXISTS WINDOWS_FUNc1;
CREATE TABLE WINDOWS_FUNc1(
S_YEAR INT,
S_PRODUCT VARCHAR(20),
T_SALES INT );

INSERT INTO WINDOWS_FUNc1 (S_YEAR,S_PRODUCT,T_SALES) VALUES
(2015,'IPHONE', 23000),(2016,'IPHONE',25000),(2017,'IPHONE',34000),(2018,'IPHONE',32000), (2019,'IPHONE',33000),
(2015,'SAMSUNG',21000),(2016,'SAMSUNG',20000),(2017,'SAMSUNG',31500),(2018,'SAMSUNG',29750), (2019,'SAMSUNG',24500)
;

select * from windows_func1;

select s_year, s_product, ((t_sales-prev_year)/prev_year)*100 as growth_percent from 
(select *,lag(t_sales) over (partition by s_product order by s_year) as prev_year from windows_func1) p
;

