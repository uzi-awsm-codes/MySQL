create database ems;
use ems; 
create table employee
(empid int,empname varchar(30),job varchar(30),
salary double);
desc employee;
select * from employee;
insert into employee values
(1001,"abc",'SE',45000,'2010-02-15');
delete from employee where hiredate=
'2013-01-01';

alter table employee add primary key(empid);
desc employee;

-- insert into employee values("aaa",1002,'SE',45000); error
insert into employee (empname,empid,job,salary) 
values("aaa",1002,'SE',45000);

-- insert into employee values(1003,'bbb','SE'); error

insert into employee (empname,empid,job) 
values("ccc",1002,'HR');

INSERT into employee values
(1004,"minu",'SSE',55000),
(1005,"ddd",'PM',75000),
(1006,"kavi",'SE',45000);
select * from employee;
update employee set salary=salary+5000;
set sql_safe_updates=0;
update employee set salary=40000 
where salary is null;
update employee set salary=salary+5000 
where job='se';
update employee set empid=1003,job='PM'
where empname='eee';
delete from employee where empid=1005;
-- change table structure
alter table employee add column hiredate date;
alter table employee add column testcol int;
alter table employee modify testcol varchar(30);
alter table employee drop column testcol;
desc employee;
select sysdate() ;
update employee set hiredate='2013-01-01' 
where empid=1001;
desc emp;
alter table test.emp rename to ems.employee;
select * from employee;
select empid,salary from employee;
select empid,salary from employee 
where salary>45000;
select empid,salary from employee 
where salary<45000;
-- and ,or,not
select empid,salary from employee 
where salary >=40000 and salary<=60000;

select empid,salary,job from employee 
where salary >=40000 or job='sse';
create table employee_copy
(empid int,empname varchar(30),job varchar(30),
salary double,hiredate date);
insert into employee_copy
select * from employee;

select * from employee_copy;

-- Transaction
set sql_safe_updates=0;
start transaction;
insert into employee values
(1008,"minu",'TL',55000,'2009-01-05');
update employee set hiredate='2015-03-04'
where empid=1002;
savepoint s1;
delete from employee where empid=1003;
savepoint s2;
rollback to s1;
commit;
create table test(id int primary key,
uname varchar(20));
drop table test;

/*create table test(id1 int primary key,
id2 int primary key,
uname varchar(20)); error*/

create table test(id1 int,
id2 int,
uname varchar(20),
primary key(id1,id2));

insert into test(id1,uname) 
values (1,'a');
desc test;
alter table employee add primary key(empid);
insert into employee (empname,job) 
values("ccc",'HR');
-- primary key
-- composite key - table level constraint
-- check constraint
create table course(courseid int,
coursename varchar(30),
start_date date check(start_date > sysdate()),
end_date date);

create table course(courseid int,
coursename varchar(30),
start_date date, 
end_date date,
check(start_date < end_date));


create table employees(
employee_id int ,
first_name varchar(20)not null,
last_name varchar(25) not null,
email varchar(25) unique,
phone_number varchar(20) ,
hire_date date default sysdate,
job_id varchar(10) not null,
salary double check (salary>0),
commission_pct double,
manager_id int,
department_id int ,
constraint emp_pk primary key(employee_id));

desc employees;
insert into employees
(employee_id,first_name,
email,phone_number,hire_date,
job_id,salary,department_id)
 values(101,'Steven','Sking@gmail.com',
 '515.123.4567',
'1987-06-17','AD_PRES',24000,90);

create table department(deptno int primary key,
deptname varchar(30));
insert into department 
values
(10,'IT'),(20,'Admin'),(30,'Sales');

alter table employees 
add constraint dep_emp_deptno_fk
foreign key(department_id) 
references department(deptno)
on delete set null;
insert into department 
values
(90,'Marketing');
delete from department where deptno=90;

-- SQL Operators
-- Arithmetic Operators
select employee_id,first_name,salary,
salary*12 'Annual Salary' from employees;

select employee_id,first_name as Name,salary,
salary*12 as AnnualSalary from employees;

select count(*) from employees;
select count(*) 'No of Employees' from employees;

