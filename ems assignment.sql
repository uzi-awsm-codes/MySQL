-- create database ems;
use ems;

set sql_mode= only_full_group_by;

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

-- drop database ems;

------------------------------------------------------------------------------
*/

-- hands on 1 ---------------------------------------------------------------------------------------------------------

-- 1 Display the names of all employees with exactly 4 letters in their name. 
select first_name, last_name
from employees
where length(first_name) = 4;

-- 2 Display the name and hire dates of all employees hired in 1981 or 1982. 
select first_name, last_name, hire_date
from employees
where hire_date like '1981%' or hire_date like '1982%';

-- 3 Display name, deptno, earned commission for each salesman in reverse salary order. 
select first_name, last_name, department_id, commission_pct, salary
from employees
order by salary desc;

-- 4 List the employees who joined before 1981.  
SELECT * FROM employees
WHERE hire_date < '1981-01-01';

-- 5 List the id, name, salary, experience of all employees.  
SELECT e.employee_id, first_name, last_name, salary, (year(j.end_date) - year(j.start_date)) as experience  
FROM employees e, job_history j
where e.employee_id = j.employee_id;

-- 6 List the employees  who are joined in the year 90.  
SELECT * FROM employees
WHERE hire_date like '1990%';

-- 7 List the employees  who joined in the month of August. 
SELECT * FROM employees
WHERE hire_date like '%-08-%';

-- 8 List the employees  whose annual salary ranging from 22000 and 45000.  
select first_name, last_name
from employees
where salary between 22000 and 45000;

-- 9 List the employees  whose names having a character set ‘LL’ together. 
SELECT * FROM employees
WHERE first_name like '%ll%';

-- 10 List all the employees  except ‘PRESIDENT’ & ‘MGR”.  
select first_name, last_name
from employees e, jobs j
where e.job_id =j.job_id and (j.job_title != 'PRESIDENT' or j.job_title != 'MGR');

-- 11 List all the employees  who joined before or after 1981.  
-- !Q! 
SELECT * FROM employees
WHERE hire_date < '1981-01-01' and hire_date > '1981-12-31';

-- 11 
SELECT * FROM employees
WHERE hire_date not like '1981-%';

-- 12 List the employees  of deptno 30 or 10 joined in the year 1981.
SELECT * FROM employees
WHERE department_id = 30 or department_id = 10 and hire_date like '1981%';

-- hands on 2 ------------------------------------------------------------------------------------------------
/* 1.Display employee name,department no and earned commission for each salesman in reverse salary order */
select first_name, last_name, department_id, (salary * commission_pct), salary
from employees
order by salary desc;

/* 2.Display the department number, total salary payout and total commission payout for each department that pays at least one employee commission. */
select department_id, sum(salary) as 'salry' , sum(salary * commission_pct) as 'commission'
from employees
group by department_id
having count(department_id) >= 1 ;

/* 3.Display the employee id of each employee who manages other employees with the number of people he or she manages. */
select manager_id, count(employee_id) as no_of_emp
from employees
group by manager_id;

/*4.Repeat the display for the last question, but this time display the rows in descending order of the number of employees managed.*/
select manager_id, count(employee_id) as no_of_emp
from employees
group by manager_id
order by no_of_emp desc;

/*5.Display the names and job titles of all employees with the same job as Jones.*/
select first_name, last_name, job_title
from employees join jobs using(job_id)
where job_title = (select job_title
					from employees join jobs using(job_id)
                    where first_name = 'Neena');
                    
/*6. Display the names and department name of all employees working in the same departmentas Jones. */
select first_name, last_name, department_name
from employees join departments using(department_id)
where department_id = (select department_id
					from employees join departments using(department_id)
                    where first_name = 'Neena');
                    
/*7. Display the name of the employee whose salary is the lowest. */
select first_name, last_name
from employees 
where salary =(select min(salary) from employees);

/* 8. Display the names of all employees except the lowest paid. */
select first_name, last_name
from employees 
where salary !=(select min(salary) from employees);

/* 9. Display the names of all employees whose job title isthe same as anyone in the sales dept. */
select first_name, last_name
from employees join jobs
using(job_id)
where job_title in (select job_title
					from employees join jobs
					using(job_id) join departments
					using(department_id)
					where department_name = 'sales');

/* 10. Display the names of all employees with their job title, their current salary and their salary following a 10% pay raise for clerks and a 7% pay raise for all other employees. */
select first_name, last_name, job_title, salary as 'current salary',raise_percent, (salary+(salary * raise_percent/100)) as 'raise'
from (select *,IF(job_title like '%clerk%' ,10,7) as 'raise_percent' from employees join jobs using(job_id)) a;

