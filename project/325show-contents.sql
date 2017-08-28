spool 325result-contents.txt

-- Jack Daniel Kinne
-- CS 325 - Fall 2016
-- 11.26.16

set pagesize 30

prompt table planet
select * 
from planet; 

prompt table employee
select EM_first_name as "First", EM_last_name as "Last", EM_position as "Position", EM_typeof as "Type", PLANET_NAME as "Origin"
from employee;

prompt table imperial_officer_emp
select * 
from imperial_officer_emp;

prompt table enlisted_emp
select * 
from enlisted_emp;

prompt table hourly_emp
select * 
from hourly_emp;

prompt table contractor_emp
select * 
from contractor_emp;

prompt table promotion
select pro_old_title as "Old Title", pro_new_title as "New Title", pro_date as "Date"  
from promotion;

prompt table destruction_level_event
select DLE_CODENAME as "CODENAME", dle_date as "date", dle_bothans_killed "bothans killed", dle_target_planet as "target", dle_administrator as "admin"
from destruction_level_event;

prompt table employee_of_the_month
select * 
from employee_of_the_month;

prompt table meeting
select * 
from meeting;

prompt table employee_email
select * 
from employee_email;

prompt table meeting_with_employees
select * 
from meeting_with_employees;

prompt table dle_with_employees
select * 
from dle_with_employees;

spool off