-- Relational operators
select first_name,salary from employees
where salary > 30000;
select first_name,salary from employees
where salary <=30000;
select first_name,salary from employees
where salary >= 30000 and salary <=50000;
select first_name,salary from employees
where salary between 30000 and 50000;
select first_name,salary from employees
where salary not between 30000 and 50000;
select first_name,salary from employees
where first_name between 'A' and 'F';
select first_name,hire_date from employees
where hire_date between '1990-01-01'
and '2000-01-01';
select first_name,department_id from
employees where department_id=10 or
department_id=30 or department_id=20;

select first_name,department_id from
employees where department_id in(10,20);
select first_name,department_id from
employees where department_id not in(10,20);

select first_name,salary,department_id from
employees where department_id=10 and salary >30000;

select first_name,salary,department_id from
employees where department_id=30 and salary >30000;

select first_name,salary,department_id from
employees where department_id=10 or salary >30000;

-- select first_name,commission_pct from employees
-- where commission_pct =null ;not correct
select first_name,commission_pct from employees
 where commission_pct is null;
 select first_name,commission_pct from employees
 where commission_pct is not null;
 select first_name from employees
 where first_name like 'A%';
  select first_name from employees
 where first_name like '%a';
 select first_name from employees
 where first_name like '%a%';
 
 select first_name from employees
 where first_name like 'a_%';
 select first_name from employees
 where first_name like '_e%';
 -- Set operators
 select empid,empname from
 employee
 union
 select employee_id,first_name from
 employees;
 select empid,empname from
 employee
 union all
 select employee_id,first_name from
 employees;
 

 /*select empid,empname,job from
 employee
 union
 select employee_id,first_name from
 employees; --error*/
 
 -- Aggregate Functions
select count(employee_id) 'No of employees' from employees;
select avg(salary) from employees;
select min(salary),max(salary),sum(salary) from employees;
select count(commission_pct) from employees;
select count(*) from employees;
select count(department_id) from employees;
select count(distinct department_id) from employees;
-- this is not a valid query
select first_name,max(salary) from employees;
select first_name from employees where salary=
(select max(salary) from employees);
select min(hire_date),max(hire_date) from employees;
select min(first_name),max(first_name) from employees;
select department_id,count(employee_id) from employees
group by department_id;

-- Scalar Functions
-- Built-in functions
select current_date() from dual;
select session_user();
select current_user();
select current_time();
select current_timestamp();

-- Number functions
select ceil(78.9);
select ceil(78.4);
select floor(78.9);
select floor(78.4);
select round (78.9453,2);
select round (78.9443,2);
select truncate (78.9453,2);
select truncate (78.9443,2);
select round (78.9443,-1);
select round (74.9443,-1);
select round (378.9443,-2);
select round (348.9443,-2);
select truncate (78.9443,-1);
select truncate (74.9443,-1);
select truncate (378.9443,-2);
select truncate (348.9443,-2);
select avg(salary) from employees;
select round(avg(salary),2) from employees;
select abs(-8),abs(8);
select pi();
select mod(9,3);
select mod(9,2);
select mod(2,4);
select sqrt(25);
select power(3,2);
select power(3,3);
-- String functions
select length('hello');
select ucase('hello');
select upper('hello');
select lcase('HELLO');
select lower('HELLO');
select left('hello',2);
select right('hello',2);
select concat('hello',' ','world',' ','hai');
select substring('hello world',1,3);
select substring('hello world',3,3);
select substring('hello world',3);
select locate('world','helloworld');
select locate('sa','helloworld');
select concat(first_name,' ',last_name) Name
from employees;
select reverse('hello');
select first_name,trim(leading 'A' from first_name)
from employees;
select first_name,trim(trailing 'n' from first_name)
from employees;
select ascii('hello');
SELECT CONVERT('1998-03-16', DATE);
select CONVERT('19980316', DATE);
select convert('abc',date);

