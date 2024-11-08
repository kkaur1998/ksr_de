SELECT * FROM CAR_TB;
#CAR MODEL OF 2014 #FUEL=PETROL
SELECT * FROM CAR_TB WHERE YEAR=2014;
SELECT * FROM CAR_TB WHERE YEAR=2014 AND FUEL_TYPE='Petrol' AND TRANSMISSION='Automatic';

SELECT CAR_NAME, YEAR, SELLING_PRICE, KMS_DRIVEN, TRANSMISSION
FROM CAR_TB WHERE YEAR=2015 
AND FUEL_TYPE='Petrol' 
AND TRANSMISSION='Automatic';

SELECT CAR_NAME, YEAR, SELLING_PRICE, KMS_DRIVEN, TRANSMISSION
FROM CAR_TB WHERE YEAR IN (2015, 2016)
AND FUEL_TYPE='Petrol' 
AND TRANSMISSION='Automatic';

SELECT DISTINCT FUEL_TYPE FROM CAR_TB;

SELECT COUNT(FUEL_TYPE) AS TOTAL, FUEL_TYPE FROM CAR_TB GROUP BY FUEL_TYPE;

SELECT * FROM CAR_TB 
WHERE SELLING_PRICE = 
(SELECT MAX(SELLING_PRICE) FROM CAR_TB);

SELECT * FROM CAR_TB ORDER BY SELLING_PRICE DESC LIMIT 5;

select COUNT(*) from CAR_TB
WHERE YEAR=2014;

SELECT COUNT(*) FROM CAR_TB;

SELECT COUNT(*) FROM CAR_TB WHERE FUEL_TYPE='Petrol';

SELECT COUNT(DISTINCT FUEL_TYPE) FROM CAR_TB;

SELECT DISTINCT YEAR FROM CAR_TB;
SELECT COUNT(DISTINCT YEAR) FROM CAR_TB;


SELECT MIN(YEAR) FROM CAR_TB;
SELECT DISTINCT YEAR FROM CAR_TB ORDER BY YEAR;
SELECT MAX(YEAR) FROM CAR_TB;

SELECT COUNT(1) FROM CAR_TB WHERE TRANSMISSION='Automatic';
SELECT COUNT(1) FROM CAR_TB WHERE TRANSMISSION='mANUAL';

SELECT YEAR,MIN(KMS_DRIVEN),MAX(KMS_DRIVEN) FROM CAR_TB GROUP BY YEAR;
SELECT * FROM CAR_TB WHERE YEAR=2004;

SELECT * FROM CAR_TB WHERE YEAR IN (2014,2015);
SELECT * FROM CAR_TB WHERE FUEL_TYPE IN ('Diesel','Petrol');
SELECT * FROM CAR_TB WHERE FUEL_TYPE not IN ('Diesel','Petrol');

SELECT * FROM CAR_TB WHERE TRANSMISSION != 'mANUAL';
SELECT * FROM CAR_TB WHERE YEAR>2014 AND YEAR<2018;
SELECT * FROM CAR_TB WHERE YEAR>=2014 AND YEAR<=2018;
SELECT * FROM CAR_TB WHERE YEAR BETWEEN 2014 AND 2018;

SELECT COUNT(*),YEAR FROM CAR_TB  GROUP BY YEAR;
SELECT COUNT(*),YEAR FROM CAR_TB WHERE FUEL_TYPE='pETROL' GROUP BY YEAR ;
SELECT COUNT(*),YEAR FROM CAR_TB WHERE FUEL_TYPE='pETROL' GROUP BY YEAR ORDER BY COUNT(*) DESC;

SELECT TRANSMISSION, COUNT(*) FROM CAR_TB GROUP BY TRANSMISSION;

SELECT TRANSMISSION, FUEL_TYPE, COUNT(*) FROM CAR_TB GROUP BY TRANSMISSION, FUEL_TYPE;

SELECT COUNT(DISTINCT YEAR) FROM CAR_TB;

SELECT TRANSMISSION,COUNT(1) FROM CAR_TB GROUP BY TRANSMISSION;
