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