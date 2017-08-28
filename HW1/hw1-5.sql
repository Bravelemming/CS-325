--Jack Daniel Kinne
--325 Homework 1-5
--9/16/16
spool 'hw1-out-2.txt';
--
prompt Jack Daniel Kinne;
--
prompt 'printing contents of client table:';
select *
from client;
--
prompt 'printing contents of video table:';
select *
from video; 
--
prompt 'printing contents of rental table:';
select *
from rental;
--
spool off;
