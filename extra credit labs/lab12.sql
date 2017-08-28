--Jack Daniel Kinne
-- 12.1.16

spool "lab12-results.txt"

prompt Jack Daniel Kinne

prompt lab problem 1

	update empl
	set commission = 10
	where job_title = 'Manager';

	select * 
	from empl;

prompt lab problem 2

	delete from empl
	where job_title = 'Clerk';

	select * 
	from empl;

prompt Lab Promblem 3

	drop view empl_salaries;

	create view empl_salaries as
	select salary
	from empl;

prompt Lab Promblem 4

	select *
	from empl_salaries;

prompt Lab Promblem 5

	select max(salary)
	from empl_salaries; 

prompt Lab Promblem 6

	drop view earliest_hires;

	create view earliest_hires as
	select job_title, min(HIREDATE) "Earliest Hires"
	from empl
	group by job_title;

prompt Lab Promblem 7

	select * 
	from earliest_hires;

prompt Lab Promblem 8

	select max("Earliest Hires") max
	from earliest_hires;

spool off