-- Date functions
select date(sysdate());
select sysdate();
select time(sysdate());
select date('20201219');
select date('abc');
select hire_date,day(hire_date),month(hire_date),
year(hire_date) from employees;
select hour(sysdate()),minute(sysdate()),
second(sysdate());
select hire_date,extract(day from hire_date),
extract(month from hire_date) from employees;
select hire_date,dayname(hire_date),
monthname(hire_date) from employees;
select dayname(sysdate());
select hire_date,
adddate(hire_date,interval 20 day),
adddate(hire_date,interval 1 month),
adddate(hire_date,interval 1 year)
from employees;
select date(current_date+1);
select round(datediff(sysdate(),hire_date)/365,2)
from employees;
SELECT DAYOFMONTH('2020-12-21');
SELECT DAYOFYEAR('2020-12-21');
SELECT DAYOFYEAR('2020-11-21');
SELECT DAYOFWEEK('2020-12-21');
SELECT DAYOFWEEK('2020-12-25');
SELECT LAST_DAY('2020-12-15');
SELECT dayname(LAST_DAY('2020-12-15'));
select date_format('2020-12-21', '%W %M %Y');
select date_format('2020-12-21', '%d-%m-%Y');
select hire_date,date_format(hire_date,'%m-%d-%Y')
from employees;
 
 -- General functions
/* Display employee names and their contact info whichever
is available.*/
select first_name,
coalesce(email,phone_number,'NA') 'Contact Info'
from employees;
select nullif(12,12);
select nullif(12,10);
select if(1>2,'true','false');
select distinct job_id from employees;
/* Display employees,commission who avail commission and for
 those who are
not availing display Not eligible*/
select first_name,
if(commission_pct is not null,commission_pct,'Not eligible')
from employees;
/* Display employee name,designation.
If job_title is
AD_PRES then display designation President
AD_VP then Vice President
IT_PROG then Programmer
else display NA.
*/
select first_name,job_id,
case job_id
when 'AD_PRES' then 'President'
when 'AD_VP' then 'Vice President'
else 'NA' end 'Designation'
from employees;

/*
Display employee name,salary and salary grade. Find salary grade
based on the following criteria:
if sal>50000 grade - A
if sal >=3000 and <50000 grad -B
if sal >=15000 and <=30000 grad -C
*/
select first_name,salary,
case
when salary>50000 then 'A'
when salary between 30000 and 50000 then 'B'
when salary between 15000 and 29999 then 'C'
else 'No grade'
end Grade
from employees;

select ifnull(10,20);
select ifnull(null,20);
select avg(commission_pct) from employees;
select sum(commission_pct)/count(employee_id) from employees;
select avg(ifnull(commission_pct,0)) from employees;

-- order by (asc(default),desc)
select first_name,salary from employees order by salary;
select first_name,salary from employees order by salary desc;
select first_name,salary from employees order by first_name;
select first_name,hire_date from employees order by hire_date;
select first_name,salary,department_id from employees order by
department_id,salary;
select first_name,salary,department_id from employees order by
department_id,salary desc;
select first_name,department_id,job_id from employees order by
department_id desc,job_id;

select first_name,department_id,job_id 
from employees 
order by 2 desc,3;

-- group by
select count(employee_id) from employees;
select sum(salary) from employees;
-- Find the no. of employees in each dept.
select department_id,
count(employee_id) from employees
group by department_id;
select department_id,
count(employee_id) No_of_Employees,
sum(salary) Sum_of_salary from employees
group by department_id;
-- not valid
select first_name,department_id,
count(employee_id) No_of_Employees,
sum(salary) Sum_of_salary from employees
group by department_id;
-- Find the no. of employees in each dept where
-- department is not null.
select department_id,
count(employee_id),min(salary) from employees
where department_id is not null
group by department_id;
select first_name,job_id,department_id
from employees;
/* Find the number of employees under each
job in each department*/
select department_id,job_id,
count(employee_id) from employees
where department_id is not null
group by department_id,job_id;
/* Display the departments and emp.count
 with number of employees greater than 50 */
select department_id,
count(employee_id) from employees
where department_id is not null
group by department_id
having count(employee_id)>2;

select department_id,
max(salary) from employees
where department_id is not null
group by department_id
having max(salary)>40000;

select department_id,
max(salary) from employees
where department_id is not null
group by department_id
having max(salary)>40000
order by department_id desc;

