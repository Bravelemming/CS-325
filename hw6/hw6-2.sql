-- Jack Daniel Kinne
-- CS 325 Homework 6 - Problem 2

spool hw6-2-out.txt

prompt homework 6 - problem 2
prompt Jack Daniel Kinne

Prompt Problem 2-1
select movie_rating || ': ' || movie_title as "Rating: movie"
from Movie; 

Prompt Problem 2-2
select movie_title || ' (' || movie_yr_released || ')' as "Movies"
from Movie;

Prompt Problem 2-3
select client_lname, client_phone, client_credit_rtg
from Client 
where exists
		(select 'rental not returned'
			from Rental
			where date_returned is NULL);

Prompt Problem 2-4
select movie_title
from Movie 
where not exists
			(select 'H '
				from Video
				where vid_format in ('Blu-Ray') 
				and Movie.Movie_num = Video.vid_id);

Prompt problem 2-5
select count(*), avg(vid_rental_price)
from Video
where not exists
			(select 'h'
				from Rental 
				where date_out is not null
				and Rental.vid_id = Video.vid_id);

Prompt problem 2-6
select distinct vid_id, movie_title, vid_format
from Video, Movie
where not exists
			(select 'h'
				from Rental 
				where date_out is not null
				and Rental.vid_id = Video.vid_id)
and Movie.Movie_num = Video.Movie_num;


spool off