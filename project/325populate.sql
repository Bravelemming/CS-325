-- Jack Daniel Kinne
-- CS 325 - Fall 2016
-- 11.26.16


-- planets : 17
insert into planet
values
('Alderaan', 'rebel', 'y');

insert into planet
values
('Hoth', 'rebel', 'n');

insert into planet
values
('Bespin', 'independent', 'n');

insert into planet
values
('Yavin', 'rebel', 'n');

insert into planet
values
('Coruscant', 'empire', 'n');

insert into planet
values
('Jakku', 'raider', 'n');

insert into planet
values
('Takadona', 'independent', 'n');

insert into planet
values
('Hosnian Prime', 'rebel', 'y');

insert into planet
values
('Tatooine', 'raider', 'n');

insert into planet
values
('Kashyyyk', 'rebel', 'n');

insert into planet
values
('Endor', 'empire', 'n');

insert into planet
values
('Geonosis', 'empire', 'n');

insert into planet
values
('Dagobah', 'independent', 'n');

insert into planet
values
('Dantooine', 'empire', 'n');

insert into planet
values
('Kamino', 'empire', 'n');

insert into planet
values
('Mustafar', 'empire', 'n');

insert into planet
values
('Utapau', 'empire', 'n');
--end planets


-- employees : 15
insert into employee	
values
	(0001, sysdate, DEFAULT, 
	'Carl', 'Sagan', 'blood and viscera cleanup', 
	DEFAULT, 'c', 'Alderaan');

insert into employee	
values
	(0002, sysdate, DEFAULT, 
	'Jebidah', 'Porkins', 'tie fighter pilot', 
	DEFAULT, 'o', 'Bespin');

insert into employee	
values
	(0003, sysdate, DEFAULT, 
	'Jeff', 'Lebowski', 'Climate Control Operator', 
	DEFAULT, 'e', 'Hoth');

insert into employee	
values
	(0004, sysdate, DEFAULT, 
	'Maximum', 'Damage', 'Customer Relations', 
	DEFAULT, 'h', 'Yavin');

insert into employee	
values
	(0005, sysdate, DEFAULT, 
	'Darth', 'Mary', 'Prisoner Transport', 
	DEFAULT, 'e', 'Coruscant');

insert into employee	
values
	(0006, sysdate, DEFAULT, 
	'Totally', 'NotaSpy', 'Engineering', 
	DEFAULT, 'c', 'Jakku');

insert into employee	
values
	(0007, sysdate, DEFAULT, 
	'Jeremey', 'Highwater', 'Operations Planning', 
	DEFAULT, 'o', 'Takadona');

insert into employee	
values
	(0008, sysdate, DEFAULT, 
	'Windlass', 'Harivar', 'Hand to Hand combat', 
	DEFAULT, 'h', 'Hosnian Prime');	

insert into employee	
values
	(0009, sysdate, DEFAULT, 
	'Echo', DEFAULT, 'Camp Follower', 
	DEFAULT, 'c', 'Tatooine');	

insert into employee	
values
	(0010, sysdate, DEFAULT, 
	'Crill', DEFAULT, 'Tool Degreaser', 
	DEFAULT, 'e', 'Kashyyyk');	

insert into employee	
values
	(0011, sysdate, DEFAULT, 
	'Badu', 'Vespers', 'Interrogation Suggester', 
	DEFAULT, 'e', 'Geonosis');

insert into employee	
values
	(0012, sysdate, DEFAULT, 
	'Hils', 'Hodgins', 'Morale Monitor', 
	DEFAULT, 'o', 'Endor');

insert into employee	
values
	(0013, sysdate, DEFAULT, 
	'Steve', DEFAULT, 'Spy', 
	DEFAULT, 'h', 'Dantooine');

insert into employee	
values
	(0014, sysdate, DEFAULT, 
	'27f48', DEFAULT, 'Storm Trooper', 
	DEFAULT, 'e', 'Kamino');	

insert into employee	
values
	(0015, sysdate, DEFAULT, 
	'Nathaniel', 'Clemens', 'Mechanic', 
	DEFAULT, 'c', 'Utapau');
-- end employees

-- distincts

-- imperial_officer_emp : 3
insert into imperial_officer_emp
values
(0002, 'OS1');

insert into imperial_officer_emp
values
(0007, 'OS5');

