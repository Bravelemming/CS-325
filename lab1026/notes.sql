/*
order by
---------
allows you to specify the order that a results rows will be displayed

(selects never change your data!  neither does its ORDER BY clause!)

should be used with an outermost select
and at least some sql implementations in temrs of syntax

simple form: follow ORDER BY with the name of the attribute whose value you wish the rows to be ordered by

by default, ASCending order
*/
select *
from empl
order by salary;

select *
from empl
order by hiredate;

-- you can order by an attribute you are not projecting!

select salary, empl_last_name
from empl
where job_title = 'Manager'
order by empl_last_name;

/* 
comma seperated listed, after first ORDER BY object you arrange, 
any ties are then arranged by the second comma seperated expression, 
and so on.
*/

select empl_last_name, job_title, mgr, hiredate
from empl
order by job_title, mgr, hiredate;

/*
when ordering by something that happens to contain NULL, those
rows tend to show up at the end.



*/

--nulls on bottom
select empl_last_name, job_title, commission
from empl
order by commission;

select * 
from empl 
order by mgr;

-- you can specify DESCending insteand of ASCending for each
--indvidual value.  DESC after column name.

select *
from empl 
order by salary desc;

select *
from empl 
order by job_title desc, mgr, hiredate desc;

--when we specify order, use order by clause!

/*
GROUP BY
-------
group rows that share some common characteristic
usually for aggregate functions
*/

select avg(salary)
from empl ;

select avg(salary)
from empl 
where job_title = 'Manager';

--what if you'd like the average salary for each value of job title
--even if you don't know what those values are

select avg(salary)
from empl 
group by job_title;

--...but which value belongs to which row?

--when you are using group by, you are allowed to project only
--aggregate computations on the group OR that attribute(s)
--being grouped by

select job_title, avg(salary)
from empl 
group by job_title;

--FAILURE EXMPLE
prompt fails.  with group by you cannot project attributes you dont group
select job_title, mgr, avg(salary)
from empl 
group by job_title;
--

--make sure it is clear to you: the FROM and WHERE clauses
--are done before the group by;
--consider

select dept_name, avg(salary)
from empl e, dept d 
where e.dept_num = d.dept_num
group by dept_name
order by avg(salary);
--


prompt FAILS with group by you cannot project outside group by
select d.dept_num dept_name, avg(salary)
from empl e, dept d 
where e.dept_num = d.dept_num
group by dept_name 
order by avg(salary);

--you CAN have a comma seperated list of attributes after group by

select d.dept_num dept_name, avg(salary)
from empl e, dept d 
where e.dept_num = d.dept_num
group by dept_name, d.dept_num
order by avg(salary);


--returns number of rows selected or in that group
select job_title, mgr, avg(salary), count(*)
from empl 
group by job_title, mgr;

--you can use a group by in a nested select

select empl_last_name, salary
from empl 
where salary >=
		(select min(avg(salary)) 
		from empl 
		group by dept_num);


--remember, order by should ONLY be used in an outer
--	select

prompt THIS FAILS, order by in a subselect doesnt work
select *
from empl 
where salary > 
		(select min(salary)
			from empl 
			where job_title = 'Manager'
			order by salary);
--works
select *
from empl 
where salary > 
		(select min(salary)
			from empl 
			where job_title = 'Manager')
order by salary;

/*
HAVING
--------
helps and only works with GROUP BY

HAVING lets you specify that you only want to see gorups
that have some particular condition

HAVING is to groups
as  WHERE is to rows

having lets you 'select' which groups you want
*/

select dept_num, avg(salary)
from empl 
group by dept_num
having avg(salary) > 1600;

-- remember, where is pre group
--FAILS
prompt fails: you are dealing with rows
select dept_num, avg(salary)
from empl 
where avg(salary) > 1600
group by dept_num;

--
















