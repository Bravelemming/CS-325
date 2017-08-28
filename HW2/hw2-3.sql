-- "Jack Daniel Kinne"
-- CS 325 Homework 2-3
-- 09/22/16

spool hw2-3-out.txt;

prompt 'Problem 3 part a
	You determine that you would like users st10 and dt5 to be able to see the contents of your table
	video, but that is ALL they should be able to do with the video table -- they shouldnt be able to
	change it in any way.
	Write an appropriate grant statement that would have this result.';

GRANT select
ON video
TO st10,dt5;

prompt 'Problem 3 part b
	You also decide that you would like users st10 and dt5 to be able to change column values of rows
	already in your client table, and to be able to see its contents, but that is ALL they should be able to
	do.
	Write an appropriate grant statement that would have this result. ';

GRANT update, select
ON client
TO st10,dt5;

prompt 'Problem 3 part c
And, you decide that you would like users st10 and dt5 to be able to do anything they would like
with the contents of your rental table (including adding rows, getting rid of rows, changing their
contents, and seeing its contents).
Write an appropriate grant statement that would have this result. ';

GRANT insert, delete, select, update
ON rental
TO st10,dt5;

prompt 'Problem 3 part d
...And now you have a change of heart, and want to remove all access you have granted to st10 and
dt5 from your tables in Problem 3 parts b, c, and d.
Write appropriate revoke statements that would have this result.';

REVOKE select
ON video
FROM st10,dt5;

REVOKE update, select
ON client
FROM st10,dt5;

REVOKE insert, delete, select, update
ON rental
FROM st10,dt5;






spool off;