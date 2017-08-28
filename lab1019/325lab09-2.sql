--project a literal value

select 'hi'
from dept;

--concatenation operator in SQL: ||

select dept_num || dept_name
from dept;

--

select dept_num || ' - ' || dept_name "Departments"
from dept;

--predicate; an operator that returns true or false

--iN is a predicate operator, left hand side and right
--EXISTS only has a right hand side
--exists Right handside is a sub select with its outerselect
-- 'the exists predicate is true if its subselect
-- presults in a non-empty set of rows, and is false otheriwise'

/* For each row in the out select it is checked to see
if that row satisfiese the exists predicate.  For that row, 
the sub select has contents

why would a subselect have different results for one row in the
outer seelct versus another?  Because exists/not exist
should only be used with a correlated sub select

a correlation condition referes to at least one attribute
from a table NOT in the FROM clause of that sub select
but it IS in the FROM clause of the outer select

using exists with a correlated sub select, for each row
in the outer selects FROM clause the correlated sub
select is executed, and if ANY rows result the EXISTS
is true, and that row is selected
*/

insert into dept
values
('600','Computer SCI','Arcata');

prompt project the locations and names of departments 
prompt with employees

select dept_loc, dept_name 
from dept 
where EXISTS 
		(select 'a'
		from empl
		where empl.dept_num = dept.dept_num);

--the above is not a join condition because it refers
--to a table dept NOT in its FROM clause
--it is a correlation condition, because its in the
--outer selects from clause!

--NOT EXISTS
prompt which departments have no employees
select dept_loc, dept_name 
from dept 
where NOT EXISTS 
		(select 'a'
		from empl
		where empl.dept_num = dept.dept_num);
--
-- THOU SHALL only use these with correlated subquerries

--thou shall project literals in the correlated sub
--querries used with these

--don't abuse these to avoid writing (n-1) join 
--conditions when joining N tables

--COMMON ERRORS!  THESE DON"T WORK!
prompt leaving off correlation condition
select dept_loc, dept_name 
from dept 
where NOT EXISTS 
		(select 'a'
		from empl
		); --where clause missing

--error, do not use a join condition if a correlation
--condition is needed
select dept_loc, dept_name 
from dept 
where NOT EXISTS 
		(select 'a'
		from empl, dept -- dept not needed
		where empl.dept_num = dept.dept_num);
--

prompt using HW 4 database
prompt which clients have rented BOTH
prompt 'Gone with the Wind' AND 'Star Wars'

select client_lname || ', ' || client_fname "Windy Stars"
from client c
where exists 
		(select 'a'
		from rental r
		where c.client_num = r.client_num
			AND vid_id in 
						(select vid_id
						from movie m, video v
						where m.movie_num = v.movie_num
							and movie_title = 
								'Gone with the Wind'))
AND exists 
		(select 'a'
		from rental r
		where c.client_num = r.client_num
			AND vid_id in 
						(select vid_id
						from movie m, video v
						where m.movie_num = v.movie_num
							and movie_title = 
								'Star Wars'));
--
prompt also works this way
select movie_title
from movie m, video v, rental r 
where m.movie_num = v.movie_num 
	and v.vid_id = r.vid_id
	and client_num iN
			(select client_num
			from client
			where client_lname = 'Beta'
				and client_fname = 'Edie');		

