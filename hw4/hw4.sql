--Jack Daniel Kinne
-- CS 325 Homework  4
-- 10/7/16

spool hw4-out.txt

prompt homework 4 problem 1
prompt Jack Daniel Kinne

prompt 'problem 1-1 relational selection'
select *
from Client 
where client_credit_rtg > 3.4;
--
prompt 'problem 1-2 pure relational projection'
select distinct movie_rating, movie_yr_released
from Movie;
--
prompt 'problem 1-3 equijoin'
select *
from Client, Movie_category
where Client.client_fave_cat = Movie_category.category_code;
--
prompt 'problem 1-4 null'
select vid_id, date_due
from Rental
where date_due is null;
--
prompt 'problem 1-5 project'
select vid_id, vid_format, vid_rental_price
from Video
where vid_format != 'DVD';
--
prompt 'problem 1-6 project'
select Movie_category.category_name, Client.client_lname, Client.client_credit_rtg
from Movie_category, Client
where Client.client_fave_cat = Movie_category.category_code;
--
prompt 'problem 1-7 relational selection between'
select *
from Video
where vid_purchase_date between '15-JUL-2008' AND '01-DEC-2011';
--
prompt 'problem 1-8 relational selection two join conditions'
select *
from Video
where vid_rental_price >= 3.99 AND vid_purchase_date >= '01-JAN-2011';
--
prompt 'problem 1-9 project with like'
select movie_title, movie_rating
from Movie
where movie_title like '%the%';
--
prompt 'problem 1-10 price if reduced by 20%'
select vid_id, vid_format, vid_rental_price * .20 "PRICE_IF_REDUCED"
from Video
where vid_rental_price;
--
prompt 'problem 1-11 use IN'
select movie_title, movie_rating
from Movie
where movie_rating IN ('PG-13', 'R', 'A');
--


spool off