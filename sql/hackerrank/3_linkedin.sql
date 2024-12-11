SELECT c.customerid, c.firstname, c.lastname, sum(price) as totalspend
from Customers c 
left join Orders o on c.CustomerID=o.CustomerID
left join OrdersDishes d on o.OrderID=d.OrderID
left join dishes s on d.DishID=s.DishID
group by c.customerid
having totalspend > 450
order by totalspend desc;


-- SQL request(s)​​​​​​‌‌​​​​‌‌‌‌​‌‌‌​​‌‌​‌‌​​​​ below
SELECT o.orderid, group_concat(s.name order by s.name) as items
from orders o 
left join ordersdishes d on o.orderid=d.orderid
left join dishes s on d.dishid=s.dishid
where o.orderdate>'2022-05-01'
group by o.orderid;


-- SQL request(s)​​​​​​‌‌​​​​‌‌‌‌​‌‌‌​‌‌​‌‌​​​​​ below
select count(orderid) as numsold, day from (SELECT o.orderid, cast(o.orderdate as date) as day
from orders o 
left join ordersdishes d on o.orderid=d.orderid
left join dishes s on d.dishid=s.dishid
where s.name like '%Handcrafted Pizza') a 
group by day;


-- SQL request(s)​​​​​​‌‌​​​​‌‌‌‌​‌‌‌​‌‌​‌‌​‌‌‌​ below
SELECT Name , Price as OriginalPrice,
case
when price<7 then '5%'
when price between 7 and 10 then '10%'
when price>10 then '15%'
end as DiscountPercent,
round(case 
when price<7 then price-(price*0.07)
when price>=7 and price<=10 then price-(price*0.1)
when price>10 then price-(price*0.15)
end,2) as DiscountedPrice
from dishes
order by name;

-- SQL request(s)​​​​​​‌‌​​​​‌‌‌‌​‌‌‌‌​​‌​‌​‌‌‌‌ below
SELECT lpad(employeeid,5,0) as id, 
concat(lastname,', ',firstname ) as name,
lower(concat(
    substr(firstname,1,1), '', substr(lastname,1,7)
)) as login
, concat(username,'@nadias-garden.com') as email
FROM Employees
order by name;


