SET AUTOCOMMIT=0;  #WAIT FOR MY PERMISSION TO GO TO SERVER
#UNTIL I DO COMMIT NO CHANGES WILL BE IN SERVER
SET SQL_SAFE_UPDATES = 0;
USE KSR_DB;
create table tcl_tb(
ID INT,
NAME CHAR(20),
AGE INT);

INSERT INTO TCL_TB VALUES (4,"SARAB",25);
INSERT INTO TCL_TB VALUES (5,"KK",95);
INSERT INTO TCL_TB VALUES (6,"SUKH",27);
SELECT * FROM TCL_TB;


ALTER TABLE TCL_TB DROP COLUMN COMPANY;

#1ST CASE
START TRANSACTION; #START OF CODE
SELECT * FROM TCL_TB;
DELETE FROM TCL_TB;
ROLLBACK;
SELECT * FROM TCL_TB;

#2ND CASE

START TRANSACTION;
DELETE FROM TCL_TB WHERE NAME="PARM";
SELECT * FROM TCL_TB;
ROLLBACK;
SELECT * FROM TCL_TB;

#3RD CASE

START TRANSACTION;
UPDATE TCL_TB SET AGE=99 WHERE NAME="KAMAL";
SELECT * FROM TCL_TB;
ROLLBACK;
SELECT * FROM TCL_TB;

#4TH CASE
START TRANSACTION;
SAVEPOINT A;
INSERT INTO TCL_TB VALUES (4,"SARAB",25);
INSERT INTO TCL_TB VALUES (5,"SUKH",27);
SELECT * FROM TCL_TB;
SAVEPOINT B;
UPDATE TCL_TB SET AGE=99 WHERE NAME="KAMAL";
SELECT * FROM TCL_TB;
ROLLBACK TO B;
SELECT * FROM TCL_TB;

#5TH CASE
START TRANSACTION;
SELECT * FROM TCL_TB;
SAVEPOINT M;
#ALTER TABLE TCL_TB DROP COLUMN COMPANY;
ALTER TABLE TCL_TB ADD COLUMN COMPANY CHAR(20);
SELECT * FROM TCL_TB;
SAVEPOINT Y;
UPDATE TCL_TB SET COMPANY='TCS';
SELECT * FROM TCL_TB;
SAVEPOINT Z;
SELECT * FROM TCL_TB;
ROLLBACK TO M;

#6TH CASE
START TRANSACTION;
SELECT * FROM TCL_TB;
SAVEPOINT K;
#ALTER TABLE TCL_TB DROP COLUMN COMPANY;
UPDATE TCL_TB SET AGE=24 WHERE NAME='KAMAL';
COMMIT; #TIS IS 100% CORRECT, GO TO SERVER
UPDATE TCL_TB SET AGE=24 WHERE NAME='BUBBY';
SELECT * FROM TCL_TB;
SAVEPOINT K1;

ROLLBACK TO K;
SELECT * FROM TCL_TB;
#ROLLBACK DOES NOT WORK ON DDL - CREATE,DROP,ALTER ----NO ONE CAN
#AFTER COMMIT - ROLLBACK CAN'T RECOVER