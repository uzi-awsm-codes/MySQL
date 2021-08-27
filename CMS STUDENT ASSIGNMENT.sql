create database student;

use student;

/*
create table COURSE_INFO (
COURSE_CODE varchar(10) PRIMARY KEY,
COURSE_NAME varchar(20) NOT NULL,
COURSE_DESCRIPTION varchar(25),
COURSE_START_DATE date,
COURSE_DURATION int,
NO_OF_PARTICIPANTS int,
COURSE_TYPE char(3)
);

INSERT INTO COURSE_INFO VALUES('1','CSE','computer science','2000-08-09','4','10','eng');
INSERT INTO COURSE_INFO VALUES('2','ECE','Electronic Comunication','2001-08-09','4','9','eng');
INSERT INTO COURSE_INFO VALUES('3','EEE','Electrical Electronics','2000-09-09','4','8','eng');
INSERT INTO COURSE_INFO VALUES('4','BCA','computer Application','2000-08-17','3','7','bch');
INSERT INTO COURSE_INFO VALUES('5','BBM','Buisness Management','2004-08-09','3','10','bui');

create table STUDENT_INFO (
STUDENT_ID varchar(10) PRIMARY KEY,
FIRST_NAME varchar(20),
LAST_NAME varchar(25),
ADDRESS varchar(150)
);

INSERT INTO STUDENT_INFO VALUES('101','Uzair','Ahmed','1395 Hassan');
INSERT INTO STUDENT_INFO VALUES('102','vinod','J','banglore');
INSERT INTO STUDENT_INFO VALUES('103','hyma','k','chennai');
INSERT INTO STUDENT_INFO VALUES('104','tabasum','shek','hyderabad');
INSERT INTO STUDENT_INFO VALUES('105','sindu','sindu','pune');

create table STUDENT_COURSES (
STUDENT_ID varchar(10),
COURSE_CODE varchar(20),
CONSTRAINT FK_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_INFO(STUDENT_ID),
CONSTRAINT FK_COURSE_CODE FOREIGN KEY (COURSE_CODE) REFERENCES COURSE_INFO(COURSE_CODE)
);


-- create table STUDENT_COURSES (
-- STUDENT_ID varchar(10) FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_INFO(STUDENT_ID),
-- COURSE_CODE varchar(20) FOREIGN KEY (COURSE_CODE) REFERENCES COURSE_INFO(COURSE_CODE)
-- );


INSERT INTO STUDENT_COURSES VALUES('101','1');
INSERT INTO STUDENT_COURSES VALUES('102','1');
INSERT INTO STUDENT_COURSES VALUES('103','2');
INSERT INTO STUDENT_COURSES VALUES('104','4');
INSERT INTO STUDENT_COURSES VALUES('105','4');

create table COURSE_FEES (
COURSE_CODE varchar(10),
BASE_FEES int(10),
SPECIAL_FEES int(10),
DISCOUNT int(10),
CONSTRAINT FK_COURSE_CODE2 FOREIGN KEY (COURSE_CODE) REFERENCES COURSE_INFO(COURSE_CODE),
CONSTRAINT CK_BASE_FEES CHECK(BASE_FEES >= 15000 AND BASE_FEES > SPECIAL_FEES),
CONSTRAINT CK_DISCOUNT CHECK(DISCOUNT >= 5 AND DISCOUNT <= 15)
);

INSERT INTO COURSE_FEES VALUES('1','15000','5000','10');
INSERT INTO COURSE_FEES VALUES('2','19000','4000','8');
INSERT INTO COURSE_FEES VALUES('3','20000','1000','14');
INSERT INTO COURSE_FEES VALUES('4','25000','2000','13');
INSERT INTO COURSE_FEES VALUES('5','16000','3000','9');

 
create table COURSE_FEES_HISTORY (
COURSE_CODE varchar(10),
BASE_FEES int(10),
SPECIAL_FEES int(10),
CREATED_BY varchar(10),
UPDATED_BY varchar(10),
CONSTRAINT FK_COURSE_CODE3 FOREIGN KEY (COURSE_CODE) REFERENCES COURSE_INFO(COURSE_CODE)
);

INSERT INTO COURSE_FEES_HISTORY VALUES('1','18000','5000','Ram','Ramesh');
INSERT INTO COURSE_FEES_HISTORY VALUES('2','15000','3000','bala','Ram');
INSERT INTO COURSE_FEES_HISTORY VALUES('2','16000','2000','Ramesh','bala');
INSERT INTO COURSE_FEES_HISTORY VALUES('3','15000','5000','vinod','Ramesh');
INSERT INTO COURSE_FEES_HISTORY VALUES('5','19000','1000','Ram','vinod');

-- drop database student;

SELECT * 
FROM COURSE_INFO
WHERE COURSE_NAME = 'cse';
*/

