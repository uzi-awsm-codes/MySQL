
--  CREATE DATABASE sms_db;

USE sms_db;

/*
CREATE TABLE student
(
sid char(4) primary key,
sname varchar(20),
sdob date,
scity varchar(20),
squal varchar(20),
semail varchar(30),
sphone varchar(20)
);

CREATE TABLE course
(
courseid char(4) primary key,
coursename varchar(40),
coursecategory varchar(20),
coursefees  decimal(10,2),
courseduration int
);

CREATE TABLE batch
(
batchid char(4) primary key,
bsdate datetime ,
bstrength int,
courseid char(4),
foreign key(courseid) references course(courseid)
);

CREATE TABLE enrollment
(
  batchid char(4),
  sid char(4) ,
  edate date,
  primary key(batchid,sid),
  foreign key(sid) references student(sid),
  foreign key(batchid) references batch(batchid)
);


insert into student
values('s001','rajesh','1980-12-17','kolkata','graduate','rajesh@gmail.com','09830978900');
insert into student
values('s002','john','1949-1-7','hyderabad','postgraduate','john@yahoo.com','9833978933');
insert into student
values('s003','kunal','1967-2-3','pune','postgraduate','kunal@gmail.com','09830922900');
insert into student
values('s004','maya','1990-12-17','kolkata','graduate','maya.com','09830765900');
insert into student
values('s005','jadeja','1940-1-23','kolkata','postgraduate','jadeja@yahoo.com','09837865432');
insert into student
values('s006','suman','1995-6-17','kolkata','undergraduate','suman@gmail.com','0983097890');
insert into student
values('s007','soha','1990-7-17','mumbai','undergraduate',null,null);
insert into student
values('s008','thapa','1980-8-17','assam','graduate','thapa@gmail.com','19830978900');
insert into student
values('s009','hira','1954-9-17','mumbai','postgraduate','hira@gmail.com','09234097890');
insert into student
values('s010','akash','1977-1-27','kolkata','postgraduate','akash@gmail.com',null);
insert into student
values('s011','amir','1992-1-1','delhi','undergraduate','amirgmail.com','09831118900');
insert into student
values('s012','ramesh','1980-12-17','kolkata','graduate','ramesh@yahoo.com','09830918900');
insert into student
values('s013','suresh','1980-3-22','kolkata','graduate','suresh@gmail.com','09830978912');
insert into student
values('s014','amir','1945-1-13','delhi','postgraduate','amir123@rediffmail.com','29830978900');
insert into student
values('s015','esha','1981-10-30','mumbai','graduate','esha@gmail.com','09831378900');
insert into student
values('s016','gopichand','1966-5-7','assam','postgraduate','gopi@gmail.com','09831918100');
insert into student
values('s017','sonali','1995-11-11','mumbai','undergraduate','sonali@gmail.com','09855978900');
insert into student
values('s018','lisa','1983-1-31','delhi','graduate','lisa@gmail.com','09832978923');
insert into student
values('s019','smith','1980-12-17','pune','graduate','smith@yahoo.com','09831111900');
insert into student
values('s020','rajesh','1994-7-8','pune','graduate','rajesh@gmail.com','09830978900');


insert into course values('c001','sql server','compsc',1000,40);
insert into course values('c002','compmat','civileng',3000,120);
insert into course values('c003','biomaths','biotech',4000,160);
insert into course values('c004','word','compsc',500,8);
insert into course values('c005','photo','compsc',800,8);


insert into batch values('b001','2013-02-01 09:30' ,10, 'c001');
insert into batch values('b002','2013-03-01 09:30' ,10, 'c002');
insert into batch values('b003','2013-01-01 09:30' ,10, 'c003');
insert into batch values('b004','2013-03-31 09:30' ,10, 'c003');
insert into batch values('b005','2013-04-04 09:30' ,10, 'c005');
insert into batch values('b006','2013-01-27 09:30' ,10, 'c002');
insert into batch values('b007','2012-11-30 09:30' ,10, 'c004');
insert into batch values('b008','2013-01-28 09:30' ,10, 'c002');
insert into batch values('b009','2013-02-16 09:30' ,10,'c001');
insert into batch values('b010','2012-12-12 09:30' ,10, 'c003');

insert into enrollment values('b001','s001','2013-01-01');
insert into enrollment values('b001','s002','2013-01-31');
insert into enrollment values('b001','s003','2013-01-11');
insert into enrollment values('b001','s004','2013-02-02');
insert into enrollment values('b001','s005','2013-01-01');
insert into enrollment values('b001','s006','2013-01-01');
insert into enrollment values('b001','s007','2013-01-01');
insert into enrollment values('b001','s008','2013-01-01');
insert into enrollment values('b001','s009','2013-01-01');

insert into enrollment values('b002','s010','2013-02-01');
insert into enrollment values('b002','s012','2013-02-27');
insert into enrollment values('b002','s014','2013-01-21');
insert into enrollment values('b002','s016','2013-01-12');
insert into enrollment values('b002','s017','2013-02-15');

insert into enrollment values('b003','s018','2013-12-11');
insert into enrollment values('b003','s019','2013-02-27');
insert into enrollment values('b003','s020','2013-01-21');
insert into enrollment values('b003','s013','2013-01-01');
insert into enrollment values('b003','s007','2013-12-15');
insert into enrollment values('b003','s008','2013-11-25');

insert into enrollment values('b004','s001','2013-02-11');
insert into enrollment values('b004','s003','2013-02-27');
insert into enrollment values('b004','s006','2013-01-21');
insert into enrollment values('b004','s009','2013-03-01');

insert into enrollment values('b005','s001','2013-02-11');
insert into enrollment values('b005','s003','2013-02-27');
insert into enrollment values('b005','s006','2013-03-21');
insert into enrollment values('b005','s009','2013-04-01');

insert into enrollment values('b006','s001','2013-01-11');
insert into enrollment values('b006','s003','2012-12-27');
insert into enrollment values('b006','s006','2013-01-11');
insert into enrollment values('b006','s009','2013-01-01');
insert into enrollment values('b006','s007','2013-01-13');
insert into enrollment values('b006','s002','2012-12-17');
insert into enrollment values('b006','s008','2013-01-21');
insert into enrollment values('b006','s005','2013-01-01');


insert into enrollment values('b007','s001','2012-11-11');
insert into enrollment values('b007','s002','2012-11-11');
insert into enrollment values('b007','s003','2012-11-21');
insert into enrollment values('b007','s004','2012-11-13');
insert into enrollment values('b007','s007','2012-10-13');
insert into enrollment values('b007','s010','2012-10-17');
insert into enrollment values('b007','s009','2012-12-01');

insert into enrollment values('b008','s011','2012-11-11');
insert into enrollment values('b008','s012','2012-11-11');
insert into enrollment values('b008','s013','2012-11-21');
insert into enrollment values('b008','s014','2012-11-13');
insert into enrollment values('b008','s017','2012-10-13');
insert into enrollment values('b008','s020','2012-10-17');
insert into enrollment values('b008','s019','2012-12-01');

insert into enrollment values('b009','s001','2012-11-11');
insert into enrollment values('b009','s012','2012-11-11');
insert into enrollment values('b009','s013','2012-11-21');
insert into enrollment values('b009','s004','2012-11-13');
insert into enrollment values('b009','s007','2012-10-13');
insert into enrollment values('b009','s010','2012-10-17');
insert into enrollment values('b009','s009','2012-12-01');

insert into enrollment values('b010','s011','2012-11-11');
insert into enrollment values('b010','s002','2012-11-11');
insert into enrollment values('b010','s003','2012-11-21');
insert into enrollment values('b010','s014','2012-11-13');
insert into enrollment values('b010','s017','2012-10-13');
insert into enrollment values('b010','s010','2012-10-17');
insert into enrollment values('b010','s009','2012-12-01');
*/
-- ------------------------------------------------------------------------------
/*1) Display all undergraduate student whose name starts with ‘S’ and is of length between 5 and 20.*/
select sid,sname,squal 
from student 
where  squal='undergraduate' and sname like 's%' and length(sname)>=5 and length(sname)<=20;

