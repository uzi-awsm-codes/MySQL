-- create database fms;

use fms;

set sql_mode=only_full_group_by;

/*
create  table  Passenger
(
passid int primary key,
passname varchar(20),
passemail varchar(20),
passdob date
);

create table Flight
(
flightid int primary key,
flightsource varchar(20),
flightdest varchar(20),
flightdate date,
flightseat int(4),
ticketcost float
);

create table Booking
(
bookingid int primary key,
flightid int,
bookdate date,
foreign key(flightid) references Flight(flightid)
);

create table Booking_details
(
bookingid int,
passid int,
primary key(bookingid,passid),
foreign key(bookingid) references Booking(bookingid),
foreign key(passid) references Passenger(passid)
);


Insert into Passenger values(1,'Rajesh','raj@y.com','1980-12-01');
Insert into Passenger values(2,'hira','hira@y.com','1939-11-11');
Insert into Passenger values(3,'sita','sita@y.com','1988-02-06');
Insert into Passenger values(4,'mica','mica@y.com','1973-09-18');
Insert into Passenger values(5,'elizabeth','eliza@y.com','1976-05-09');
Insert into Passenger values(6,'kaushik','kaushik@y.com','1955-08-08');

Insert into Flight values(1,'kol','hyd','2012-12-01 22:09:01.340',100,2000.00);
Insert into Flight values(2,'chen','hyd','2012-12-02 22:09:01.340',100,3000.00);
Insert into Flight values(3,'pune','kol','2012-12-02 22:09:01.340',100,2500.00);
Insert into Flight values(4,'bangalore','pune','2012-12-03 22:09:01.340',100,2300.00);
Insert into Flight values(5,'hyd','bangalore','2012-12-05 22:09:01.340',100,2600.00);
Insert into Flight values(6,'pune','hyd','2012-12-03 22:09:01.340',100,2000.00);
Insert into Flight values(7,'pune','kol','2012-12-04 22:09:01.340',100,2900.00);
Insert into Flight values(8,'kol','hyd','2012-12-06 22:09:01.340',100,3500.00);

Insert into Booking values(1,1,'2012-12-01');
Insert into Booking values(2,3,'2012-12-02');
Insert into Booking values(3,4,'2012-12-03');
Insert into Booking values(4,5,'2012-12-04');
Insert into Booking values(5,4,'2012-12-02');
Insert into Booking values(6,1,'2012-12-02');
Insert into Booking values(7,3,'2012-12-02');

Insert into Booking_Details values(1,1);
Insert into Booking_Details values(1,2);
Insert into Booking_Details values(1,3);
Insert into Booking_Details values(2,4);
Insert into Booking_Details values(3,5);
Insert into Booking_Details values(3,6);
Insert into Booking_Details values(4,1);
Insert into Booking_Details values(5,2);
Insert into Booking_Details values(5,3);
Insert into Booking_Details values(5,4);
*/

-- ---------------------------------------------------------
/* 1.Display passenger name who has a 'e' as second letter in their name */
select passname
from passenger
where passname like '_i%';

/* 2.Display the name of the youngest passenger. */
select passname
from passenger
where passdob = (select max(passdob) from passenger);

/* 3.Display the name of the passenger, date of birth and age. */
select passname, passdob, datediff(current_date,passdob)/365 as 'age'
from passenger;

/* 4.Display the number of flights leaving Kolkata. */
select count(passid)
from passenger join booking_details
using(passid) join booking
using(bookingid) join flight using(flightid)
where flightsource = 'Kol';

/* !X! 5.Display the name of city where the number of flights leaving and reaching is the same. */
select count(flightsource),flightsource, count(flightdest)
from flight
group by flightsource, flightdest
having count(flightsource) = count(flightdest);

/* 6.Display the name of the city which has flight source but no destination. */
select distinct flightsource
from flight
where flightdest=null;

/* 7.Display the dates on which flight 1 and 4 is flying. */
select flightdate, flightid
from flight
where flightid=1 or flightid=4;

/* 8.Display the number of passenger in each flight. Use column alias “PassCount”. */


/* 9.Display the name and date of birth of passengers who are senior citizen (age>=60). */
select passname from passenger where datediff(current_date,passdob)/365>='60';

/* !X! 10.Display the booking id having the highest number of passengers. */
select bookingid 
from booking_details 
where cnt <=any (select bookingid, count(passid) cnt  from booking_details group by bookingid);

/* 11.Display the booking id (ticket) and the total cost for the booking. Usecolumn alias “Total Fare”. */


/* 12.Display the booking id (ticket) and the total cost for the booking. Use column alias “Total Fare”. Consider giving a rebate of 50% to senior citizen (age>=60). */


/* !X! 13.Display the city receiving the maximum number of flights. */
select flightdest, count(flightid)
from flight
group by flightdest;

/* 14.Display the passenger’s name havingmore than 1 booking. */
select passname, count(bookingid)
from passenger join booking_details using(passid)
group by passid
having count(bookingid)>1;

/* 15.Display flightid with no of booking. */
select flightid
from flight f left join booking b using(flightid)
where b.flightid is null;

/* !X! 16.Display the passenger (name only) who booked ticket on the day of flight for flight no 1. */
select passname
from passenger join booking b 
using(passid) join flight f using(flightid)
where 

/* 17.Display flights having the same source and destination. */


/* 18.Display the record in the following format. Column alias “Booking Summary”Hints:“ Ticket No:1  Flight id: 1 Total Passengers :3 Total Fare:6000”“Ticket No:2  Flight id: 3  Total Passengers :1 Total Fare :2500” */


/* 19.Flight No: 2 have been delayed for 4 hrs due to fog.  Display flight id , flight date and a new column “flight new date”, which displays the new timing. */


/* 20.Display passenger name , date of birth  sorted by the month of birth .(Jan ? Dec) */
select passname, passdob, monthname(passdob)
from passenger
order by month(passdob);