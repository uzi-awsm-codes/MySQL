-- create database fms;

use fms;

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