insert into imperial_officer_emp
values
(0012, 'OS4');
-- end imperial_officer_emp


-- enlisted_emp
insert into enlisted_emp
values
(0003, 3500.87);

insert into enlisted_emp
values
(0005, 2600.90);

insert into enlisted_emp
values
(0010, 8900.47);

insert into enlisted_emp
values
(0011, 9400.82);

insert into enlisted_emp
values
(0014, 2202.00);
-- end enlisted_emp


-- hourly_emp
insert into hourly_emp
values
(0004, 62);

insert into hourly_emp
values
(0008, 24);

insert into hourly_emp
values
(0013, 56);
-- end hourly_emp


-- contractor_emp
insert into contractor_emp
values
(0001, 'Lunar Industry', 'Ultraviolet');

insert into contractor_emp
values
(0006, 'Initech', 'Violet');

insert into contractor_emp
values
(0009, 'Tyrell Corp', 'Orange');

insert into contractor_emp
values
(0015, 'Weyland Yutani', 'Green');
-- end contractor_emp


-- promotion : 10
insert into promotion
values
	('aa101', 'blood and viscera cleanup', 
	'unknown fluids maintenance', sysdate, 0001);

insert into promotion
values
	('aa102', 'unknown fluids maintenance', 
	'Janitor', sysdate, 0001);

insert into promotion
values
	('aa103', 'Climate Control Operator', 
	'Waterboarding Tech', sysdate, 0003);

insert into promotion
values
	('aa104', 'Customer Relations', 
	'Customer Complaints', sysdate, 0004);

insert into promotion
values
	('aa105', 'Prisoner Transport', 
	'Prisoner Encouragement', sysdate, 0005);

insert into promotion
values
	('aa106', 'Engineering', 
	'Sub Orbital Engineer', sysdate, 0006);

insert into promotion
values
	('aa107', 'Operations Planning', 
	'Operations Execution', sysdate, 0007);

insert into promotion
values
	('aa108', 'Hand to Hand combat', 
	'Advanced Judo Techniques', sysdate, 0008);

insert into promotion
values
	('aa109', 'Camp Follower', 
	'Madamme', sysdate, 0009);

insert into promotion
values
	('aa110', 'Tool Degreaser', 
	'Tool Sharpener', sysdate, 0010);
-- end promotion


-- destruction_level_event : 10
insert into destruction_level_event
values
('EXPLOSIVE ELK', sysdate, 1154, 1240, 'Alderaan', 0012 );

insert into destruction_level_event
values
('TUNDRA GAZELLE', DEFAULT, 0, 0, 'Yavin', 0002 );

insert into destruction_level_event
values
('CORAL ORCA', DEFAULT, 0, 0, 'Endor', 0012 );

insert into destruction_level_event
values
('MOUNTAIN PACKET', sysdate, 954, 9940, 'Hosnian Prime', 0007 );

insert into destruction_level_event
values
('BAD TIGER', DEFAULT, 0, 0, 'Utapau', 0002 );

insert into destruction_level_event
values
('HIDDEN WIZARD', DEFAULT, 0, 0, 'Bespin', 0012 );

insert into destruction_level_event
values
('BLUE STAG', DEFAULT, 0, 0, 'Dagobah', 0012 );

insert into destruction_level_event
values
('GLASS LEOPARD', DEFAULT, 0, 0, 'Takadona', 0002 );

insert into destruction_level_event
values
('SCHEMING WILDCAT', DEFAULT, 0, 0, 'Kashyyyk', 0007 );

insert into destruction_level_event
values
('WANING PIRANHA', DEFAULT, 0, 0, 'Jakku', 0007 );

-- end destruction_level_event



-- meeting : 10
insert into meeting 
values
('ech01', 'y', sysdate, 'Morale', 'alpha 5', 0002);

insert into meeting 
values
('ech02', 'n', sysdate, 'Best Practices', 'bravo 2', 0001);

insert into meeting 
values
('ech03', 'n', sysdate, 'Helmet Visors', 'delta 9', 0011);

insert into meeting 
values
('ech04', 'n', sysdate, 'Casual Fridays', 'delta 9', 0014);

insert into meeting 
values
('ech05', 'y', sysdate, 'Incentives', 'fox 1', 0007);

