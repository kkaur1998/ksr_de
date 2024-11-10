# 1) Write a query to calculate the total records in both tables?
select count(1) from ksr_db.tata_tb1;
select count(1) from ksr_db.tata_tb2;

# 2) Write a query to calculate the total unique count of customers?
select count(distinct customername) from tata_tb1;

# 3) Write a query to fetch the oldest order date and latest order date? 
select max(orderdate) as newest_order_data,min(orderdate) as oldest_order_data from ksr_db.tata_tb1;

# 4) Write query to get years in table?
select distinct year(orderdate) from ksr_db.tata_tb1;

# 5) Write a query to get the no. of regions and display the region names?
select count(distinct region) as total_regions from tata_tb1;

# 6) Write a query to get the no. of countries and display the country names?
select count(distinct country) from tata_tb1;
select distinct country from tata_tb1;

# 7) Write a query to get the no. of states and display the state names?
select count(distinct state) as total_states from tata_tb1;
select distinct state from tata_tb1;

# 8) Write a query to get the no. of cities and display the city names?
select count(distinct city) as total_cities from tata_tb1;
select distinct city from tata_tb1;

# 9) Write a query to calculate the total count of customers?
select count(distinct customername) total_customers from tata_tb1;


# 10)Write a query to calculate the total count of products?
select count(distinct productname) as total_products from tata_tb2;

# 11)Write a query to calculate total sales, total profit and total order quantity?
select sum(sales) as total_sales, sum(profit) as total_profit, sum(orderquantity) as total_orderquantity from tata_tb2;

# 12)Write a query to calculate the total sales amount for each category. 
#Display the category, total sales, and total order qty and order by total sales from highest to lowest?
select category, sum(sales) as total_sales, sum(orderquantity) as total_orderqty 
from ksr_db.tata_tb2 
group by category
order by total_sales desc;

# 13)Write a query to calculate the total profit amount for each category. Display the 
select category, sum(profit) as total_profit 
from ksr_db.tata_tb2
group by category;

# category, total profit, and total order qty and order by total profit from highest to lowest?
select category, sum(profit) as total_profit, sum(orderquantity) as total_orderquantity
from ksr_db.tata_tb2
group by category
order by total_profit desc;

# 14)Write a query to fetch the subcategories where total sales are greater than 100000?
select subcategory, sum(sales) as total_sales
from tata_tb2
group by subcategory
having total_sales>100000;

# 15)Write a query to fetch the products where total profit is greater than 1000?
select ProductName, sum(profit) as total_profit from tata_tb2
group by ProductName
having total_profit>1000;

# 16)Write a query to get the total sales and total profit for Office Supplies category?
select sum(sales) as total_sales, sum(profit) as total_profit, 'Office Supplies' as category
from (select * from ksr_db.tata_tb2 where category = 'Office Supplies') a;

# 17)Write a query to get the total sales and total profit for Furniture category and the Tables
#and Bookcases sub-categories ?
select sum(sales) as total_sales, sum(profit),'Furniture' as category  from ksr_db.tata_tb2 
where category = 'Furniture' and subcategory in ('Tables', 'Bookcases');

# 18)Write a query to get the total sales and total profit for Technology category and the 
# Accessories, Copiers, Phones sub-categories ?
select sum(sales) as total_sales, sum(profit),'Technology' as category  from ksr_db.tata_tb2 
where category = 'Technology' and subcategory in ('Accessories','Copiers', 'Phones');

# 19)Write a query to get total sales and total profit by Region, Segment? 
select a.region, a.segment, sum(b.sales) as total_sales, sum(b.profit) as total_profit from 
tata_tb1 a inner join tata_tb2 b
on a.orderid=b.OrderID
group by region,segment;

select region,segment,sum(sales) as total_sales, sum(profit) as total_profit 
from (select a.region, a.segment, b.sales , b.profit from 
tata_tb1 a inner join tata_tb2 b
on a.orderid=b.OrderID) k 
group by region,segment;


# 20)Write a query to get total sales and total profit by Country, State and city? 
select a.country, a.state, a.city, sum(b.sales) as total_sales, sum(b.profit) as total_profit from 
tata_tb1 a inner join tata_tb2 b
on a.orderid=b.OrderID
group by country, state, city;


# 21)Write a query to get total sales and total orderqty by CustomerName sort it by totalsales 
#from highest to lowest? 
select a.customername, sum(b.sales) as total_sales, sum(b.orderquantity) as total_quantity 
from tata_tb1 a inner join tata_tb2 b
on a.orderid=b.OrderID
group by a.customername
order by total_sales desc;

# 22) Identify the top 5 products with the highest sales (by sales amount). Show the product 
#ame, total sales, and total qty?
select productname, sum(sales) as total_sales, sum(OrderQuantity) as total_quantity  from tata_tb2
group by productname
order by total_sales desc 
limit 5;

# 23)Write a query to get total sales by City having sales greater than 2000? 
select city,sum(sales) from tata_tb1 a,tata_tb2 b 
where a.orderid=b.orderid
group by city 
having sum(sales)>2000;

select a.city, sum(b.sales) as total_sales from 
tata_tb1 a inner join tata_tb2 b
on a.orderid=b.orderid
group by city
having total_sales>2000;

# 24)Write a query to get total sales by CustomerName having sales greater than 3000? 
# 25)Write a query to get total sales and total profit by shipmode? 
# 26)Write a query to get total sales for North and central region?
# 27)Write a query to get total sales and total profit for Italy and Spain countries? 
# 28)Write a query to get the total sales and total profit for each year?
# 29) Find the top 10 customers who spent the most across all transactions. Display the 
#customer name, total amount spent, and number of orders placed?
# 30)Write a query to find which products are most preferred by customers based on the 
#total sales. Display customer name, favorite product9 (top 3 products per each 
#customer), and total sales on that product?
# 31)Write a query to get 7th rank customer name based on total sales? Display customer 
#name, sales amount and rank.
# 32)Write query to get total sales and total profit between year 2011 and 2013?
# 33)Write a query to get total sales, total profit and total order qty by country, state, category 
#and sub-category?
# 34)Write stored procedure to get top 10 customers based on total sales?
# 35)Create a virtual table (view) by using OrderID, OrderDate, CustomerName, Region, 
#country, sales, profit and order qty?
# 36)Create a stored procedure to get region sales