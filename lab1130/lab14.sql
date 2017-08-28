--Jack Daniel Kinne, Sam Alston
-- 11.30.16

spool lab14-results.txt

prompt Jack Daniel Kinne, Sam Alston
prompt Lab Problem 1

select empl_last_name, to_char(hiredate, 'Day')
from empl;

prompt Lab Problem 2
select upper(substr(empl_last_name, 1, 4))
from empl;

prompt Lab Problem 3
select 	empl_last_name, 
		hiredate, 
		add_months(hiredate, 3) as "ELIG_DATE"
from empl;
	

spool off