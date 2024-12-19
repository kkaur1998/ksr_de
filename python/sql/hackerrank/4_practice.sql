use ksr_db;
create table sales_cum 
(
date date,
sales bigint
);

insert into sales_cum values
('2023-05-01',	100),
('2023-05-02',	200),
('2023-05-03',	150);

select * from sales_cum;

with cte as (select date, year(date) as yr , sales, lag(sales) over(order by date asc) as yoy_sales from sales_cum)
select date, sales, sales+yoy_sales as cum_sales from cte;

#Find the cumulative sum of sales for each employee.
select * from employee_tb;
select * from tata_tb2;
select ProductName, sales from tata_tb2 order by productname;
select productname, sales , sales+p_sales from (select productname, sales, lag(sales) over(partition by productname) as p_sales 
from tata_tb2) a;

#Rank product based on their sales within their category.
select * from tata_tb1;

with cte as (select category, productname, sum(sales) as sales from tata_tb2 group by productname,category),
cte1 as (select *, dense_rank() over(partition by category order by sales desc) as rnk from cte)
select * from cte1 where rnk<=5;

#Calculate a running total of orders by order date.
select  orderdate, sales, month(orderdate) as mon,year(orderdate) as yr,lag(sales) over(partition by month(orderdate),year(orderdate) order by orderdate)  as dod from 
 (
select orderdate, sales from tata_tb1 a
inner join tata_tb2 b on a.orderid=b.orderid
) k
;

#select category, productname, sum(sales) over(order by productname) from tata_tb2; - this is wrong just wanted to try


#Identify the top three salaries in each department.

with cte as (select category, productname, sum(sales) as sales from tata_tb2 group by productname,category),
cte1 as (select *, dense_rank() over(partition by category order by sales desc) as rnk from cte)
select * from cte1 where rnk<=3;

#Compute the difference between the current and previous month's sales.
with cte as (select month(orderdate) as mon, year(orderdate) as yr,sum(sales) as monthly_sales from tata_tb1 a
inner join tata_tb2 b on a.orderid=b.orderid
group by mon,yr),
cte1 as (select mon, yr, monthly_sales, lag(monthly_sales) over(partition by yr order by mon) as prv_sales from cte),
cte2 as (select mon, yr, monthly_sales, prv_sales, monthly_sales-prv_sales from cte1) 
select * from cte2; 


#Write a recursive CTE to generate a sequence of numbers from 1 to 100.
with numcte as ( 
select 1 as num
union all
select num+1 from numcte
where num<=100
)
select * from numcte;


with RECURSIVE u (n) as (
    select 1 
    union all
    select n + 1 from u where n < 101
)
select * from u;

WITH RECURSIVE cte (n, dt) AS (
    SELECT 1, '2019-09-20'
    UNION ALL
    SELECT n + 1, TIMESTAMPADD(DAY, n, '2019-09-20') FROM cte WHERE n <= 5
)

SELECT * FROM cte;

#2. Use a CTE to find employees who directly and indirectly report to a specific manager.
select a.emp_id, a.name, b.name from emp_mg a left join emp_mg b
on a.manager=b.emp_id;

#. Calculate the factorial of a number using a recursive CTE.
with recursive cte (fact, n) as (
	select 1,1
    union all
    select n+1, (n+1)*fact
    from cte
    where n<5
)
select * from cte;