/* 11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have 0 in the commission column. */
select first_name, last_name, salary, (salary * commision) as 'commission'
from (select *,ifnull(commission_pct,0) as commision from employees) a;

/* 12. Display all the unique job groups in the descending order */
select job_title
from jobs
order by job_title desc;

/* 13. List the employee no, name, salary, experienceof all employeesworking for manager 100. */
select employee_id, first_name, last_name, DATEDIFF(END_DATE,START_DATE)/365 as 'experience in years'
from employees join job_history using(EMPLOYEE_ID)
where manager_id = '100';

/* 14. List the employees along with their experience and daily salaryis more than Rs.100. */
select first_name, last_name, days/365 as 'experience', salary/days
from (select first_name, last_name, salary, DATEDIFF(END_DATE,START_DATE) as 'days' from employees join job_history using(EMPLOYEE_ID)) a
where salary/days > 10;

/*  15. List the employees who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in ascendingorder of seniority. */
select employee_id, first_name, last_name, hire_date
from employees
where hire_date = '1981-05-01' or hire_date = '1981-12-03' or hire_date = '1981-12-17'or hire_date = '1980-01-19'
order by hire_date;

/*  16. List all the employees except ‘PRESIDENT’ & ‘MGR” in ascendingorder of Salaries. */
select first_name, last_name
from employees e, jobs j
where e.job_id =j.job_id and (j.job_title != '%PRESIDENT%' or j.job_id != '%MGR%');

/*  17. List the employees whose employee no not starting with digit78. */
select employee_id, first_name, last_name
from employees 
where employee_id not like '78%';

/*  18. List the employees who are working under ‘MGR’. */
select employee_id, first_name, last_name, manager_id
from employees 
where manager_id =any( select employee_id from employees join jobs using(job_id) 
					where job_title like '%manager%');
					
/*  19. List the employees who joined in any year but not belongs to the month of March. */
select employee_id, first_name, last_name, hire_date
from employees
where month(hire_date) != '03';

/* 20. List the employees of department no 30 or 10 joined in the year 1981. */
SELECT * FROM employees
WHERE department_id = 30 or department_id = 10 and hire_date like '1981%';

/*  21. List the total information of EMP table along with DNAME and Loc of all the emps working under ‘ACCOUNTING’& ‘RESEARCH’ in the ascending order ofdepartment no. */
select employees.*, department_name, locations.*
from employees join departments 
using(department_id) join locations using(LOCATION_ID);

/*  22. List the employee no, employee name, salary, department name of all the ‘MGRS’ and ‘ANALYST’ working in New York, Dallas with an exp more than 7 years without receiving the comm ascendingorder of Loc. */
select employee_id, first_name, last_name, department_name, CITY, STATE_PROVINCE
from employees e join departments 
using(department_id) join locations 
using(LOCATION_ID) join job_history using(EMPLOYEE_ID)
where CITY='New York' and STATE_PROVINCE='Dallas' and DATEDIFF(END_DATE,START_DATE)/365 >7 and (e.job_id = '%MGRS%'  or e.job_id = '%ANALYST%');

/*  23. Display the employee no, name, salary, dept.nodept.name, location, job of all employeesworking at CJICAGO or working for ACCOUNTING dept with Ann Sal>28000, and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the ascendingorder of dept.no and desc order of job. */
select employee_id, first_name, last_name, salary, e.department_id, department_name, locations.*, job_title
from employees e join departments 
using(department_id) join locations 
using(LOCATION_ID) join jobs using(JOB_ID)
where CITY='CJICAGO' or department_name ='Accounting';

/*  24. List the details of the Depts along with Empno, Ename or without the emps */
select departments.*, employee_id, first_name, last_name
from departments left join employees using(department_id);

/*  25. List the details of the emps whose Salaries more than the employee BLAKE. */
select *
from employees
where salary < (select salary from employees where first_name='Steven' or last_name='Steven');

/*  26. List the emps whose Jobs are same as ALLEN. */
select *
from employees join jobs using(job_id)
where job_title =(select job_title from employees join jobs using(job_id) 
					where first_name='Steven' or last_name='Steven');


/*  27. List the emps who are senior to King. */
select *
from employees
where hire_date <(select hire_date from employees 
					where first_name='King' or last_name='King');

/*  28. List the Emps who are senior to their own MGRS. */
select e.first_name, e.hire_date, mgr.first_name, mgr.hire_date
from employees e join employees mgr on e.manager_id=mgr.employee_id
where e.hire_date<mgr.hire_date;

