
--Jack Daniel Kinne
--CS 325 - Fall 2016
--12.8.16

spool 325query-results.txt
prompt Jack Daniel Kinne
prompt
prompt 1. who is an employee who is from a planet 
prompt that is the planned target of a DLE, and whats their job?

col EM_position heading Title format a26

select EM_first_name || ' ' || EM_last_name as Employee,
		planet.PLANET_NAME "Planet Name",
		EM_position
from employee, planet, destruction_level_event 
where employee.PLANET_NAME = planet.PLANET_NAME
and planet.PLANET_NAME = destruction_level_event.dle_target_planet
order by EM_first_name;
 
--COMPLETE
prompt 2. who has never chaired a meeting 
prompt or directed a DLE, but received a promotion?

select EM_last_name, EM_first_name, EM_typeof, PRO_ID
from employee, meeting, destruction_level_event, promotion
where employee.EM_ID = destruction_level_event.dle_administrator
and meeting.meet_chaired_by = employee.EM_ID
and promotion.em_id = employee.EM_ID
order by EM_last_name, PRO_ID; 

--COMPLETE

prompt 3. which employees came from a rebel aligned planet, specifically, 
prompt and havent been promoted in their career?

select distinct EM_first_name || ' ' || EM_last_name as Employee,
		planet.PLANET_NAME "Planet",
		affiliation
from employee, promotion, planet
where employee.EM_ID != promotion.EM_ID
and employee.PLANET_NAME = planet.PLANET_NAME
and planet.affiliation IN 'rebel';

--COMPLETE

prompt 4. who attended a skip level meeting to see the boss?

select EM_first_name, EM_last_name, EM_typeof,
		meet_chaired_by,
		meet_skip_level
from employee, meeting, meeting_with_employees
where meeting.MEET_ID = meeting_with_employees.meet_id
and employee.em_id = meeting_with_employees.em_id
and meet_skip_level = 'y';

--COMPLETE
 
prompt 5. which employees of the month have never attended a meeting?

select distinct EM_first_name, EM_last_name, EM_typeof,
	EOTM_month, EOTM_year
from employee, employee_of_the_month, 
	meeting_with_employees
where employee.em_id  != meeting_with_employees.em_id
and employee_of_the_month.em_id = employee.em_id;

--COMPLETE

prompt 6. which emplolyees declined to list there last name?

select EM_first_name, EM_last_name, EM_typeof, EM_position
from employee
where EM_last_name = 'unlisted';

--COMPLETE


prompt 7. how many planed DLEs have not actually been excuted yet?  
prompt what are their targets? who is the assigned adminstrator for the DLE?

select DLE_CODENAME,  
		EM_last_name || ',' || EM_first_name as admin,
		planet.PLANET_NAME
from destruction_level_event, planet, employee
where destruction_level_event.dle_target_planet = planet.PLANET_NAME
and employee.EM_ID = destruction_level_event.dle_administrator;



prompt 8. what are the email addresses of any employee with the word spy
prompt in their name, and what is the affiliation of the planet?

select EM_EMAIL, EM_first_name, EM_last_name, affiliation
from employee, planet, employee_email 
where employee.PLANET_NAME = planet.PLANET_NAME
and employee_email.EM_ID = employee.EM_ID
and EM_EMAIL like '%spy%';



spool off