/*
ALTER
intro to sequences
intro to views

Reminder about update:


UPDATE table_name
SET attribute = expression
WHERE condition; -- where is optional

if you don't use a where clause, you will make that change
to all the rows.
*/


insert into parts
values
('10605', 'hammer', 30, 9.99, '003', sysdate);

--to be able to roll back to this point later on
commit;

update parts
set price = 66.66
where part_num = '10604';

update parts
set quantity_on_hand = 0
where price = 9.99;

update parts
set last_inspected = sysdate-7;

update parts
	set last_inspected = (select max(hiredate)
							from empl)
where quantity_on_hand < (select quantity_on_hand
							from parts
							where part_num = '10604');

--DELETE
/*
DELETE:

DELETE 
FROM table_name
WHERE condition;

where condition can be left out, but it will delete all 
rows from the given table.
from keyword in the delete is optional.

delete only removes content, it doesnt kill the table.



*/

delete from parts
where price = 66.66;

insert into parts
values
('10606', '3/8 inch bolt', 5000, 0.03, '005', sysdate );

insert into parts
values
('10607', '7/8 inch bolt', 2655, 0.04, '005', sysdate );

delete parts
where level_code = '005';

--delete all entries in parts
delete from parts;


--roll back changes
prompt rolling back all changes 
rollback;


insert into orders
values
('111111', '1111111111', '10604',sysdate, 6, 'B', 'U');

--won't work because it doesn't have a parent!
insert into orders
values
('111111', '1111111111', '10600',sysdate, 6, 'B', 'U');

--won't work because it has a child integrity constraint
delete from parts
where price > 10.99;

--won't work, parent key not found
update orders 
set part_num = '2';

--a command i hope i'll never use

/*
notice that update, insert, delete do not change 
database structure

create, drop and alter DO change database structure
(and include in oracle an auto commit)

consider if you have two base tables that need
to reference each other

you can create table A with the needed attribute,
NOT specified yet as the foreign key referencing B

you can create table B with the desired foreign key
referencing A
now you can ALTER table A,
adding the foreign key constraint;

not all alter-ations will be allowed--
	you can't make one that existing rows would violate

*/
--syntax
ALTER TABLE table_name
ADD 
(desired_change);
--

ALTER TABLE parts
add 
(supplier varrchar2(20));

alter table A_table
add 
(foreign key(B_id)references B_table);

--cannot alter such that existing rows would violate
--a new domain constraint
--FAIL!
ALTER TABLE parts
add 
(supplier varrchar2(20) not null);

update parts
set supplier = 'acme';

prompt you can use MODIFY to modify 
prompt an existing columns constraint

ALTER TABLE parts
modify 
(supplier varrchar2(20) not null);



/*
SEQUENCeS:

different DBMS's may provide different tools
different ways to generate primary key values

oracle provides sequences as one  such means

	--it is a separate object in the DB
	you can ask it its current value
	you can ask for next value


CREATE SEQUENCE desired_sequence_name;

--this increments by one, by default.

there are option clauses for specifing start boundary

CREATE SEQUENCE des_seq_name
INCREMENT BY increment_amount
START WITH start_value;

can also:
DROP SEQUENCE desired_sequence_name;

*/

drop table painter cascade constraints;

create table painter
	(ptr_num int,
	 ptr_lname varchar2(30),
	 ptr_fname varchar2(15),
	 primary key (ptr_num)
	);

drop table painting	cascade constraints;

create table painting
	(ptg_num int,
	 ptr_num int,
	 ptg_title varchar2(30),
	 primary key (ptg_num),
	 foreign key (ptr_num) references painter
	);

drop sequence painter_seq;

create sequence painter_seq
	increment by 2
	start with 100;


--my_seq.nextval gets me next value

--my_seq.currval gets current value

--warning; in select statements there are issues.


insert into painter 
	values
	(painter_seq.nextval, 'Van Gogh', 'Vincent' );

insert into painter 
	values
	(painter.seq.nextval, 'this', 'thing');


--it is inconsistant with oracle student databse
--whether the first nextval starts with the current
--or increments first



insert into painter 
	values
	(painter_seq.nextval, 'Monet', 'Claude');


insert into painter 
	values
	(painter_seq.nextval, 'Da Vinci', 'Leonardo');

insert into painting
	values
	(1, painter_seq.currval, 'Mona lisa');

prompt there are problems with select
select * from painter_seqwhere ptr_num = painter_seq.currval;

prompt you can do this
select painter_seq.currval
from dual;

--yes you can abuse sequences, please don't


insert into parts 
values
('10600', 'stuff', || painter_seq.currval, 
	painter_seq.nextval, .13, '005',sysdate, 
	'robot' || painter_seq.currval);


--SQL views

/*
another database object!

a view is a derived "table" 
you know that a database relation table is a set of
tuples or rows.

a view is not.  a view just contains the desired information
without actually storing rows and columns in a DB

views = JUST HOW TO GENERATE desired info.

you can treat the view as if it were a table in a 
select statement

BUt! you can do so without adding update hassles.

AND you can grant and revoke access to views
as you can to tables.

you cannot grant/revoke access to part of a table

but you can make a view that generates the info
from part of a table, and grant/revoke to that

convience plus data security

drop view desired_view;

create view desired_view as
	desired_select_statement;

alternant syntax:

create view desired_view(col_name, col_name...) as
	desired_select_statement;

*/

commit;

drop view short_empl;

create view short_empl as 
	select empl_num, empl_last_name, job_title, mgr
	from empl;

delete from empl 
	where job_title = 'Clerk';


select empl_last_name, cust_lname
from short_empl, customer
where short_empl.empl_num = customer.empl_num;

drop view cust_rep_display;

create view cust_rep_display as
	select empl_last_name, cust_lname
	from short_empl, customer
	where short_empl.empl_num = customer.empl_num;

--giving aliases
drop view short_empl2;

prompt note: i am doing an ugly thing with double quotes
prompt to show why you should not

create view short_empl2(name, "job category", 
						manager) as
	select empl_last_name, job_title, mgr 
	from empl;

--you now MUST use the column names you have given for the 
--view, for using the view.

--this will fail because its been renamed
select empl_last_name
from short_empl2;


--you can also rename columns from inside the select 
drop view short_empl3;

create view short_empl3 as
	select empl_last_name last_name, 
			job_title position
	from empl;


drop view salary_avgs;
--must mist MUST name computations with aliases!
create view salary_avgs as
	select job_title, avg(salary) salary_averages
	from empl;







