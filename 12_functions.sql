delimiter $$
create function calculate_profit(
cp float,
sp float
)
returns int
deterministic #specific to mysql- for sync between input and output
begin 
declare profit int;
set profit = sp-cp;
return profit;
end
$$

select calculate_profit(150,180);  #function mostly for mathematical calculations

delimiter $$
create function calculate_age_group(
age int
)
returns varchar(20)
deterministic #specific to mysql- for sync between input and output
begin 
declare cust_age_group varchar(20);
if age<=18 then set cust_age_group='teen';
elseif age<=45 and age>=19 then set cust_age_group='adult';
elseif age>45 then set cust_age_group='senior citizen';
end if;
return(cust_age_group);
end
$$

select customerOccupation(55);  

select *,calculate_age_group(age) from cust_info limit 5;

