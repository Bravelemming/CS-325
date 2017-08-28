--Jack Daniel Kinne
--CS 325 Homework 1-4
--9/16/16
drop table client cascade constraints;
drop table video cascade constraints;
drop table rental cascade constraints;
--
create table client
(
CLI_ID char(4),
cli_lname varchar(25),
cli_fname varchar(25),
cli_phone int,
PRIMARY KEY (CLI_ID)
);
--
create table video
(
VID_ID char(6),
vid_format varchar(10),
vid_purchase_date date,
vid_rental_price decimal(6,2),
vid_length smallint,
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