-- hands on 1 --------------------------------------------------------------------------------
-- 1
SELECT COURSE_CODE, (BASE_FEES+SPECIAL_FEES) AS TOTAL_FEES
FROM COURSE_FEES;

-- 2
SELECT COURSE_CODE, DISCOUNT*(BASE_FEES+SPECIAL_FEES)/100 AS DISCOUNT
FROM COURSE_FEES;

-- 3
SELECT COURSE_NAME
FROM COURSE_INFO
WHERE COURSE_DURATION > 10 AND NO_OF_PARTICIPANTS < 20;

-- 4
SELECT COURSE_CODE
FROM COURSE_FEES
WHERE BASE_FEES >= 100 AND SPECIAL_FEES <= 1000;

-- 5
SELECT COURSE_CODE
FROM COURSE_FEES
WHERE BASE_FEES > 200;

-- 6
SELECT STUDENT_ID, FIRST_NAME
FROM STUDENT_INFO
WHERE FIRST_NAME != LAST_NAME

-- 7
SELECT COURSE_CODE
FROM COURSE_FEES
WHERE BASE_FEES >=100 AND BASE_FEES <=300;

-- 8
SELECT STUDENT_ID, FIRST_NAME
FROM STUDENT_INFO
WHERE FIRST_NAME LIKE 'a%';

-- 9
SELECT STUDENT_ID, FIRST_NAME
FROM STUDENT_INFO
WHERE FIRST_NAME LIKE '%o%';

-- 10
SELECT COURSE_NAME
FROM COURSE_INFO
WHERE COURSE_DESCRIPTION IS NULL;

-- UNION
SELECT COURSE_CODE, BASE_FEES FROM COURSE_FEES
UNION
SELECT COURSE_CODE, BASE_FEES FROM COURSE_FEES_HISTORY;

-- hands on 2 --------------------------------------------------------------------

 -- x 7 
 
INSERT INTO COURSE_FEES VALUES('6',null,'5000','10');
INSERT INTO COURSE_FEES VALUES('7',null,'4000','8');

INSERT INTO COURSE_FEES VALUES('9','300','5000','10');
INSERT INTO COURSE_FEES VALUES('10','175','4000','8');

alter table course_fees  
add( infra_fees float(5,3));

update course_fees set infra_fees = 45.751 where course_code = 1;
update course_fees set infra_fees = 43.731 where course_code = 2;
update course_fees set infra_fees = 41.451 where course_code = 3;
update course_fees set infra_fees = 52.751 where course_code = 4;
update course_fees set infra_fees = 40.751 where course_code = 5;

-- 1
select count(*)
from course_info;

-- 2
select sum(base_fees)
from course_fees;

-- 3
select min(base_fees),max(base_fees)
from course_fees;

-- 4
select avg(infra_fees)
from course_fees;

-- 5
select course_name, round(infra_fees, 1)
from course_fees f, course_info i
where f.course_code = i.course_code;

select course_name, round(infra_fees, 1)
from course_fees join course_info using(course_code);


