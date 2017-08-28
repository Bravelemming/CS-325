-- just project certain

select empl_last_name, dept_name, dept_loc
from empl, dept_loc
where empl.dept_num = dept.dept_num;

--combining selection and projection

select empl_last_name, salary
from empl
where job_title = 'Manager';

select job_title, hiredate
from empl
where commission > 0;


--sql gotcha

--the equal operator does not work for selecting rows
--with a null value for some attribute

select empl_last_name
from empl
where commission = NULL;
--with NO ERROR MESSAGES DISPLAYED

--this WILL WORK
select empl_last_name
from empl
where commission is NULL;

--you can use "is NULL" and "is not NULL"

--another predicate

--IN
--this operator returns true if the value of the attrib
--on the left hand side is contained in the set given on
--its right hand side
--you can put that set in a comma seperated list inside a set of ()

--want last names, job titles and saalaries of analyists and managers

select empl_last_name, job_title, salary
from empl_last_name 
where job_title in ('Analyst', 'Manager');

--frequently there is more than one way to answer a question
--we can also use ...where <> = '' or <> = '';
	
--you can combine an qui join with further selection

select empl_last_name, dept_name, dept_loc
from empl, dept
where empl.dept_num = dept.dept_num
	AND hiredate > '01-DEC-1991';


--OR 

select empl_last_name, dept_name, dept_loc
from empl JOIN dept oN empl.dept_num = dept.dept_num
where hiredate > '01-DEC-1991';

-------
-- this does not work, because the select dept num is undefined!!
--needs to say which table dept num we are referring too
select empl_last_name, dept_num, dept_name, dept_loc
from empl, dept
where empl.dept_num = dept.dept_num
	AND hiredate > '01-DEC-1991';

--this works
select empl_last_name, dept.dept_num, dept_name, dept_loc
from empl, dept
where empl.dept_num = dept.dept_num
	AND hiredate > '01-DEC-1991';



--usual booleans are available = != < > and or not
-- is null, is not null

select empl_last_name
from empl
where job_title = 'Sales'
	or salary >= 1500;

--style tip when mixing ands and ors, use () for readablity.


select empl_last_name
from empl
where hiredate > '01-MAR-1991'
	and (job_title = 'Sales'
	or salary >= 1500);


-- a few negation examples

select *
from empl
where job_title != 'Sales';

select *
from empl
where job_title <> 'Sales';


-- between operator
--fine in where clauses, too

select *
from empl
where salary between 1100 and 1600;

--this is the same result as 
select *
from empl
where salary >= 1100
	and salary <= 1600;

--like operator
--you can use like to select rows with an attribute that matches
--a certain pattern;

--write the pattern in single quotes
--here are some available wildcards:
-- % matches any 0 or more characters
-- - matches any single character

--employees who emp nums end with a 9
select *
from empl
where empl_num like '%9';

--employees with a seven anywhere in their emp nums
select *
from empl
where empl_num like '%7%';

--employees with a 7 as the third character
select *
from empl
where empl_num like '__7%';

-- you can project the results of expressions as well as attrib

select salary * 2
from empl;

--column alias
-- in a select you can give a projected column a different name
-- with a column alias.  in the select clause
-- follow the column expression with white space and desired alias

select salary * 2 doubled_salary
from empl;

--if you want a blank in the column alias or you want lower case
--use double quotes "   "
--another gotcha; it'll error on single quotes.

select salary * 2 "doubled_salary"
from empl;

-- expressions can not be done on null entries

-- tables can have aliases as well
-- in the from clause, you can follow a relation expression
-- with white space and a name, and that becomes the alias
-- for that relation, THROUGHOUT that select statement.

--yes, EVEN IN THE SELECT CLAUSE

select empl_last_name, dept_name, dept_loc, d.dept_num
from empl e, dept d
where e.dept_num = d.dept_num;

--aggregate functions - one result on a compuation of multiple selects
--typical: avg min max sum count

select avg(salary), min(salary), max(salary), sum(salary), count(salary)
from empl
where job_title = 'Sales';



