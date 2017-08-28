--Jared Conn
--Jack Daniel Kinne
--lab 8 10/12/2016

spool lab8-results.txt

prompt Jared Conn and Jack Daniel Kinne

prompt lab query 1
-- last name and hire date of lowest paid manager

select empl_last_name, hiredate
from empl 
where job_title = 'Manager' 
	and salary = (select min(salary)
				from empl 
				where job_title = 'Manager');

--
prompt lab query 2
-- hiredates of employes whose department location is NY
select hiredate
from empl 
where dept_num in ( (select dept_num
					from dept 
					where dept_loc = 'New York') );

spool off
