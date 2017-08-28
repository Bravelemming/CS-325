/*
add a few set theoretic operations to cartesian product

* Union - A u B
	if something is in A or B its in the union

* Intersection  - A n B
	if something is in A AND B its in intersection

* Difference - A - B
	elements in A that are not also in B

consider that a relation is a set of rows/tuples

you can do the above with relations, with some restrictions
the two relations must be union compatible

* two relations must have the same number of attributes
* attriubes should have the same domain

SQL Syntax:

(sub-select)
UNION
(sub-select)
[order by ...]


(sub-select)
INTERSECT
(sub-select)
[order by ...]

(sub-select)
MINUS
(sub-select)
[order by ...]
*/

--Example;

/*
union of empl last names and job titles of people with 
jobtitle of manager
and empl last names and job titles of people who work in dallas
*/

(select empl_last_name, job_title
from empl
where job_title = 'Manager')
union
(select empl_last_name, job_title
from empl e join dept d
	on e.dept_num = d.dept_num
WHERE dept_loc = 'Dallas');

/* notice that union does do a true union, 
in the sense that you get a real relation, 
with each row only appearing once even if it is in both sets;*/

(select empl_last_name, job_title
from empl
where job_title = 'Manager')
union all
(select empl_last_name, job_title
from empl e join dept d
	on e.dept_num = d.dept_num
WHERE dept_loc = 'Dallas');


--the sub selects must be union compatible
--WILL FAIL!  not union compatible
prompt WILL FAIL!  not union compatible
(select empl_last_name
from empl
where job_title = 'Manager')
union all
(select empl_last_name, job_title
from empl e join dept d
	on e.dept_num = d.dept_num
WHERE dept_loc = 'Dallas');

prompt WILL FAIL!  data type not comp. between salary and job_title
(select empl_last_name, salary
from empl
where job_title = 'Manager')
union all
(select empl_last_name, job_title
from empl e join dept d
	on e.dept_num = d.dept_num
WHERE dept_loc = 'Dallas');

--
prompt this will give a result, but it wont mean anything.
--column name pulled from first sub select
(select empl_last_name
from empl
where job_title = 'Manager')
union all
(select job_title
from empl e join dept d
	on e.dept_num = d.dept_num
WHERE dept_loc = 'Dallas');
--

prompt demo intersection
(select empl_last_name, job_title
from empl
where job_title = 'Manager')
intersect 
(select empl_last_name, job_title
from empl e join dept d
	on e.dept_num = d.dept_num
WHERE dept_loc = 'Dallas');

--
prompt demoing Difference
(select empl_last_name, job_title
from empl
where job_title = 'Manager')
MINUS 
(select empl_last_name, job_title
from empl e join dept d
	on e.dept_num = d.dept_num
WHERE dept_loc = 'Dallas');

--
/*
an order by only "sees" the resulting relation, you must write it
accordingly.


*/

prompt ORDER BY EXAMPLE
(select empl_last_name, job_title
from empl
where job_title = 'Manager')
union
(select empl_last_name, job_title
from empl e join dept d
	on e.dept_num = d.dept_num
WHERE dept_loc = 'Dallas')
order by empl_last_name; 

-- note that you cannot order by the outer select, job_title
-- order by ONLY SEES ATTRIBUTE NAMES FROM FIRST SUB SELECT

prompt this will fail
prompt ORDER BY EXAMPLE
(select empl_last_name, job_title
from empl
where job_title = 'Manager')
union
(select empl_last_name, job_title
from empl e join dept d
	on e.dept_num = d.dept_num
WHERE dept_loc = 'Dallas')
order by job_title;

--

prompt this will fail.  order by column is now named 'names'
(select empl_last_name names, job_title
from empl
where job_title = 'Manager')
union
(select empl_last_name, job_title
from empl e join dept d
	on e.dept_num = d.dept_num
WHERE dept_loc = 'Dallas')
order by empl_last_name; --works with: names

--

/* 
you can use a UNION in OR situations
 
you can often use an INTERSECT in AND situations

example of MINUS instead of NOT EXISTS:

*/

prompt which departments have no employees? 
(select dept_name
from dept)
MINUS
(select dept_name
from dept d join empl e 
	on d.dept_num = e.dept_num);

--

--it appears that at least sometimes you dont need
--paranthesises around the sub selects


-- the second subselect is within its own scope.  note use of 'jt'
prompt ORDER BY EXAMPLE
select empl_last_name, job_title jt 
from empl
where job_title = 'Manager'
union
select empl_last_name, job_title
from empl e join dept d
	on e.dept_num = d.dept_num
WHERE dept_loc = 'Dallas'
order by jt;

--


/*
another use of UNION


*/
--you cannot get a zero count from equi-join
prompt how many employees

select dept_name, count(*)
from empl e join dept d 
	on e.dept_num = d.dept_num
group by dept_name;

--
prompt union version
(select dept_name, count(*)
from empl e join dept d 
	on e.dept_num = d.dept_num
group by dept_name)
union
(select dept_name, count(*)
from dept 
where not EXISTS
		(select 'a'
			from empl 
			where empl.dept_num = dept.dept_num));

--DOESNT WORK
prompt union version
(select dept_name, count(*)
from empl e join dept d 
	on e.dept_num = d.dept_num
group by dept_name)
union
(select dept_name, count(*)
from dept 
where not EXISTS
		(select 'a'
			from empl 
			where empl.dept_num = dept.dept_num))
order by count(*); -- this breaks

--does work
prompt union version
(select dept_name, count(*) "# of employees"
from empl e join dept d 
	on e.dept_num = d.dept_num
group by dept_name)
union
(select dept_name, count(*)
from dept 
where not EXISTS
		(select 'a'
			from empl 
			where empl.dept_num = dept.dept_num))
order by "# of employees";










