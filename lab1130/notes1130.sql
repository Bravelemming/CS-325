--Lab 14

/*
to_char - function

give it a date or number and a format string,
and it will return a character string version of given,
formated as specified.

*/

select 	empl_last_name,
		to_char(hiredate, 'MONTH') month_hired
from empl;

select 	empl_last_name,
		to_char(hiredate, 'Month') month_hired
from empl;

select 	to_char(sysdate, 'YYYY') year,
		to_char(sysdate, 'Mon YYYY') mon_year,
		to_char(sysdate, 'MM-DD-YY') num_version,
		to_char(sysdate, 'Day, Month DD, YYYY') long,
		to_char(sysdate, 'DY- Mon DD - YY') strange
from empl;

-- to take it back three days
select 	to_char(sysdate - 3, 'YYYY') year,
		to_char(sysdate - 3, 'Mon YYYY') mon_year,
		to_char(sysdate - 3, 'MM-DD-YY') num_version,
		to_char(sysdate - 3, 'Day, Month DD, YYYY') long,
		to_char(sysdate - 3, 'DY- Mon DD - YY') strange
from empl;

-- there is a time component to oracles date type
-- you can use to_char plus formats to pull it:

-- 'HH12' hour of day in 12 hour format
-- 'HH24' hour of the day in 24 hour format
-- 'MI' minutes
-- 'SS' seconds of the minute
-- 'AM' displays am or pm depending on time

select to_char(sysdate, 
	'D DD DDD, Mon YYYY - HH12 HH24 MI SS AM') ugly
from dual;

select sysdate + 1
from dual;

select hiredate, hiredate+3 'hiredate+' 
from empl;

prompt this fails
select '30-Oct-17'+3
from dual;

--to_date
-- expects a date string, and returns the corresponding 
-- date value

select to_date('30-Oct-17')+3
from dual;

-- next_day
-- expects a date and a string representing a string of the week
-- returns the date of the next date after the given date that is on a 
-- given day of the week

select next_day(sysdate, 'Tuesday') next_tuesday,
		next_day(sysdate, 'Wednesday') next_wednesday
from dual;

-- add_months - expects a date and a number of months
-- returns the date that is that many months after
-- given date

-- months_between - expects two dates, and returns the number
-- of months between those two dates
-- positive if 1st date is later than 2nd, negative otherwise
select add_months(sysdate, 1) mone_month_later,
		months_between('15-Nov-16', '15-Feb-17') diff1,
		months_between('01-Nov-16', '15-Feb-17') diff2
from dual;

-- string related functions
-- initcap - expects a string, returns that string 
-- with the first letter capitalized.

-- lower - expects a string, returns lower case
-- upper - expects a string, returns upper case

select initcap('Silly') looky
from dual;

select lower(empl_last_name) low,
		upper(empl_last_name) up
from empl;

-- lpad / rpad - left pad, expects a string and length, and a 
-- padding character, and it returns a string of that
-- length, with that padding char.

select lpad(empl_last_name, 12, '.') padleft,
		rpad(empl_last_name, 12, '?') padright
from empl;

/*
sure, you can nest/compose / use these together as 
desired.....
*/

select lpad( to_char(hiredate, 'Day'), 14, ' ') || 
		to_char(hiredate, '- Month YY') "Hiredate"
from empl;

-- ltrim - expects a string, trims any leading blanks removed
-- rtrim - expects a string, trims any trailing blanks removed

-- length - expects a string, and returns the number of
-- characters in that string

-- substr - expects a string, the position to start in
-- that string (the first characters position is 1)
-- and how long a substr is desired
-- returns substr of that length, at that position
-- the third argument is optional, when to stop.

col the_rest format a15

select 	empl_last_name,
		length(empl_last_name) lengthy,
		substr(empl_last_name, 1, 3) abbrev,
		substr(empl_last_name, 4) the_rest
from empl;