/* 2) Display the student who are senior citizen (>=60).*/
select sname from student where datediff(current_date,date(sdob))/365>='60';

/* 3) Display student who were born after 1st of June 1980.*/
SELECT sname,sdob 
from student 
where sdob >'1980-06-01';

/* 4) The student are suppose to only provide mobile numbers .All mobile numbers should start with zero followed by 10 digits. Display student name having invalid phone numbers.*/
select sname,sphone 
from student 
where sphone<>'0__________';

/* 5) All emails should have “@” anywhere after the first character and should end with “.com”.Display count of students having invalid email id.*/
select count(*)
from (select sname,semail from student 
	where semail!='_%@%.com') a;


/* 6) Display the name and email of student who have a Gmail account. */
select sname,semail 
from student 
where semail like '%@gmail.com';

/* 7) Display the above record but do not consider invalid email id. */
select sname,semail 
from student 
where semail like '_%@gmail.com';

/* 8) Display the qualification and the total number of students registered based on their qualifications. (Alias use “totalStud” for total number of students) */
select squal,count(squal) 'totalStud' 
from student 
group by squal;

/* 9) Display the full name of the month and the total number of students who are having their birthday in that month. (Alias use “Month” and “Total”) */
select sname, monthname(sdob) as 'BIRTH MONTH' 
from student 
group by monthname(sdob);