-- 6 in oracle init() can be used
select concat( ucase( left( course_name,1 )),lcase(substring( course_name,2 ))), infra_fees
from course_info i join course_fees f
on i.course_code = f.course_code;

-- 7 x
select course_name, (current_date - course_start_date) as no_of_days
from course_info;

-- 8
select concat(COURSE_NAME,COURSE_CODE)
from course_info;

-- 9
select upper(course_name)
from course_info;

-- 10
select substring(course_description,1,3)
from course_info;

-- 11
select avg(base_fees)
from course_fees
where base_fees is not null;

-- 12
select course_name, case course_type
					when 'eng' then 'Engineering'
					when 'bui' then 'Buisness'
					when 'bca' then 'Computer application'
                    end result
from course_info;

-- 13
select cast(student_id as unsigned int)+100000
from student_info;

-- 14
select concat(' The base fees amount for the course ', ci.course_name,' is ', cf.base_fees)
from course_info ci, course_fees cf
where ci.course_code = cf.course_code;

-- hands on 3 ---------------------------------------------------------------------
-- x 5

-- 1
select sum(no_of_participants), course_start_date
from course_info
group by course_start_date;

-- 2
select sum(no_of_participants), course_start_date
from course_info
where course_type = 'eng'
group by course_start_date;

-- 3
select sum(no_of_participants), course_start_date
from course_info
where course_type = 'eng'
group by course_start_date
having sum(no_of_participants) >  10;

-- 4
select course_code, course_name, course_start_date, course_duration, no_of_participants, course_type
from course_info
order by course_duration;

-- 5
select si.first_name, c.course_code, c.course_name, f.base_fees
from student_info si, student_courses sc, course_info c, course_fees f
where si.student_id = sc.student_id and sc.course_code = c.course_code and sc.course_code = f.course_code
order by f.base_fees desc;

select first_name, course_code, course_name, base_fees
from student_info join student_courses  
using(student_id) join course_info
using(course_code) join course_fees
using(course_code)
order by base_fees desc;

-- hands on 4 ----------------------------------------------------------------

-- 1
select student_id, first_name, last_name, course_code
from student_info join student_courses
using(student_id)
where course_code = 167;

-- 2
select course_description, discount
from course_info join course_fees
using(course_code);

-- 3
select first_name, course_code
from student_info join student_courses
using(student_id) join course_info
using(course_code);

select first_name, course_code
from student_info left join student_courses
using(student_id) left join course_info
using(course_code);

select first_name, course_code
from course_info  right join student_courses
using(course_code) right join student_info
using(student_id);

-- ---------------------------------------------------------------------
-- 1
select STUDENT_ID, FIRST_NAME
from student_info join student_courses
using(STUDENT_ID) join course_fees
using(course_code) 
where BASE_FEES < 19000;


-- 2
select s.student_id,s.first_name,
count(sc.course_code)
from student_info s join student_courses sc
on s.student_id=sc.student_id join course_fees cf
on cf.course_code=sc.course_code
where cf.base_fees < 19000
group by s.student_id,s.first_name
having count(sc.course_code)>=1;

-- --------------------------------------------------------------------------
-- 1
CREATE VIEW  crs_info AS
SELECT COURSE_CODE, COURSE_NAME, COURSE_DESCRIPTION
FROM course_info 
WHERE COURSE_CODE > 167;

-- 2
CREATE VIEW fees_view AS
SELECT COURSE_CODE, COURSE_NAME, BASE_FEES, SPECIAL_FEES
FROM course_info join course_fees using(COURSE_CODE);

-- 3
DROP VIEW fees_view;

-- 4
CREATE INDEX crs_descn
ON course_info (COURSE_DESCRIPTION);

-- 5
DROP INDEX crs_descn ON course_info;

-- 6
CREATE UNIQUE INDEX crs_descn
ON course_info (COURSE_DESCRIPTION);