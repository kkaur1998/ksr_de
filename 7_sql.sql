SET SQL_SAFE_UPDATES = 0;

select * from ksr_db.car_tb;
select Car_Name, Fuel_Type, Kms_Driven, Seller_Type from ksr_db.car_tb; 
select car_tb.Car_Name, car_tb.Fuel_Type, car_tb.Kms_Driven, car_tb.Seller_Type from ksr_db.car_tb;
select a.Car_Name, a.Fuel_Type, a.Kms_Driven, a.Seller_Type from ksr_db.car_tb a;



use ksr_db;


DROP TABLE IF EXISTS CUSTUMER_TB;
CREATE TABLE CUSTUMER_TB (
ID INT,
NAME VARCHAR(20),
AGE TINYINT,
ADDRESS VARCHAR(50),
WALLET_BAL FLOAT);

INSERT INTO CUSTUMER_TB VALUES (1, "RAMESH", 32, "ADMEDABAD", 200);
INSERT INTO CUSTUMER_TB VALUES (2, "KHILAN", 23, "DELHI", 7500);
INSERT INTO CUSTUMER_TB VALUES (3, "KAUSHIK", 25, "KOTA", 12000);
INSERT INTO CUSTUMER_TB VALUES (4, "CHAITALI", 22, "MUMBAI", 6500);
INSERT INTO CUSTUMER_TB VALUES (5, "HARDIK", 27, "BHOPAL", 6500);
INSERT INTO CUSTUMER_TB VALUES (6, "KOMAL", 26, "MP", 750);
INSERT INTO CUSTUMER_TB VALUES (7, "MUFFY", 27, "INDORE", 500);

DROP TABLE IF EXISTS ORDER_TB;
CREATE TABLE ORDER_TB (
OID INT,
DATE DATE,
C_ID VARCHAR(3),
AMOUNT FLOAT);


INSERT INTO ORDER_TB VALUES (102, "2009-10-08",'3', 3000);
INSERT INTO ORDER_TB VALUES (100, "2009-10-08", '3', 1500);
INSERT INTO ORDER_TB VALUES (101, "2009-11-20", '2', 1560);
INSERT INTO ORDER_TB VALUES (103, "2008-05-20", '4', 2060);
INSERT INTO ORDER_TB VALUES (199, "2020-05-20", '' ,9999);
select * from ksr_db.CUSTUMER_TB;
select * from ksr_db.ORDER_TB;

select a.name, a.address, b.oid, b.date from 
ksr_db.custumer_tb a inner join ksr_db.order_tb b
on a.id = b.c_id;

select a.name, a.address, b.oid, b.date from 
ksr_db.custumer_tb a left join ksr_db.order_tb b
on a.id = b.c_id;

select a.name, a.address, b.oid, b.date from 
ksr_db.custumer_tb a right join ksr_db.order_tb b
on a.id = b.c_id;

select a.name, a.address, b.oid, b.date from 
ksr_db.custumer_tb a left join ksr_db.order_tb b
on a.id = b.c_id
union #in union exclude duplicates
select a.name, a.address, b.oid, b.date from 
ksr_db.custumer_tb a right join ksr_db.order_tb b
on a.id = b.c_id;

select a.name, a.address, b.oid, b.date from 
ksr_db.custumer_tb a left join ksr_db.order_tb b
on a.id = b.c_id
union all #union all include duplicates... it is faster thn union, because in union, we r removing duplicates after union
select a.name, a.address, b.oid, b.date from 
ksr_db.custumer_tb a right join ksr_db.order_tb b
on a.id = b.c_id;

use ksr_db;
select * from car_tb limit 5;
select * from (select * from car_tb) a;
select car_tb.car_name, car_tb.kms_driven from ksr_db.car_tb;
select a.car_name, a.kms_driven from (select * from ksr_db.car_tb) a;



DROP TABLE IF EXISTS STUDENT_MARKS_TB;
CREATE TABLE STUDENT_MARKS_TB (
ID INT,
NAME VARCHAR(20),
MARKS INT);

INSERT INTO STUDENT_MARKS_TB VALUES(1, 'SANTHOSH',75);
INSERT INTO STUDENT_MARKS_TB VALUES(2, 'KIRAN',90);
INSERT INTO STUDENT_MARKS_TB VALUES(3, 'ARJUN',77);
INSERT INTO STUDENT_MARKS_TB VALUES(4, 'KARTHIK',97);
INSERT INTO STUDENT_MARKS_TB VALUES(5, 'RAJEV',65);
INSERT INTO STUDENT_MARKS_TB VALUES(6, 'GOPAL',65);
INSERT INTO STUDENT_MARKS_TB VALUES(7, 'TARUN',35);
INSERT INTO STUDENT_MARKS_TB VALUES(8, 'DIYA',99);

select * from ksr_db.student_marks_tb;
select * from ksr_db.student_marks_tb order by marks desc limit 1;
select * from ksr_db.student_marks_tb order by marks limit 1;
select * from (select * from ksr_db.student_marks_tb order by marks desc limit 4) a order by marks limit 1;


select * from ksr_db.car_tb limit 5;
select * from 
(select year, count(*) as total_cars from ksr_db.car_tb group by year) a
where total_cars>30;

select * from ksr_db.ele_tb limit 5;
select * from ( select country, sum(sales) as total_sales from ksr_db.ele_tb
group by country) a
where total_sales>100000;

select country, sum(sales) as total_sales from ksr_db.ele_tb
group by country  
having total_sales>100000;

