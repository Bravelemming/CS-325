/*moving into sequel reading packet 8

sql plus provides commands for changing formats...

note: we are just changing how the results  are being displayed,
we are not changing the table dta.

report: a specifically formated query.  designed to be readable
on its own.

'/' redoes the previous SQL statement.  

when you muck with the default settings in sqlplus, they stay mucked 
with until you either change them again or you log out

it is considered polite then to reset defaults back
at the end  of an sql script that mucks with those defaults.

it can be considered smart to start your sql report
script making sure you start with the defaults, anything 
else cleared.

clear columns
clear breaks
clear computes
*/

clear columns
clear breaks
clear computes

/*
Feedback:

the line sqlplus gives that says how many selected, for example.
gives the current value of feedback when you will see feedback
*/

--can use to show feedback
show Feedback

--changing feedback to only when there are three or more rows
set feedback 3

--can also turn feedback off
set feedback off

/* 
pagesize
in SQLPLUS, this is the number of lines in a page the quantum that oracle will display
before redisplaying column headers, et cetera.

*/

show pagesize

set pagesize 30

--you can say you NEVER want page breaks with
set pagesize 0

--each query result is a new 'page' on pagesize.   pagesize removes the headers at 0!

--default
set pagesize 14

--to change line size
--the number of characters in a line before line wrapping must of occur.
show linesize

set linesize 40

--newpage is specifying how many blank lines should appear before column headings

show newpage

set newpage 5

--when making a flat file in a CSV,  say, you can set it to 0.
set newpage 0

--column command SQL PLUS
--COL: specify how a column is to be DISPLAYED in this current session

COLUMN col_to_format HEADING des_heading FORMAT desired_format

--even though these commands are intended to be run on one line...
--you can use a dash '-' to extend the current line in SQLPLUS

--HEADING
--can put your desired heading here...alternative to column aliases
--within your select
--here you can use single or double quotes around the heading.
--want a blank in your heading?
--put the heading in quotes (single or double!)
--want a multi-line column heading?  put a pipe where you want the break '|'

select empl_last_name, job_title, salary
from empl;
--three vertical breaks
col empl_last_name heading EMPL|LAST|NAME 

col empl_last_name heading 'Empl|Last|Name'

--
--for non numeric columns
--use format a, followed by how wide you want that column

col empl_last_name format a10

--when the values in the tuple are longer than the format, they wrap!

--you can specify truncated or TRU to truncate too long values in that column

col empl_last_name format a3 TRUNCATED 

--you can get attempted word wrapping with WOR

col empl_last_name format a3 WOR

--for numeric columns:
--you give a numeric format pattern after the format keyword

--to display a number as an integer in so many total columns
--use that many 9's (it will be right justified)

-- 999
-- 999999

col empl_last_name format a20

select empl_last_name, job_title, salary
from empl;

col salary FORMAT 9999
/

prompt what if you go to small in a format of numerics?

col salary format 999
/

--it will display ####'s within data that is too large.

prompt now let us add a dollar sign 

col salary format $99999
/

prompt now let us add commas

col salary format $99,999

col salary format $99,999.999


--break
-- to make certain quereies whose rows are ordered by some attribute 
--display more nicely
--mainly only used with order by

select dept_num, empl_last_name, salary
from empl 
order by dept_num;

break on dept_num
--break gives you a way to say "only show the first repeat value in an ordered by column"

prompt we can also add a skip of 1 line between values of dept_num

break on dept_num skip 1
/

--can break on more than one thing
select dept_num, mgr, empl_last_name, salary
from empl 
order by dept_num, mgr;
--but it needs to be on one line, as there is only one break command in effect at once
break on dept_num skip 1 on mgr

prompt should use break WITH a query using order by

--COMPUTE
--only makes sense used with BREAK!
--it lets you specify that you would like some computation to be done for rows
--with the same value of somethiing you are breaking on

break on dept_num skip 1 on mgr
compute avg min max of salary on dept_num
/

--you can have multiple compute commands, vut only 1 per column

--you can see your current values of break compute and column by simplly:

break
compute
column


--you can specify top and bottom titles
--using | for line breaks and can use " " or ' ' if there are blanks

ttitle "a beatiful|Three line|Title"
/

btitle Two|lines 
/

--to remove
ttitle off
btitle off

--you can use a start script inside your own!
start <any_script.sql>










