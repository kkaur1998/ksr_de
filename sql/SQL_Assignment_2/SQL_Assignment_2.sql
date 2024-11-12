#1. Query all rows from Department table?
select * from ksr_db.department_tb;

# 2. Change the name of department with id = 1 to 'Management'?
set SQL_SAFE_UPDATES=0;
update ksr_db.department_tb set name='Management' where id=1;

# 3. Delete employees with salary greater than 100000?
delete from ksr_db.employee_tb where salary>100000;

# 4. Query the names of companies?
select name from ksr_db.company_tb;

# 5. Query the name and city of every employee?
select name, city from ksr_db.employee_tb;

# 6. Query all companies with revenue greater than 5000000?
select * from ksr_db.company_tb where revenue>5000000;

# 7. Query all companies with revenue smaller than 5000000?
select * from ksr_db.company_tb where revenue<5000000;

# 8. Query all companies with revenue smaller than 5000000, but you cannot use the '<' operator?
select * from ksr_db.company_tb 
where revenue not in (select revenue from ksr_db.company_tb where revenue>=5000000);
select revenue from ksr_db.company_tb where not revenue>=5000000;

# 9. Query all employees with salary greater than 50000 and smaller than 70000?
select * from ksr_db.employee_tb where salary between 50000 and 70000;

# 10. Query all employees with salary greater than 50 000 and smaller than 70 000, but you cannot use BETWEEN?
select * from ksr_db.employee_tb where salary>50000 and salary<70000;
select * from (select * from ksr_db.employee_tb where salary>50000 and salary<70000) a;

# 11. Query all employees with salary equal to 80000?
select * from ksr_db.employee_tb where salary=80000;

# 12. Query all employees with salary not equal to 80000?
select * from ksr_db.employee_tb where salary!=80000;

# 13. Query all departments (each name only once)?
select distinct name from ksr_db.department_tb;

# 14. Query names of all employees together with id of department they work in, but you cannot use JOIN?
select a.name,b.name from ksr_db.employee_tb a, ksr_db.department_tb b
where a.department_id=b.id;

# 15. Query names of all employees together with id of department they work in, using JOIN?
select a.name,b.name
from ksr_db.employee_tb a left join ksr_db.department_tb b
on a.department_id = b.id;


# 16. Query name of every company together with every department?

select a.name as company,b.name
from ksr_db.company_tb a,ksr_db.department_tb b
order by company;
#on a.department_id = b.id;

# 17. Query employee name together with the department name that they are not working?
select a.name, b.name from ksr_db.employee_tb a,ksr_db.department_tb b
where a.department_id<>b.id;


# 18. Query names of every company and change the name of column to 'Company'?
select name from ksr_db.company_tb ;
alter table ksr_db.company_tb 
rename column name to company;
alter table ksr_db.company_tb 
rename column company to name;

# 19. Query the city wise salary?
 select city,sum(salary) as total_salary from ksr_db.employee_tb
 group by city;

# 20. Query the highest revenue company name
select name,revenue from ksr_db.company_tb order by revenue desc limit 1;
