select * from car_tb;
#give me how many cars are with and how many are with automatic in 2014
select transmission, count(1) from car_tb 
where year=2014
group by transmission
order by transmission;

select transmission, count(1) from car_tb 
where year=2015
group by transmission
order by transmission;

select year,transmission, count(1) from car_tb 
group by year,transmission
order by year;

Delimiter $$
#can write anything--until $$ keep executing commands
create procedure gettransmissioncountcars(
in yr int #in stands for input
)
Begin
select transmission, count(1) from car_tb 
where year=yr
group by transmission
order by transmission;
end
$$

call gettransmissioncountcars(2014);
delimiter $$
create procedure getalldatacars2015(
in yr int)
begin
select * from car_tb 
where year=yr;
end
$$
call getalldatacars2015(2015);

#wrt channel, sum profit, sum sales, 

delimiter $$
create procedure aggregationelerorcountryandyer(
in ctry char(20),
yr int)
begin
select year(orderdate) as yer,COUNTRY, sum(sales) as total_sales,sum(profit) as total_profit,sum(orderqty) as total_orderqty
from ele_tb 
where country=ctry and year(orderdate)=yr
group by yer,country
order by yer desc;
end
$$


CALL aggregationelerorcountryandyer("UNITED STATES",2018);

delimiter !!
create procedure get_channel_sales_profit(
in counry char(20))
begin
select channel, sum(sales) as total_sales, sum(profit) as total_profit
from ele_tb
where country=counry
group by channel;
end
!!

call get_channel_sales_profit('United states');

call get_channel_sales_profit('Germany');

delimiter &&
create procedure customer_status(
in v_id int,
out v_status varchar(20)
)
begin
declare purchase int default 0;
select sum(sales) into purchase from sales
where user_id=v_id
group by user_id;
if purchase>10000 then
set v_status = 'PLATINUM';
elseif purchase<=5000 then
set v_status = 'SILVER';
else
set v_status= 'GOLD';
end if;
end
&&

select * from sales_info limit 5;
call(1,@v_status);
select @v_status;

#top 5 year with highest car count
select year, count(1) as total_cars from car_tb
group by year
order by total_cars desc limit 5;

select *, dense_rank() over(order by total_cars desc) from (select year, count(1) as total_cars from car_tb
group by year
order by total_cars desc) a;

delimiter $$
create procedure top5carscount()
begin
with cte1 as (select year, count(1) as total_cars from car_tb group by year order by total_cars desc),
cte2 as (select *, dense_rank() over(order by total_cars desc) rnk from cte1)
select * from cte2 where rnk<=5;
end
$$

call top5carscount();