/* 10) Display the student name that was born in a leap year ordering by student name and year of birth. */
select sname,sdob from student 
where date_format(sdob,'%Y')%4=0 and date_format(sdob,'%Y')%100!=0 OR date_format(sdob,'%Y')%400=0 
order by sname,sdob;

/* 11) Display student whose city is Kolkata as “HomeStudent ” and others as “DistanceStudent” under a column “Remarks”. Also display the name and city of the student. */
select sname,scity,if(scity = 'Kolkata','HomeStudent','DistanceStudent') as 'Remarks'
from student;

/* 12) Display batchid, coursename, batch start date, batch end date for all batches. (batch end date=batch start date +course duration). */
select batchid,coursename,bsdate,adddate(bsdate,courseduration) 'batch end date'
from batch b join course c on b.courseid=c.courseid;

/* 13) Display all batchid having a difference of 10 hours and less between its starting and ending date. */
select batchid,bsdate,adddate(bsdate,courseduration) 'bedate'
from batch b join course c on b.courseid=c.courseid 
where timediff(adddate(bsdate,courseduration),bsdate) <='0000-00-00 00:10:00';

/* 14) Display all batches having similar start date and strength. */
select batchid,bsdate,bstrength 
from batch 
group by bsdate,bstrength 
having count(bsdate)>1 and count(bstrength)>1;

/* 15) Display student who enrolled for the batch after its start date. */
select e.sid,e.batchid,e.edate,b.bsdate 
from enrollment e join batch b on e.batchid=b.batchid 
where edate>bsdate;

/* 16) Display the studentid, studentname , totalfees for all student. */
select s.sid,s.sname,sum(c.coursefees) from student s 
join enrollment e on s.sid=e.sid 
join batch b on e.batchid=b.batchid 
join course c on b.courseid=c.courseid 
group by sid;

/* 17) Display courses which are not being taught currently along with courses which are being taught. Also display the batchid for the courses currently running and null for non executing courses. */
select c.courseid,c.coursename,if(b.batchid is null,Null,b.batchid) batchid 
from course c  left join batch b 
using(courseid);

/* 18) Display count of students having no contact information. (Either email or phone). */
select sid,sname 
from student 
where semail=null and sphone=null;

/* 19) Display coursename having above average fees. */
select coursename,coursefees 
from course 
having coursefees>avg(coursefees);

/* 20) Display coursename where fees are less than the average fees of its category. */
select coursename,coursefees 
from course 
group by coursecategory 
having coursefees<avg(coursefees);

/* 21) Display the coursename having the highest enrollment. */
select course.coursename from course join batch on
course.courseid=batch.courseid join enrollment on
batch.batchid=enrollment.batchid
group by course.courseid 
having count(enrollment.sid)>=all(select count(enrollment.sid) from course join batch on
								course.courseid=batch.courseid join enrollment on
								batch.batchid=enrollment.batchid
								group by course.courseid);

/* 22) Display student name having duplicate email ids. */
select sid,sname 
from student 
group by semail 
having count(semail)>1;

/* 23) Display student name having similar name but different email ids. */
select sname 
from student 
group by sname 
having count(sname)>1 and count(semail)>=0 ;

/* 25) Display the course name fetching the 2nd highest revenue. */
select sum(coursefees) as revenue
from student s join enrollment e on s.sid=e.sid
join batch b on e.batchid=b.batchid
join course c on b.courseid=c.courseid
group by coursename
order by revenue desc
limit 1,1;

/* 26) Generate report which displays the batch number and the number of seats vacant. [Use Alias “Vacant”]. */
select batch.batchid,(batch.bstrength-count(enrollment.batchid)) as vacant from batch join enrollment on
batch.batchid=enrollment.batchid
group by batch.batchid;

/* 27) Which among the following have the highest enrollment? (Graduate,Undergraduate or postgraduate). Write query to display “Qualification” , “HighestEnrollmet” (Use Alias”). */
select distinct squal from student group by squal 
having count(squal)>=all(select count(squal) from student group by squal);

