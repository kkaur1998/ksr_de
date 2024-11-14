select * from tata_tb1 limit 5;
with cte as (select city, length(city) as len, row_number() over(order by length(city),city asc) as rnk from tata_tb1)
select * from cte