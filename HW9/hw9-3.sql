-- Jack Daniel Kinne
-- CS 325 Homework 9 - Problem 3
-- 12.1.16

clear breaks
clear columns
clear computes

set space     1
set feedback  6
set pagesize  14
set linesize  80
set newpage   1
set heading   on

TTITLE 'the top'
TTITLE 'second line'
BTITLE 'the bottom'
BTITLE 'second line'

set pagesize 35
set linesize 75

set feedback OFF

set termout off
start hw4-pop.sql
set termout on

spool hw9-3.out.txt
--
prompt problem 3-2

drop view rental_history;
create view rental_history as
select distinct client_lname || ', ' || client_fname  client_name, 
		movie_title  movie_title,
		vid_format  vid_format,
		vid_rental_price  vid_rental_price
from Client, Movie, Video, Rental
where movie.movie_num = video.movie_num 
and rental.client_num = client.client_num
and video.vid_id = rental.vid_id;

select * 
from rental_history
order by vid_rental_price desc, client_name, movie_title;

--
prompt problem 3-3

col client_name heading Client format a13

col movie_title heading 'Movie Title' format a36

col vid_format heading 'Video|Format' format a7

col vid_rental_price heading 'Rental|Price' format $999.99

/
--
prompt problem 3-4

drop view category_stats;
create view category_stats as
select category_name, count(category_name) count, avg(vid_rental_price) average
from movie, video, movie_category
where movie.movie_num = video.movie_num 
and movie.category_code = movie_category.category_code
group by category_name;

select * 
from category_stats
order by count desc, average desc;
--
prompt problem 3-5

set pagesize 20

col category_name heading Category format a8

col count heading '# Videos' format 999

col average heading 'Average|Price' format $99.99

/
--
prompt problem 3-6 part a

commit;

update Video
set vid_rental_price = vid_rental_price - .99;
where vid_format = 'Blu-Ray';

select * 
from category_stats
order by count desc, average desc;
--
prompt problem 3-6 part b 

select *
from rental_history
where movie_title = 'Gone with the Wind'
order by client_name;
--
prompt problem 3-6 part c

delete from rental 
where client_num = '5555';

select *
from rental_history
where movie_title = 'Gone with the Wind'
order by client_name;
--
prompt problem 3-6 part d

select client_name, count(movie_title)
from rental_history
group by client_name, movie_title
order by count(movie_title) desc, client_name;

rollback;
--
prompt problem 3-7

set pagesize 45

break on movie_title skip 1

select movie_title, client_name 
from rental_history
order by movie_title desc, client_name;
--
prompt problem 3-8

break on category_name skip 1
break on movie_rating

col category_name heading Category format a8

col movie_rating heading Rating format a6

select category_name, movie_rating, movie_title
from movie_category, movie 
where movie.CATEGORY_CODE = movie_category.CATEGORY_CODE
order by category_name, movie_rating, movie_title;
--
prompt problem 3-9

break on category_name 
compute count of movie_title on category_name
/
--
prompt problem 3-10
clear computes
clear breaks

break on movie_title on category_name skip 1

compute avg of vid_rental_price on category_name

col vid_rental_price heading Cost format 99.99

select category_name, movie_title, vid_rental_price
from video, Movie_category, movie
where movie.CATEGORY_CODE = movie_category.CATEGORY_CODE
and movie.movie_num = video.movie_num
order by category_name, movie_title, vid_rental_price;

--
prompt problem 3-11

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