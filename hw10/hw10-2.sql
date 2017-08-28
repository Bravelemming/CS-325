--Jack Daniel Kinne
-- CS 325 Homework 10 - Problem 2
--12.9.16

--cleanup
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
--

ttitle Homework 10
btitle CS 325 JDK

set feedback off

spool hw10-2-out.txt

prompt Homework 10 - Problem 2
prompt Jack Daniel Kinne

prompt problem 2-2

set pagesize 20

col client_lname heading 'Client' format a13
col date_due heading 'Date Due' format a15

select client_lname, to_char(date_due, 'Month DD') date_due
from rental, client
where rental.client_num = client.client_num
order by date_due desc;

prompt problem 2-3

col moredots heading 'RENT FOR' format $999.99
col dots heading 'MOVIE' format a20 tru
set pagesize 55
set colsep "."

select rpad(movie_title, 20, '.') dots, '$'||lpad(vid_rental_price, 10, '.') moredots
from video, movie 
where video.movie_num = movie.movie_num
order by movie_title, vid_rental_price;

set colsep " "

prompt problem 2-4

col title heading 'MOVIE' format a10 tru
col director format a15 tru

select 	rtrim(movie_title) title, 
		length(movie_title) mlength,
		to_char(vid_purchase_date, 'YYYY') Year,
		upper(movie_director_lname) director,
		next_day(vid_purchase_date, 'MONDAY') Monday_Due
from movie, video
where video.movie_num = movie.movie_num;

spool off

--cleanup
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
--