/*  29. List the Emps of Deptno 20 whose Jobs are same as Deptno10. */
select e.employee_id, first_name, last_name, e.department_id, job_title
from employees e join departments 
using(department_id) join jobs using(job_id)
where department_id ='50' and job_title = any(select job_title
											from employees join departments 
											using(department_id) join jobs using(job_id)
                                            where department_id ='10');

/*  30. List the Emps whose Sal is same as FORD or SMITH in desc order of Sal. */
select *
from employees
where salary =any (select salary from employees where first_name='FORD' or last_name='FORD' or first_name='SMITH' or last_name='SMITH');

/*  31. List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN. */
select *
from employees join jobs using(job_id)
where job_title =(select job_title from employees join jobs using(job_id) 
					where first_name='MILLER' or first_name='Sal');

/*  32. List the Emps whose Sal is > the total remuneration of the SALESMAN. */
select *
from employees 
where salary > (select sum(salary) from employees join departments using(department_id) where department_name = 'Shipping');


/*  33. List the emps who are senior to BLAKE working at CHICAGO & BOSTON. */
select *
from employees join departments 
using(department_id) join locations using(LOCATION_ID)
where city = 'Seattle' or city = 'BOSTON' and hire_date < (select hire_date from employees 
															where first_name = 'Diana');

/*  34. List the emps whose jobs same as SMITH or ALLEN. */
select *
from employees join jobs using(job_id)
where job_title =(select job_title from employees join jobs using(job_id) 
					where first_name='SMITH' or first_name='ALLEN');

/*  35. Any jobs of deptno 10 those that are not found in deptno 20. */
select job_title
from departments join employees 
using(department_id) join jobs using(job_id)
where job_title !=any (select job_title from 
					(select * from departments join employees 
					using(department_id) join jobs using(job_id)) a 
                    where department_id=10);

/*  36. Find the highest salaryof EMP table. */
select max(salary)
from employees;

/*  37. Find details of highest paid employee. */
select *
from employees
where salary = (select max(salary)
				from employees);

/*  38. Find the highest paid employee of sales department. */
select *
from employees join departments using(department_id)
where department_name = 'sales' and salary = (select max(salary)
												from employees);


/*  39. List the most recently hired emp who belongs to location CHICAGO. */
select *
from employees join departments 
using(department_id) join locations using(location_id)
where hire_date = ( select max(hire_date)
					from (select * from employees join departments 
						using(department_id) join locations using(location_id)
						where CITY = 'Southlake' ) a);

/*  40. List the details of the senior employee belongs to 1981. */
select *
from employees 
where hire_date = (select max(hire_date)
					from employees 
					where year(hire_date) = '1996');

/*  41. List the employees who joined in 1981 with the job same as the most senior person of the year 1981. */
select first_name from employees where year(hire_date) = 1991 and 
job_id =any (select job_id from employees where 
			hire_date =(select min(hire_date) from employees 
						where year(hire_date)=1991));

/*  42. Find the total annual sal to distribute job wise in the year 81. */
select sum(salary), job_id
from employees
where year(hire_date) = '1991'
group by job_id;

/*  43. Display the average salaries of all the clerks. */
select avg(salary)
from employees join jobs using(job_id)
where job_title like '%clerk%';

/*  44. List the employee in dept 20 whose salary is >the average salary0f dept 10 emps. */
select *
from employees 
where department_id = 20 and salary > (select avg(salary) from employees where department_id = 10);

/*  45. Display the number of employees for each job group dept.no wise. */
select count(employee_id), job_id, department_id
from employees
group by department_id,job_id
order by department_id

/*  46. List the manager no and the number of employees working for those mgrs in the ascending manager no. */
select manager_id, count(employees.employee_id) as 'cnt'
from employees
group by manager_id
order by manager_id;

/*  47. List the department details where at least two emps are working */
select count(e.department_id) as 'cnt', departments.*
from departments join employees e using(department_id)
group by department_id
having cnt >= 2;

/*  48. Display department name, no. of emps where at least two emps are clerks. */
select count(e.department_id) as 'cnt', departments.*
from departments join employees e 
using(department_id) join jobs using(job_id)
where job_title = '%clerk%'
group by department_id
having cnt >= 2;

/* !X! 49. List the details of the department where maximum number of emps are working. */
select count(e.department_id) as 'cnt', departments.*
from departments join employees e using(department_id)
group by department_id
having min(cnt);

/*  50.Display total salary of employees belonging to grade A. */
select employees.*
from job_grades, employees
where salary >= lowest_sal and salary <= highest_sal and grade_level='A';

