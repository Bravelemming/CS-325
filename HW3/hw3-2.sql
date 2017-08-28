--Jack Daniel Kinne
-- CS 325 Homework  3-2

spool hw3-out.txt

prompt 2 part a
SELECT distinct CLI_LNAME
from client;
--
prompt 2 part b
select distinct vid_format, vid_rental_price
from video;
--
prompt 2 part c 
select vid_length
from video
where vid_length > 75;
--
prompt 2 part d
select VID_ID
from rental 
where VID_ID = '00000D';
--
prompt 2 part e
select *
from rental, video;
--
prompt 2 part f
select *
from rental, video
where rental.VID_ID = video.VID_ID;
--
prompt 2 part g
select rental.CLI_ID, VID_ID, CLI_LNAME, CLI_FNAME, CLI_PHONE
from rental, client
where rental.CLI_ID = client.CLI_ID;
--
prompt 2 part h
select *
from rental, client
where rental.CLI_ID = client.CLI_ID;


spool off