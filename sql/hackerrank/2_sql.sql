use company_db;
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
count(lead_manager_code),count(senior_manager_code),count(manager_code),count(employee_code) from cte
group by company_code,founder;     