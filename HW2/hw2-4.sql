--"Jack" daniel kinne
--CS 325 homework 2-4
--9/22/16

spool hw2-4-out.txt;

prompt 'Problem 4 part a';

drop table client cascade constraints;
drop table video cascade constraints;
drop table rental cascade constraints;
--
create table client
(
CLI_ID char(4),
cli_lname varchar(25) NOT NULL,
cli_fname varchar(25),
cli_phone int NOT NULL,
PRIMARY KEY (CLI_ID)
);
--
create table video
(
VID_ID char(6),
vid_format varchar(10) CHECK (vid_format = 'dvd' or vid_format = 'hd-dvd' or vid_format ='bluray'),
vid_purchase_date date DEFAULT sysdate,
vid_rental_price decimal(6,2) CHECK (vid_rental_price > 0) NOT NULL,
vid_length smallint CHECK (vid_length > 0),
PRIMARY KEY (VID_ID)
);
--
create table rental
(
cli_id char(4),
vid_id char(6),
FOREIGN KEY (cli_id) REFERENCES client(cli_id),
FOREIGN KEY (vid_id) REFERENCES video(vid_id)
);
--
--inserts
--
insert into client
values('000A','alpha','ann',1234567);
insert into client
values('111B','beta','bob',1111112);
insert into client
values('222B','beta','ann',222-2223);
insert into client
values('333C','carlos','david',3333334);
insert into client
values('444D','delta','edie',1111112);
--
insert into video
values('00000D','dvd',sysdate,1.99,73);
insert into video
values('11111H','hd-dvd',sysdate,4.99,91);
insert into video
values('22222B','blueray',sysdate,1.99,105);
insert into video
values('33333H','hd-dvd',sysdate,3.99,69);
insert into video
values('44444B','blueray',sysdate,0.99,91);
--
insert into rental
values('111B','11111H');
insert into rental
values('222B','00000D');
insert into rental 
values('222B','22222B');
insert into rental
values('333C','22222B');
insert into rental
values('333C','00000D');
insert into rental
values('333C','11111H');
insert into rental
values('000A','44444B');
-- problem 10
insert into client
values('123J','Jack','Kinne',1234567);
insert into video
values('77777J','dvd',sysdate,10.99,111);
insert into rental
values('123J','77777J');

prompt 'Problem 4 part b';

prompt 'SHOULD FAIL; VIOLATES ENTITY INTEGRITY';

insert into client
values('123J', 'Jacktiyfail', 'failcheck', 1234567);

prompt 'Problem 4 part c';

prompt 'SHOULD FAIL; VIOLATES REFERNTIAL INTEGRITY';

insert into rental
values('234G','123456');

prompt 'Problem 4 part d';

prompt 'SHOULD FAIL; VIOLATES DOMAIN INTEGRITY';

insert into video
values('146', 'dvd', sysdate, 1);

prompt 'Problem 4 part e';


prompt 'SHOULD FAIL; client needs phone to the screen.';

insert into client
values('0983','clemens', , 1234567);

prompt 'Problem 4 part f';

prompt 'SHOULD FAIL; video needs legal format to the screen.';

insert into video
values('12300F','MOO',sysdate,4.99,99);

prompt 'Problem 4 part g';

insert into video(VID_ID, vid_format, vid_rental_price, vid_length)
values('92389D','dvd',4.99,99);


prompt 'Problem 4 part h';

prompt 'SHOULD FAIL; video cant have negative price, length to the screen.';


insert into video
values('76577F','dvd',sysdate,-10,99);

insert into video
values('34554F','dvd',sysdate,4,-99);

prompt 'Problem 4 part i';

SELECT *
FROM video;

SELECT *
FROM client;

SELECT *
FROM rental;



spool off;