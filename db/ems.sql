-- create database ems;
-- use ems;

/*
create table countries
(
 country_id char(2) primary key,
 country_name varchar(40),
 region_id int
);

insert into countries values('CA','Canada',2);
insert into countries values('DE','Germany',1);
insert into countries values('UK', 'United kingdom',1);
insert into countries values('US', 'United States of America ',2);
------------------------------------------------------------------------------
create table departments(
department_id int primary key,
department_name varchar(30) not null,
location_id int
);

insert into departments values(10,'Administration',1700);
insert into departments values(20,'Marketing',1800);
insert into departments values(50,'Shipping',1500);
insert into departments values(60,'IT',1400);
insert into departments values(80,'Sales',2500);
insert into departments values(90,'Executive',1700);
insert into departments(Department_id,Department_name,Location_id) values(190,'Contracting','1700');
insert into departments values(110,'Accounting',1700);
------------------------------------------------------------------------------
create table employees(
employee_id int not null,
first_name varchar(20),
last_name varchar(25) not null,
email varchar(25) not null,
phone_number varchar(20),
hire_date date not null,
job_id varchar(10) not null,
salary double,
commission_pct double,
manager_id int,
department_id int,
constraint emp_pk primary key(employee_id));

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,department_id) values(100,'Steven','King','Sking','515.123.4567',
'1987-06-17','AD_PRES',24000,90);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(101,'Neena','Kochhar','NKOCHHAR','515.123.4568',
'1989-09-21','AD_VP',17000,100,90);


insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(102,'Lex','De Haan','LDEHAAN','515.123.4569',
'1993-01-13','AD_VP',17000,100,90);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(103,'Alexander','AHUNOLD','A','590.423.4567',
'1990-01-03','IT_PROG',9000,102,60);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(104,'Bruce','Ernst','BERNST','590.423.4568',
'1991-05-21','IT_PROG',6000,103,60);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(107,'Diana','Lorentz','DLORENTZ','590.423.5567',
'1999-02-07','IT_PROG',4200,103,60);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(124,'Kevin','Mourgos','KMOURGOS','650.123.5234',
'1999-11-16','ST_MAN',5800,100,50);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(141,'Trenna','Rajs','TRAJS','650.121.8009',
'1995-10-17','ST_CLERK',3500,124,50);


insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(142,'Curtis','Davies','CDAVIES','650.121.2994',
'1997-01-29','ST_CLERK',3100,124,50);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(143,'Randall','Matos','RMATOS','650.121.2874',
'1998-03-15','ST_CLERK',2600,124,50);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(144,'Peter','Vargas','PVARGAS','650.121.2004',
'1998-06-09','ST_CLERK',2500,124,50);
	
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,commission_pct,manager_id,department_id) values(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','2000-01-29','SA_MAN',10500,.2,100,80);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,commission_pct,manager_id,department_id) values(174,'Ellen','Abel','EABEL','011.44.1644.429263','1996-05-11','SA_REP',11000,.3,149,80);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,commission_pct,manager_id,department_id) values(176,'Jonathan','Taylor','JTAYLOR','011.44.1644.429265','1998-03-24','SA_REP',8600,.2,149,80);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,commission_pct,manager_id) values(178,'Kimberely','Grant','KGRANT','011.44.1644.429263','1999-05-24','SA_REP',7000,.15,149);
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(200,'Jennifer','Whalen','JWHALEN','515.123.4444','1987-09-17','AD_ASST',4400,101,10);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(201,'Michael','Hartstein','JWHALEN','515.123.5555','1996-02-17','MK_MAN',13000,100,20);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(202,'Pat','Fay','PFAY','603.123.6666','1997-08-17','MK_REP',6000,201,20);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(205,'Shelley','Higgins','SHIGGINS','515.123.8080','1994-06-07','AC_MGR',12000,101,110);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(206,'William','Gietz','WGIETZ','515.123.8181','1994-06-07','AC_ACCOUNT',8300,205,110);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values(106,'Bruce','Ernst','BERNST','590.423.4568',
'1991-05-21','IT_PROG',9000,103,60);

------------------------------------------------------------------------------


create table jobs(
job_id varchar(10) not null,
job_title varchar(35) not null,
min_salary int,
max_salary int);


insert into jobs values('AD_PRES','President',20000,40000);
insert into jobs values('AD_MGR','Accounting Manager',8200,16000);
insert into jobs values('AD_VP','Administration Vice President',15000,30000);
insert into jobs values('AD_ASST','Administration Assiatant',3000,6000);
insert into jobs values('AC_ACCOUNT','Public Accountant',4200,9000);
insert into jobs values('SA_MAN','Sales Manager',10000,20000);
insert into jobs values('SA_REP','Sales Representative',6000,12000);
insert into jobs values('ST_MAN','Stock Manager',5500,8500);
insert into jobs values('ST_CLERK','Stock Clerk',2000,5000);
insert into jobs values('IT_PROG','Programmer',4000,10000);
insert into jobs values('MK_MAN','Marketing Manager',9000,15000);
insert into jobs values('MK_REP','Marketing  Representative',4000,9000);

------------------------------------------------------------------------------

create table job_grades
(
   grade_level varchar(3),
lowest_sal int,
highest_sal int);

insert into job_grades values('A',1000,2999);
insert into job_grades values('B',3000,5999);
insert into job_grades values('C',6000,9999);
insert into job_grades values('D',10000,14999);
insert into job_grades values('E',15000,24999);
insert into job_grades values('F',25000,40000);
------------------------------------------------------------------------------
CREATE TABLE JOB_HISTORY(
EMPLOYEE_ID int NOT NULL,
START_DATE DATE NOT NULL,
END_DATE DATE NOT NULL,
JOB_ID VARCHAR(20) NOT NULL,
DEPARTMENT_ID int);

INSERT INTO JOB_HISTORY VALUES(102,'93-01-13','98-07-24','IT_PROG',60);
INSERT INTO JOB_HISTORY VALUES(101,'89-09-21','93-10-27','AC_ACCOUNT',110);
INSERT INTO JOB_HISTORY VALUES(101,'93-10-21','97-03-15','AC_MGR',110);
INSERT INTO JOB_HISTORY VALUES(201,'96-02-17','99-12-19','MK_REP',20);
INSERT INTO JOB_HISTORY VALUES(114,'98-03-24','99-12-31','ST_CLERK',50);
INSERT INTO JOB_HISTORY VALUES(122,'99-01-01','99-12-31','ST_CLERK',50);
INSERT INTO JOB_HISTORY VALUES(200,'87-09-17','93-01-17','AD_ASST',90);
INSERT INTO JOB_HISTORY VALUES(176,'98-03-24','98-12-31','SA_REP',80);
INSERT INTO JOB_HISTORY VALUES(176,'99-01-01','99-12-31','SA_MAN',80);
INSERT INTO JOB_HISTORY VALUES(200,'94-07-01','98-12-31','AC_ACCOUNT',90);

------------------------------------------------------------------------------
CREATE TABLE LOCATIONS(
LOCATION_ID int NOT NULL,
STREET_ADDRESS VARCHAR(40),
POSTAL_CODE VARCHAR(12),
CITY VARCHAR(30) NOT NULL,
STATE_PROVINCE VARCHAR(25),
COUNTRY_ID CHAR(2));
INSERT INTO LOCATIONS VALUES(1400,'2014 Jabberwocky Rd', '26192','Southlake', 'Texas','US');
INSERT INTO LOCATIONS VALUES(1500,'2011 Interiors Blvd', '99236','South San Francisco', 'California','US');
INSERT INTO LOCATIONS VALUES(1700,'2004 Charade Rd', '96199','Seattle', 'Washinghton','US');
INSERT INTO LOCATIONS VALUES(1800,'460 Bloor St.W.', 'ON M5S 1X8','Toronto', 'Ontario','CA');
INSERT INTO LOCATIONS VALUES(2500,'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB','Oxford', 'Oxford','UK');
------------------------------------------------------------------------------
create table regions
(
 region_id varchar(25) not null,
region_name varchar(25));

insert into regions values('1','Europe');
insert into regions values('2','Americas');
insert into regions values('3','Asia');
insert into regions values('4','Middle East and Africa');
------------------------------------------------------------------------------
*/

-- drop database ems;

use ems;