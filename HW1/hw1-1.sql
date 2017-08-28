-- Jack Daniel Kinne
-- 325 HW 1 - part 1
-- 9/16/16
DROP TABLE jordan;
CREATE TABLE jordan
(
EXPLOSION_ID int,
city varchar2(255),
street_name varchar2(255),
street_number varchar2(255),
explosive_type varchar2(255)
);
insert into jordan(EXPLOSION_ID, city, street_name, street_number,
explosive_type)
values(14, 'amman', 'po box', '1234', 'fuelair');
insert into jordan
values(13,'amman','tel','4567','plastik');
insert into jordan
values(12,'jerash','rama','9877','rubberized');
insert into jordan
values(11,'irbid','laddy','5464','sugar');
