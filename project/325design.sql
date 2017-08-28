--Jack Daniel Kinne
--CS 325 - Fall 2016 Design
--11.6.16

drop table planet cascade constraints;

--planet table gives: 
--employees - a planet of origin
--destruction level events - a target

create table planet
(PLANET_NAME		varchar2(15),
 affiliation		varchar(15),
 destroyed			char(1) check(destroyed in ('y', 'n')),
 primary key        (PLANET_NAME)
);

--
drop table employee cascade constraints;

--employee table keeps track of all employees

create table employee
(EM_ID 				number(4),
EM_date_hired		date not null,
EM_date_fired		date DEFAULT null,
EM_first_name		varchar2(10) not null,
EM_last_name		varchar2(10) DEFAULT 'unlisted',
EM_position			varchar2(30),
EM_prom_times		number DEFAULT 0,
EM_typeof			char(1) check(EM_typeof in ('o', 'e', 'h', 'c')),
PLANET_NAME			varchar2(15) not null,
primary key			(EM_ID),
foreign key			(PLANET_NAME) references planet(PLANET_NAME)
);

drop table imperial_officer_emp cascade constraints;

--distinct officer, from employee

create table imperial_officer_emp
(EM_ID 				number(4),
 rank_o				varchar2(15),
 primary key		(EM_ID),
 foreign key		(EM_ID) references employee(EM_ID)
);

drop table enlisted_emp cascade constraints;

--distinct enlisted, from employee

create table enlisted_emp
(EM_ID 				number(4),
 salary_em			decimal(8,2),
 primary key		(EM_ID),
 foreign key		(EM_ID) references employee(EM_ID)
);

drop table hourly_emp cascade constraints;

--distinct hourly emp, from employee

create table hourly_emp
(EM_ID 				number(4),
 wage_per_hr		varchar2(5),
 primary key		(EM_ID),
 foreign key		(EM_ID) references employee(EM_ID)
);

drop table contractor_emp cascade constraints;

--distinct contractor, from employee

create table contractor_emp
(EM_ID 				number(4),
 sponsor_comp		varchar2(15),
 sec_clear_con		varchar2(15) not null,
 primary key		(EM_ID),
 foreign key		(EM_ID) references employee(EM_ID)
);

--
drop table promotion cascade constraints;

--promotion table tracks promotions
--for employees. triggered off promotion points (tracked in employee)

create table promotion
(PRO_ID				char(5),
 pro_old_title		varchar2(30),
 pro_new_title		varchar2(30),
 pro_date			date not null,
 EM_ID 				number(4),
 primary key		(PRO_ID),
 foreign key		(EM_ID) references employee(EM_ID)
);

--
drop table destruction_level_event cascade constraints;

-- DLE's are the destruction of a planetary target.  

create table destruction_level_event
(DLE_CODENAME		varchar2(20),
 dle_date			date DEFAULT null,
 dle_bothans_killed	number,
 dle_spies_found	number,
 dle_target_planet	varchar2(15),
 dle_administrator	number(4),
 primary key		(DLE_CODENAME),
 foreign key		(dle_target_planet) references planet(PLANET_NAME),
 foreign key		(dle_administrator) references employee(em_id)
);

--
drop table employee_of_the_month cascade constraints;

--EOM table, tracks employee of the month.

create table employee_of_the_month
(EOTM_ID			char(3),
 EOTM_month			char(3),
 EOTM_year			number(4),
 EM_ID 				number(4),
 primary key		(EOTM_ID),
 foreign key		(em_id) references employee(em_id)
);

--
drop table meeting cascade constraints;

--meeting table, tracks options and chairman.

create table meeting
(MEET_ID 			char(5),
 meet_skip_level	char(1) check(meet_skip_level in ('y', 'n')),
 meet_date			date,
 meet_issue			varchar2(20),
 meet_loc			varchar2(10),
 meet_chaired_by	number(4),
 primary key		(MEET_ID),
 foreign key		(meet_chaired_by) references employee(em_id)
);


--
drop table employee_email cascade constraints;

--employee emails (MV)

create table employee_email
(EM_ID 				number(4), 
 EM_EMAIL 			varchar2(35),
 primary key		(EM_ID, EM_EMAIL),
 foreign key		(EM_ID) references employee(em_id)
);


--
drop table meeting_with_employees cascade constraints;

-- all employees who attend a meeting

create table meeting_with_employees
(EM_ID 				number(4),
 MEET_ID 			char(5),
 primary key		(MEET_ID, EM_ID),
 foreign key		(EM_ID) references employee(em_id),
 foreign key		(MEET_ID) references meeting(MEET_ID)
);


--
drop table dle_with_employees cascade constraints;

-- all employees who attend a DLE

create table dle_with_employees
(EM_ID 				number(4),
 DLE_CODENAME 		varchar2(20),
 primary key		(EM_ID, DLE_CODENAME),
 foreign key		(EM_ID) references employee(em_id),
 foreign key		(DLE_CODENAME) references destruction_level_event(DLE_CODENAME)
);
-- end