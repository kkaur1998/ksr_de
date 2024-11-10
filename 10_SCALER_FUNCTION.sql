select * from ele_tb;

select region,country, upper(country), length(country) from ele_tb;
select country, round(sales,2) from ele_tb;

select region, country, round(sum(sales),2), round(sum(profit),2) from ele_tb
group by region,country order by region,country;

select region, country, round(sum(sales),2) as total_sales, round(sum(profit),2) as total_profit from ele_tb
group by region,country order by total_sales, total_profit desc ;

describe ele_tb;



select region, country, round(sum(sales),2) as total_sales, round(sum(profit),2) as total_profit from ele_tb
group by region,country order by 3, 4;
select orderdate,count(1) from ele_store1_tb 
group by orderdate
order by orderdate ;
select min(orderdate), max(orderdate) from ele_tb;

 #ALTER TABLE ele_tb MODIFY COLUMN orderdate date();

(select orderid, orderdate, rank() over(order by orderdate desc) from ele_store1_tb);
describe ele_tb;
select year(orderdate) as yr from ele_tb order by yr desc;
#alter table ele_tb add column order_date date;

#insert into ele_tb (order_date) values (select str_to_date(orderdate,'%d-%m-%Y') from ele_tb);
# UPDATE ele_tb SET orderdate = STR_TO_DATE(orderdate,'%d-%m-%Y');

select year(orderdate) from ele_tb;
describe ele_tb;
select * from ele_tb limit 2;


select *, ((total_sales-prev_yr)/prev_yr)*100 as yoy from 
(select yr, total_sales, lag(total_sales) over(order by yr) as prev_yr from
 (select year(orderdate) as yr, sum(sales) as total_sales 
from ele_tb
group by yr) y) z;

with cte as (select year(orderdate) as yr, sum(sales) as total_sales 
from ele_tb group by yr),
cte1 as (select yr, total_sales,lag(total_sales) over(order by yr) as prev_yr from cte),
cte2 as (select *, (total_sales-prev_yr)/prev_yr *100 as yoy from cte1)
select * from cte2;  

