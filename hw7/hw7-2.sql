--Jack Daniel Kinne
--cs 325 homework 7 - problem 2
--11.2.16

spool hw7-2-out.txt

prompt Homework 7 - problem 2
prompt Jack Daniel Kinne

prompt problem 2-1
select *
from client
order by client_credit_rtg asc;

prompt part b
select *
from client
order by client_credit_rtg desc;

prompt problem 2-2
select movie_rating || ': ' || movie_title as "Rating: movie"
from Movie
order by movie_rating asc, movie_title asc; 

prompt problem 2-3
select category_name, movie_title, movie_rating
from Movie_category, Movie
where Movie_category.category_code = Movie.category_code
order by Movie_category.category_code, movie_rating, movie_title;

prompt b
select category_name, movie_title, movie_rating
from Movie_category, Movie
where Movie_category.category_code = Movie.category_code
order by movie_rating, Movie_category.category_name desc, movie_title;

prompt problem 2-4
select client_lname, client_phone, client_credit_rtg
from Client
where client_credit_rtg >= (select avg(client_credit_rtg)
							from Client)
order by client_credit_rtg desc;

prompt problem 2-5
select vid_format, count(*) "QTY", avg(vid_rental_price) "AVG RENTAL PRICE" 
from video
group by vid_format;

prompt problem 2-6
select vid_format, count(*) "QTY", avg(vid_rental_price) "AVG RENTAL PRICE" 
from video
group by vid_format 
order by "QTY" asc;

prompt problem 2-7
select vid_rental_price, count(vid_rental_price) "# VIDS"
from Video
group by vid_rental_price
order by vid_rental_price desc;

prompt problem 2-8
select vid_rental_price, count(vid_rental_price) "# VIDS"
from Video
group by vid_rental_price
having count(vid_rental_price) >= 5
order by vid_rental_price desc;

prompt problem 2-9
select category_name, count(*) "# MOVIES" 
from Movie, Movie_category
where Movie_category.category_code = Movie.category_code
group by category_name
order by count(*) desc;

prompt problem 2-10
select category_name, count(*) "# VIDS"
from video, Movie_category, movie
where Movie_category.category_code = Movie.category_code
and video.movie_num = movie.movie_num
group by category_name
order by count(*) desc;

prompt problem 2-11
select category_name, count(*) "# VIDS"
from video, Movie_category, movie
where Movie_category.category_code = Movie.category_code
and video.movie_num = movie.movie_num
group by category_name
having count(*) <= 7
order by count(*) desc;

prompt problem 2-12
select avg(count(vid_rental_price)) "AVG # PER PRICE"
from video
group by vid_rental_price;


spool off