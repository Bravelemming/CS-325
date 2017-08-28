-- nested select in a where clause

select empl_last_name
from empl
where empl_num IN
	(select mgr
	from empl
	where job_title = 'Clerk'
			and salary =
					(select max(salary)
					from empl
					where job_title = 'Clerk'));


select empl_last_name
from empl
where job_title = 'Clerk'
	and salary = (select max(salary)
					from empl
					where job_title = 'Clerk');

select empl_last_name, dept_name
from (select empl_last_name e.name, dept_name d.name
		from empl e, dept d
		where e.dept_num = d.dept_num)
where dept_name = 'Sales';

