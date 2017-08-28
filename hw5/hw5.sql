--Jack Daniel Kinne
--CS 325 Homework 5
--10/17/16

spool hw5-out.txt

prompt Homework 5
prompt Jack Daniel Kinne
--

prompt problem 2 average video rental
select AVG(vid_rental_price)
from video;

prompt problem 3 nested select no join or products
select vid_id
from video
where vid_rental_price < (select AVG(vid_rental_price)
							from video);

prompt problem 4 nested select no joins or products
--
select client_num
from rental 
where client_num in 
					(select client_num
					from video
					where rental.vid_id = video.vid_id and
						vid_rental_price < (select AVG(vid_rental_price)
													from video ) );
--
prompt problem 5 no joins project no dupes
--
select distinct client_lname, client_credit_rtg
from client, rental 
where client.client_num in 
					(select rental.client_num
					from video
					where rental.vid_id = video.vid_id and
						vid_rental_price < (select AVG(vid_rental_price)
													from video ) );
--
prompt problem 6 average rental price and number of videos
select AVG(vid_rental_price) "Avg Cost - Classic", COUNT(category_name) "# Videos - Classic"
from (select * 
		from movie_category, video, movie
		where movie_category.category_code = movie.category_code
		and video.movie_num = movie.movie_num)
where category_name = 'Classic';
--
prompt problem 7 join NO NESTS
select client_lname, client_fname, date_due
from rental, client
where vid_id = '130012';
--
prompt problem 8 nested no joins
select client_lname, client_fname
from client 
where client_num in (select client_num from rental where vid_id = '130012');
--
prompt problem 9 
select client_lname, category_name, client_credit_rtg
from movie_category, client 
where client_fave_cat = category_code
and client_credit_rtg > (select AVG(client_credit_rtg)from client);
--
prompt problem 10
select movie_title
from movie 
where movie_director_lname= '&movie_director_lname'; 
--
prompt problem 11
select movie_title 
from movie 
where category_code = (select category_code 
						from movie_category 
						where category_name = '&category_name');


spool off