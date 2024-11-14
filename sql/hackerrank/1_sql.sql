select * from tata_tb1 limit 5;
with cte as (select city, length(city) as len, row_number() over(order by length(city),city asc) as rnk from tata_tb1)
select * from cte;

#bst
create table bst (
N int,
P int);
select * from bst;
insert into bst values
(1, 2),
(3, 2),
(5, 6),
(7, 6),
(2, 4),
(6, 4),
(4, 15),
(8, 9),
(10, 9),
(12, 13),
(14, 13),
(9, 11),
(13, 11),
(11, 15),
(15, NULL);


select N,CASE WHEN P IS NULL THEN "ROOT" 
when N in (select distinct P from bst) then 'inner' else 'leaf'
end as op from bst;
select * from bst;

select N,case when P is null then "Root" 
when N in(select distinct(P) from BST) then "Inner" 
else " Leaf" end
from BST order by N;

#Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, 
#total number of senior managers, total number of managers, and
# total number of employees. Order your output by ascending company_code.

select count(1) from 