-- Joins
-- Inner Join
-- Display employee id,name,deptid and deptname.
-- ANSI style
select employee_id,first_name,department_id,deptname
from department join employees
on department.deptno=employees.department_id;

-- using clause with join(only if primary,foreign key
-- column names are same.

select employee_id,first_name,department_id,deptname
from department join employees
using(department_id);

select employees.employee_id,
employees.first_name,department.deptno,
department.deptname
from department join employees
on department.deptno=employees.department_id;

-- using alais name
select emp.employee_id,emp.first_name,
dep.deptno,deptname
from department dep join employees emp
on dep.deptno=emp.department_id;

select emp.employee_id,emp.first_name,
dep.deptno,deptname
from department dep join employees emp
on dep.deptno=emp.department_id
where dep.deptno in(20,30);

-- Theta style

select emp.employee_id,emp.first_name,
dep.deptno,deptname
from department dep,employees emp
where dep.deptno=emp.department_id
and dep.deptno in(20,30);

-- Outer Join
-- left outer
-- retrieves matching rows from both tables,and
-- unmatched rows from left table
select emp.employee_id,emp.first_name,
dep.deptno,deptname
from department dep left join employees emp
on dep.deptno=emp.department_id;
-- right outer
-- retrieves matching rows from both tables,and
-- unmatched rows from right table
select emp.employee_id,emp.first_name,
dep.deptno,deptname
from department dep right join employees emp
on dep.deptno=emp.department_id;
-- full outer
-- retrieves matching rows from both tables,and
-- unmatched rows from left and right table
select emp.employee_id,emp.first_name,
dep.deptno,deptname
from department dep left join employees emp
on dep.deptno=emp.department_id
union
select emp.employee_id,emp.first_name,
dep.deptno,deptname
from department dep right join employees emp
on dep.deptno=emp.department_id;

-- Cross join
select first_name,department_id,deptname
from department cross join employees;
-- Natural join
select first_name,department_id,deptname
from department natural join employees;
-- Self join
select employee_id,first_name,manager_id
from employees;

-- Display employee names and their manager names
select emp.first_name Employee,
mgr.first_name Manager
from employees emp join employees mgr
on emp.manager_id=mgr.employee_id;

-- Non Equii join
-- For every employee display the salary grade
create table job_grades
(
grade_level varchar(3),
lowest_sal int,
highest_sal int);
insert into job_grades values('A',5000,29999);
insert into job_grades values('B',30000,49999);
insert into job_grades values('C',50000,99999);
insert into job_grades values('D',100000,500000);
select emp.first_name,emp.salary,grd.grade_level
from employees emp join job_grades grd
on emp.salary between grd.lowest_sal and
grd.highest_sal;

-- Joins and group by
/*Display department name and the number of
employees in each department*/
select dep.deptname,
count(emp.employee_id)
from department dep join employees emp
on dep.deptno=emp.department_id
group by dep.deptname;
/*Display department name and the number of
employees in each department including department
with no employees*/
select dep.deptname,
count(emp.employee_id)
from department dep left join employees emp
on dep.deptno=emp.department_id
group by dep.deptname;

-- Find the employee who earns the maximum salary
select first_name,salary from
employees where salary=(
select max(salary) from employees);
select employee_id,job_id from employees
where employee_id=100;
-- '100', 'AD_PRES'
select job_id from employees
where employee_id=102;
-- 'AD_VP'
-- error
update employees set job_id=
(select job_id from employees
where employee_id=102)
where employee_id=100;

update employees set department_id=
(select deptno from department
where deptname='Accounting')
where employee_id=106;

-- List all employees whose salary is
-- greater than Smith.
select first_name,salary from employees
where salary >
(select salary from employees where
first_name='lex');

/*List all employees who has same designation
as Smith and who has salary greater than Jones.*/

select first_name,salary,job_id from employees
where salary >
(select salary from employees where
first_name='Jones')
or job_id=(select job_id from employees where
first_name='diana')
and first_name!='diana';
-- List the employee having the minimum salary
select first_name,salary from
employees where salary=(
select min(salary) from employees);
/*List minimum salary of each department,where
minimum salary is greater than the minimum
salary of department 10.*/
select department_id,min(salary) from
employees group by department_id
having min(salary)>
(select min(salary) from employees
where department_id=10);

/* Find minimum salary of each department,where
minimum salary is greater than the minimum
salary of department 10.Display dept.name
and minimum salary*/
select dep.deptname,min(emp.salary)
from department dep join employees emp
on dep.deptno=emp.department_id
group by dep.deptno
having min(emp.salary)>
(select min(salary) from employees
where department_id=10);
-- Single row subquery operators
-- =,<,>,<=,>=,!=
-- Subquery returning multiple rows
-- multiple row subquery operators
-- in(=),any,all(relational operators)
-- error
SELECT employee_id, first_name
FROM   employees
WHERE  salary =
                (SELECT   MIN(salary)
                 FROM     employees
                 GROUP BY department_id);
SELECT employee_id, first_name,salary
FROM   employees
WHERE  salary in
                (SELECT   MIN(salary)
                 FROM     employees
                 GROUP BY department_id
);
-- List employees whose salary is less
-- than any AD_PRES.
select first_name,salary from employees
where salary < any
(select salary from
employees where job_id='AD_PRES');

-- List employees whose salary is less
-- than all AD_PRES.
select first_name,salary from employees
where salary < all
(select salary from
employees where job_id='AD_PRES');

-- Find the department with maximum
-- number of employees
-- error
select department_id,max(count(employee_id)) from
employees group by department_id;

select department_id,count(employee_id)
from employees
group by department_id
having count(employee_id) >=all
(select count(employee_id) from employees
group by department_id);
-- Find the dept. with minimum employee count
select department_id,count(employee_id)
from employees
group by department_id
having count(employee_id) <=all
(select count(employee_id) from employees
group by department_id);

-- LMS

/*Write a query to display the book code, book title and supplier name
of the supplier who has supplied maximum number of books. For example,
if ABC Store supplied 3 books, “LM Store” has supplied 2 books
and “XYZ Store” has supplied 1 book. So “ABC Store” has supplied
maximum number of books, hence display the details as mentioned below.
*/
select b.book_code,b.book_title,s.supplier_name
from lms_suppliers_details s join lms_book_details b
on s.supplier_id=b.supplier_id
where b.supplier_id in(
select s.supplier_id
from lms_suppliers_details s join lms_book_details b
on s.supplier_id=b.supplier_id group by s.supplier_id
having count(b.book_code)>=all
(select count(b.book_code)
from lms_suppliers_details s join lms_book_details b
on s.supplier_id=b.supplier_id
group by s.supplier_name));

-- Correlated subqueries
/* Find the employees whose salary is greater
than the average salary of their own department*/
-- Jones 45000 10 ->avg(salary) of dept 10
-- A 50000 20 ->avg(salary) of dept 20
select e1.first_name,e1.salary,e1.department_id
from employees e1 where e1.salary >
(select avg(e2.salary) from employees e2 where 
e1.department_id= e2.department_id);
select first_name,salary from employees
order by salary desc limit 1;

-- true/false
Select emp.first_name, 
emp.department_id, emp.Salary 
from employees emp
Where EXISTS (select dep.deptno 
From department dep 
Where dep.deptno = emp.department_id);

-- views -------------------------------------
create view emp_view
as select first_name,salary,department_id
from employees;
desc emp_view;
select * from emp_view;
create view dept_emp_view
as select emp.first_name,emp.salary,dep.deptname
from department dep join employees emp
on dep.deptno=emp.department_id;
select * from dept_emp_view;

set sql_mode=only_full_group_by;
-- Inline views
-- Find the department with maximum no. of employees
select department_id from employees
group by department_id
having count(employee_id)=
(select max(empcount) from
(select count(employee_id) empcount
from employees group by department_id)temp);

/* Find the employees whose salary is greater
than the average salary of their own department*/
select first_name,salary,department_id from
employees;

select department_id,avg(salary) avgsal
from employees group by department_id;

select first_name,salary,temp.department_id,
temp.avgsal
from employees emp,
(select department_id,avg(salary) avgsal
from employees group by department_id)temp
where emp.department_id=temp.department_id
and emp.salary > temp.avgsal;

create index name_idx on employees(first_name);
desc employees;
