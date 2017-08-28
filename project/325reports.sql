--Jack Daniel Kinne
--CS 325 - Fall 2016
--12.8.16

spool 325reports-results.txt

prompt Reports - Jack Daniel Kinne
prompt Report .1
prompt Question: In all destruction level events that were successful
prompt in destroying a planet, how many Bothans were killed,
prompt and which officer was in charge of each D.L.E.?

break on Average_Bothans skip 1
compute count of DLE_CODENAME on Average_Bothans

col DLE_CODENAME heading 'OPERATION|CODENAME :' format a16
col dle_bothans_killed heading 'Number of|Bothans Killed' JUSTIFY CENTER format 9999
col admin heading 'Responsible|Administrator' JUSTIFY CENTER format a20
col Average_Bothans heading 'Average|Bothans' format 9999999.99

TTITLE 'NUMBER OF BOTHANS KILLED'
BTITLE 'END BOTHAN REPORT'

drop view bothans_killed;

create view bothans_killed as
select DLE_CODENAME, dle_bothans_killed,  
		EM_last_name || ',' || EM_first_name as admin,
		(select avg(dle_bothans_killed) 
		 from destruction_level_event) AS Average_Bothans 
from destruction_level_event, planet, employee
where destruction_level_event.dle_target_planet = planet.PLANET_NAME
and employee.EM_ID = destruction_level_event.dle_administrator
and planet.destroyed = 'y'
group by DLE_CODENAME, dle_bothans_killed, EM_last_name, EM_first_name
order by dle_bothans_killed;

select *
from bothans_killed;

prompt 
prompt 

--cleanup
set termout off
clear breaks 
clear columns 
clear computes 
set space 1 
set feedback 6 
set pagesize 14 
set linesize 80 
set newpage  1 
set heading  on
ttitle off
btitle off
set termout on

--

set pagesize 30

prompt Report .2
prompt Which employees come from a non-empire affliated planet and
prompt have been promoted to a higher level of security clearance?
prompt
prompt

col Employee 'Risk|Found' format a17
col affiliation format a11
col pro_new_title format a26

TTITLE 'SECURITY RISKS ONBOARD|ULTRAVIOLET CLEARANCE ONLY'
BTITLE 'END SECURITY REPORT'

break on Employee

select EM_first_name || ' ' || EM_last_name as Employee,
		planet.PLANET_NAME "Planet Name",
		affiliation,
		pro_new_title "New Title"
from employee, promotion, planet
where employee.EM_ID = promotion.EM_ID
and employee.PLANET_NAME = planet.PLANET_NAME
and planet.affiliation NOT IN 'empire'
order by EM_first_name;

--cleanup

set termout off
clear breaks 
clear columns 
clear computes 
set space 1 
set feedback 6 
set pagesize 14 
set linesize 80 
set newpage  1 
set heading  on
ttitle off
btitle off
set termout on

--

set pagesize 30

prompt Report .3
prompt which meetings were the most popular with employees,
prompt and what issue was the focus of that meeting?

col meet_issue heading 'Meeting FOUCS: ' format a19
col meet_loc heading 'Location' format a10

TTITLE 'MEETINGS BY POPULARITY|ISSUE FOCUSES'
BTITLE 'END MEETING REPORT'

drop view meetings_popular;

create view meetings_popular as
select meeting.meet_issue, meet_loc,
		count(meeting_with_employees.MEET_ID) "count",
		meet_chaired_by "chaired by #ID:"
from employee, meeting_with_employees, meeting
where meeting.MEET_ID = meeting_with_employees.MEET_ID
and meeting_with_employees.em_id = employee.EM_ID
group by meeting.meet_issue, meet_loc, meet_chaired_by;

select *
from meetings_popular;


--cleanup

set termout off
clear breaks 
clear columns 
clear computes 
set space 1 
set feedback 6 
set pagesize 14 
set linesize 80 
set newpage  1 
set heading  on
ttitle off
btitle off
set termout on

spool off