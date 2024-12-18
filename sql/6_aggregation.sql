SELECT * FROM ELE_TB;

SELECT COUNT(DISTINCT COUNTRY) FROM ELE_TB;
SELECT REGION, SUM(SALES) AS TOTAL_SALES, AVG(PROFIT) AS AVG_PROFIT FROM ELE_TB
WHERE CHANNEL='STORE' GROUP BY REGION ;

SELECT COUNTRY, SUM(SALES) AS TOTAL_SALES FROM ELE_TB
GROUP BY COUNTRY;

SELECT COUNTRY, SUM(SALES) AS TOTAL_SALES FROM ELE_TB
WHERE CHANNEL='STORE'
GROUP BY COUNTRY;

SELECT REGION, CHANNEL, SUM(SALES) AS TOTAL_SALES
FROM ELE_TB 
GROUP BY REGION, CHANNEL
ORDER BY REGION,TOTAL_SALES DESC;

SELECT REGION, SUM(SALES), SUM(PROFIT) FROM ELE_TB 
GROUP BY REGION;

SELECT REGION, SUM(SALES), AVG(PROFIT) FROM ELE_TB 
WHERE CHANNEL='STORE'
GROUP BY REGION;

#HOW MANY ORDERS PLACED  ONLINE BY EACH COUNTRY, ORDER BASED ON TOTAL_ORDERS
SELECT COUNTRY, COUNT(1) AS TOTAL_ORDERS FROM ELE_TB 
WHERE CHANNEL='ONLINE' 
GROUP BY COUNTRY 
ORDER BY TOTAL_ORDERS DESC;

SELECT COUNTRY, COUNT(1) AS TOTAL_ORDERS FROM ELE_TB 
WHERE CHANNEL='STORE' 
GROUP BY COUNTRY 
ORDER BY TOTAL_ORDERS DESC;

#NEED AVG PROFIT AND TOTAL QTY FOR EACH REGION FR STORE AND ONLINE, EACH COUNTRY ALSO
SELECT REGION, COUNTRY, AVG(PROFIT), SUM(ORDERQTY)
FROM ELE_TB 
WHERE CHANNEL IN ('STORE','ONLINE') 
GROUP BY REGION, COUNTRY
ORDER BY REGION, COUNTRY, AVG(PROFIT);


SELECT * FROM CAR_TB;
SELECT YEAR, COUNT(1) AS TOTAL_CARS FROM CAR_TB 
GROUP BY YEAR;

SELECT YEAR, COUNT(1) AS TOTAL_CARS FROM CAR_TB 
GROUP BY YEAR
ORDER BY TOTAL_CARS DESC;

SELECT YEAR, COUNT(1) AS TOTAL_CARS FROM CAR_TB 
GROUP BY YEAR
HAVING TOTAL_CARS>=30;