insert into meeting 
values
('ech06', 'n', sysdate, 'Holes in Design', 'delta 9', 0012);

insert into meeting 
values
('ech07', 'n', sysdate, 'Bothan Equality', 'bravo 2', 0004);

insert into meeting 
values
('ech08', 'n', sysdate, 'Forcing the force', 'alpha 3', 0012);

insert into meeting 
values
('ech09', 'y', sysdate, 'British Accents', 'delta 8', 0005);

insert into meeting 
values
('ech10', 'n', sysdate, 'Reactors and You', 'fox 4', 0009);
-- end meeting



-- employee_email : 10
insert into employee_email
values
(0009, 'harlotbusspy@dsmail.org');

insert into employee_email
values
(0008, 'majorslackspy@dsmail.org');

insert into employee_email
values
(0004, 'secretarydashcube@dsmail.org');

insert into employee_email
values
(0002, 'paverprints@dsmail.org');

insert into employee_email
values
(0001, 'icleandeadpeople@dsmail.org');

insert into employee_email
values
(0006, 'fabricatedidentity@dsmail.org');

insert into employee_email
values
(0012, 'happyorhermoraging@dsmail.org');

insert into employee_email
values
(0013, 'expertatcoffeespy@dsmail.org');

insert into employee_email
values
(0015, 'fabricatorupload@dsmail.org');

insert into employee_email
values
(0007, 'hermitterminal@dsmail.org');
-- end employee_email




-- meeting_with_employees
insert into meeting_with_employees
values
(0001, 'ech01');

insert into meeting_with_employees
values
(0013, 'ech01');

insert into meeting_with_employees
values
(0004, 'ech02');

insert into meeting_with_employees
values
(0011, 'ech03');

insert into meeting_with_employees
values
(0005, 'ech07');

insert into meeting_with_employees
values
(0015, 'ech07');

insert into meeting_with_employees
values
(0010, 'ech08');

insert into meeting_with_employees
values
(0001, 'ech10');

insert into meeting_with_employees
values
(0004, 'ech10');

insert into meeting_with_employees
values
(0007, 'ech09');
-- end meeting_with_employees


-- dle_with_employees : 10
insert into dle_with_employees
values 
(0001, 'TUNDRA GAZELLE');

insert into dle_with_employees
values 
(0003, 'TUNDRA GAZELLE');

insert into dle_with_employees
values 
(0011, 'CORAL ORCA');

insert into dle_with_employees
values 
(0014, 'MOUNTAIN PACKET');

insert into dle_with_employees
values 
(0015, 'BAD TIGER');

insert into dle_with_employees
values 
(0004, 'HIDDEN WIZARD');

insert into dle_with_employees
values 
(0003, 'WANING PIRANHA');

insert into dle_with_employees
values 
(0001, 'GLASS LEOPARD');

insert into dle_with_employees
values 
(0013, 'BLUE STAG');

insert into dle_with_employees
values 
(0010, 'SCHEMING WILDCAT');
-- end dle_with_employees


--sequence to populate automatically EOTM ids
drop sequence auto_eotm_id;

CREATE SEQUENCE auto_eotm_id
MINVALUE 100
START WITH 100
INCREMENT BY 1
CACHE 10;
-- end sequence


-- employee_of_the_month : 10
insert into employee_of_the_month
values
(auto_eotm_id.nextval, 'sep', 3437, 0001);

insert into employee_of_the_month
values
(auto_eotm_id.nextval, 'aug', 3437, 0015);

insert into employee_of_the_month
values
(auto_eotm_id.nextval, 'oct', 3437, 0013);

insert into employee_of_the_month
values
(auto_eotm_id.nextval, 'dec', 3437, 0008);

insert into employee_of_the_month
values
(auto_eotm_id.nextval, 'jan', 3438, 0002);

insert into employee_of_the_month
values
(auto_eotm_id.nextval, 'feb', 3438, 0005);

insert into employee_of_the_month
values
(auto_eotm_id.nextval, 'mar', 3438, 0004);

insert into employee_of_the_month
values
(auto_eotm_id.nextval, 'apr', 3438, 0003);

insert into employee_of_the_month
values
(auto_eotm_id.nextval, 'may', 3438, 0009);

insert into employee_of_the_month
values
(auto_eotm_id.nextval, 'jun', 3438, 0011);
-- end employee_of_the_month