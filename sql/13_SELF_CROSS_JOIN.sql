select a.id,a.name,b.income,c.manager from table1 a join table2 b on a.id=b.emp_id
inner join
table3 c on b.mg_id=c.id;


create table emp_mg (
emp_id int,
name varchar(20),
manager int
);

insert into emp_mg values
(1, 'RAMAN',5),
(2, 'SARAB',5),
(3, 'PARAM',5),
(4,'KAMAL',5),
(5,'SANTHOSH',6),
(6,'MAHESH',NULL);



select a.emp_id, a.name, b.name from emp_mg a left join emp_mg b
on a.manager=b.emp_id; 