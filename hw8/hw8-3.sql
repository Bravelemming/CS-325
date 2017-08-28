--Jack Daniel Kinne
-- CS 325 Homework 8 - Problem 3
-- 11.18.16



set termout off
start hw4-pop.sql
set termout on

spool hw8-3-out.txt

prompt Homework 8 - Problem 3 
prompt Jack Daniel Kinne
--
prompt problem 3-2
-- INTERSECT
select movie.movie_num 
from movie 
where movie_rating = 'G'
INTERSECT 
select video.movie_num
from video
where vid_format = 'DVD';
--
prompt problem 3-3
-- INTERSECT plus
select movie.movie_title
from movie 
where movie_rating = 'G'
INTERSECT  
select movie.movie_title
from movie, video
where vid_format = 'DVD'
and video.movie_num = movie.movie_num;
--
prompt problem 3-4
--minus
select movie_title
from movie, video
where video.movie_num = movie.movie_num
minus
select movie.movie_title
from rental, movie, video
where video.movie_num = movie.movie_num
and rental.vid_id = video.vid_id;
--
prompt promblem 3-5
--
select video.vid_id, vid_rental_price
from video 
where vid_format = 'HD-DVD'
UNION
select video.vid_id, vid_rental_price
from rental, movie, video
where NOT video.movie_num = movie.movie_num
and rental.vid_id = video.vid_id
order by vid_rental_price desc;
--
prompt problem 3-6
--
select client_num 
from client
where client_credit_rtg > 3
minus
select client_num 
from rental
where date_returned is null; 
--
prompt problem 3-7
-- BROKEN: ORDER BY item must be the number of a SELECT-list expression
select video.vid_id, count(*)
from video, rental
where rental.vid_id = video.vid_id
UNION
select video.vid_id, count(*)
from video, rental
where not rental.vid_id = video.vid_id
group by video.vid_id
order by count(*) desc;
--
prompt problem 3-8
--
commit
--
select client_lname, client_credit_rtg,
from client;

update client 
set client_credit_rtg = 3.8
where client_num = 4444;

select client_lname, client_credit_rtg,
from client;

--
prompt problem 3-9
--
select vid_id, vid_rental_price
from video 
where not vid_format = 'DVD';

update video
set vid_rental_price = vid_rental_price - vid_rental_price * .18;

select vid_id, vid_rental_price
from video 
where not vid_format = 'DVD';

--
prompt problem 3-10
--
select *
from rental 
order by client_num;

delete from rental 
where client_num = 3333;

select *
from rental 
order by client_num;

--
prompt problem 3-11
-- integrity constraint violated - child record found
select count(*)
from video;

delete from video
where exists (select video.vid_id
				from video
				minus
				select video.vid_id
				from rental, video
				where rental.vid_id = video.vid_id);

select *
from video
order by vid_id;

--
prompt problem 3-12
--
DROP VIEW mini_action;

create view mini_action AS
select movie_num, movie_title, movie_rating
from movie 
where category_code = 200;

select * 
from mini_action;

--
prompt problem 3-13
--
drop view movie_list;

create view movie_list AS
select category_name, movie_rating, movie_title
from movie, movie_category
where movie.category_code = movie_category.category_code;

select *
from movie_list
order by movie_rating, movie_title;

--
prompt problem 3-14
--

drop table examples cascade constraints;

create table examples
(examples_code     int,
 examples_name     varchar2(10) not null,
 exmaples_date     date,
 primary key       (examples_code)
);

drop sequence increment_examples

create sequence increment_examples
start with 2
increment by 1;

--
prompt problem 3-15
--
insert into examples 
Values (increment_examples.NEXTVAL, 'sam', sysdate);

insert into examples 
Values (increment_examples.NEXTVAL, 'dexter', sysdate);

insert into examples 
Values (increment_examples.NEXTVAL, 'larry', sysdate);

select * 
from examples;


spool off