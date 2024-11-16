# company_cod, founder, total number of working (lead_manager, manager, sr_manager and employees

#use company_db;
with cte as (select c.company_code,founder , l.lead_manager_code,s.senior_manager_code, m.manager_code,e.Employee_code from company c 
left join lead_manager l
on c.company_code=l.company_code
left join senior_manager s 
on s.lead_manager_code=l.lead_manager_code
left join manager m
on s.senior_manager_code=m.senior_manager_code
left join employee e
on e.manager_code=m.manager_code)
select company_code, founder,
count(distinct lead_manager_code),count(distinct senior_manager_code),count(distinct manager_code),count(distinct employee_code) from cte
group by company_code,founder
order by company_code;     


#median of lat_n rounded by 4
select round(lat_N,4) from (select *, dense_rank() over (order by lat_n) as rnk from station ) a
 where rnk = (select round(count(1)/2) from station)