/* 28) Display student name, age[Alias] , coursename, batchid, batch_start_ date, batch_ end _date , and enrollment date in the format 1st of Jan , 2012 . */
select s.sname,c.coursename,date_format(from_days(datediff(now(),sdob)),'%y')+0 'age', b.batchid,b.bsdate,adddate(b.bsdate,c.courseduration) 'bedate',date_format(e.edate,'%d-%M-%Y')
from student s join enrollment e  
on s.sid=e.sid join batch b on 
e.batchid=b.batchid join course c on b.courseid=c.courseid; 

/* 29) Display report in the following format. Consider Sat & Sun as holiday.
Week Enrollment
Weekday 10
Hoilday 05 */
select r.weekday 'week',r.enrollment from
	(select 'weekday', sum(w.c1) enrollment from
		(select dayname(edate) weekday,count(edate) c1 from enrollment
		where dayname(edate) in ('monday','tuesday','wednesday','thursday','friday')
		group by weekday) w
	union
		(select 'holiday',sum(h.c2) enrollment from
			(select dayname(edate) holiday,count(edate) c2 from enrollment
			where dayname(edate) in ('sunday','saturday')
			group by holiday)h)
	)r;
    
/* 24) Display the student name, date of birth and their zodiac sign. Use Zodiac as alias
a. Aries  Mar 21-Apr 19
b. TaurusApr 20 –May 20
c. GeminiMay 21-Jun 20
d. Cancer  Jun21- Jul22
e. Leo  Jul 23- Aug 22
f. Virgo  Aug 23-Sept 22
g. Libra  Sept 23-Oct 22
h. Scorpio  Oct 23- Nov 21
i. Sagittarius  Nov 22-Dec 21
j. Capricorn  Dec 22- Jan 19
k. Aquarius Jan 20 – Feb 18
l. Pisces Feb 19- Mar 20. */
select sname, sdob, 
case  
		WHEN (MONTH(sdob) = 3 AND DAYOFMONTH(sdob) >= 21) OR (MONTH(sdob) = 4 AND DAYOFMONTH(sdob) <= 19) THEN 'Aries'
		WHEN (MONTH(sdob) = 4 AND DAYOFMONTH(sdob) >= 20) OR (MONTH(sdob) = 5 AND DAYOFMONTH(sdob) <= 20) THEN 'Taurus'
		WHEN (MONTH(sdob) = 5 AND DAYOFMONTH(sdob) >= 21) OR (MONTH(sdob) = 6 AND DAYOFMONTH(sdob) <= 20) THEN 'Gemini'
		WHEN (MONTH(sdob) = 6 AND DAYOFMONTH(sdob) >= 21) OR (MONTH(sdob) = 7 AND DAYOFMONTH(sdob) <= 22) THEN 'Cancer'
		WHEN (MONTH(sdob) = 7 AND DAYOFMONTH(sdob) >= 23) OR (MONTH(sdob) = 8 AND DAYOFMONTH(sdob) <= 22) THEN 'Leo'
		WHEN (MONTH(sdob) = 8 AND DAYOFMONTH(sdob) >= 23) OR (MONTH(sdob) = 9 AND DAYOFMONTH(sdob) <= 22) THEN 'Virgo'
		WHEN (MONTH(sdob) = 9 AND DAYOFMONTH(sdob) >= 23) OR (MONTH(sdob) = 10 AND DAYOFMONTH(sdob) <= 22) THEN 'Libra'
		WHEN (MONTH(sdob) = 10 AND DAYOFMONTH(sdob) >= 23) OR (MONTH(sdob) = 11 AND DAYOFMONTH(sdob) <= 21) THEN 'Scorpio'
		WHEN (MONTH(sdob) = 11 AND DAYOFMONTH(sdob) >= 22) OR (MONTH(sdob) = 12 AND DAYOFMONTH(sdob) <= 21) THEN 'Sagittarius'
		WHEN (MONTH(sdob) = 12 AND DAYOFMONTH(sdob) >= 22) OR (MONTH(sdob) = 1 AND DAYOFMONTH(sdob) <= 19) THEN 'Capricorn'
		WHEN (MONTH(sdob) = 1 AND DAYOFMONTH(sdob) >= 20) OR (MONTH(sdob) = 2 AND DAYOFMONTH(sdob) <= 18) THEN 'Aquarius'
		WHEN (MONTH(sdob) = 2 AND DAYOFMONTH(sdob) >= 19) OR (MONTH(sdob) = 3 AND DAYOFMONTH(sdob) <= 20) THEN 'Pisces'
      end 'Zodiac'
from student;



