create database lms;
use lms;
Create table LMS_MEMBERS
(
	MEMBER_ID Varchar(10),
	MEMBER_NAME Varchar(30) NOT NULL,
	CITY VARCHAR(20),
	DATE_REGISTER Date NOT NULL,
	DATE_EXPIRE Date ,
	MEMBERSHIP_STATUS Varchar(15)NOT NULL,
	constraint lms_mem_id_pk PRIMARY KEY(MEMBER_ID)
);
Create table LMS_SUPPLIERS_DETAILS
(
	SUPPLIER_ID Varchar(3),
	SUPPLIER_NAME Varchar(30) NOT NULL,
	ADDRESS	Varchar(50),
	CONTACT int(15) NOT NULL,
	EMAIL Varchar(15) NOT NULL,
	Constraint lms_sup_id_pk PRIMARY KEY(SUPPLIER_ID)
);
Create table LMS_FINE_DETAILS
(
	FINE_RANGE Varchar(3),
	FINE_AMOUNT int NOT NULL,
	Constraint lms_fine_range_pk PRIMARY KEY(FINE_RANGE)
);
Create table LMS_BOOK_DETAILS
(
    BOOK_CODE Varchar(10),    
    BOOK_TITLE Varchar(50) NOT NULL,
    CATEGORY Varchar(15) NOT NULL,
    AUTHOR Varchar(30) NOT NULL,
    PUBLICATION Varchar(30),
    PUBLISH_DATE Date,
    BOOK_EDITION int(2),
    PRICE int(8) NOT NULL,    
    RACK_NUM Varchar(3),
    DATE_ARRIVAL Date NOT NULL,         
    SUPPLIER_ID Varchar(3) NOT NULL,
    Constraint lms_book_code_pk PRIMARY KEY(BOOK_CODE), 
        Constraint lms_book_sup_id_fk FOREIGN KEY(SUPPLIER_ID) References LMS_SUPPLIERS_DETAILS(SUPPLIER_ID)
);
Create table LMS_BOOK_ISSUE
(
	BOOK_ISSUE_NO int,
	MEMBER_ID Varchar(10) NOT NULL,
	BOOK_CODE Varchar(10) NOT NULL,
	DATE_ISSUE Date NOT NULL,
	DATE_RETURN Date NOT NULL,
	DATE_RETURNED Date NULL,
	BOOK_ISSUE_STATUS Varchar(20) NOT NULL,
	FINE_RANGE varchar(3),
	Constraint lms_issue_no_pk PRIMARY KEY(BOOK_ISSUE_NO),
	Constraint lms_mem_book_memid_fk FOREIGN KEY(MEMBER_ID) References LMS_MEMBERS(MEMBER_ID),
	constraint lms_issue_bdetails_bcode_fk FOREIGN KEY(BOOK_CODE) References LMS_BOOK_DETAILS(BOOK_CODE),
	constraint lms_issue_fdetails_fk FOREIGN KEY(FINE_RANGE) References LMS_FINE_DETAILS(FINE_RANGE)
);

Insert into LMS_MEMBERS
Values('LM001', 'AMIT', 'CHENNAI', ('2012-02-20'), ('2013-11-02'),'Temporary');

Insert into LMS_MEMBERS
Values('LM002', 'ABDHUL', 'DELHI', ('2012-04-10'),('2013-04-09'),'Temporary');

Insert into LMS_MEMBERS
Values('LM003', 'GAYAN', 'CHENNAI', ('2013-05-12'),('2013-05-14'), 'Permanent');

Insert into LMS_MEMBERS
Values('LM004', 'RADHA', 'CHENNAI', ('2012-04-22'), ('2013-04-21'), 'Temporary');

Insert into LMS_MEMBERS
Values('LM005', 'GURU', 'BANGALORE', ('2012-03-30'), ('2013-03-29'),'Temporary');

Insert into LMS_MEMBERS
Values('LM006', 'MOHAN', 'CHENNAI', ('2012-04-12'), ('2013-04-12'),'Temporary');


select * from LMS_MEMBERS;




Insert into  LMS_SUPPLIERS_DETAILS 
Values ('S01','SINGAPORE SHOPPEE', 'CHENNAI', 989412355,'sing@gmail.com');

Insert into  LMS_SUPPLIERS_DETAILS 
Values ('S02','JK Stores', 'MUMBAI', 994012345 ,'jks@yahoo.com');

Insert into  LMS_SUPPLIERS_DETAILS 
Values ('S03','ROSE BOOK STORE', 'TRIVANDRUM', 944441122,'rose@gmail.com');

Insert into  LMS_SUPPLIERS_DETAILS 
Values ('S04','KAVARI STORE', 'DELHI', 863000145,'kavi@redif.com');

Insert into  LMS_SUPPLIERS_DETAILS 
Values ('S05','EINSTEN BOOK GALLARY', 'US', 954200001,'eingal@aol.com');

Insert into  LMS_SUPPLIERS_DETAILS 
Values ('S06','AKBAR STORE', 'MUMBAI',785562310 ,'akbakst@aol.com');



select * from LMS_SUPPLIERS_DETAILS;



Insert into LMS_FINE_DETAILS Values('R1', 20);

insert into LMS_FINE_DETAILS Values('R2', 50);

Insert into LMS_FINE_DETAILS Values('R3', 75);

Insert into LMS_FINE_DETAILS Values('R4', 100);

Insert into LMS_FINE_DETAILS Values('R5', 150);

Insert into LMS_FINE_DETAILS Values('R6', 200);



select * from lms_fine_details;


Insert into LMS_BOOK_DETAILS
Values('BL000001', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', ('1999-10-12'), 6, 600.00, 'A1',('2011-10-05'), 'S01');

Insert into LMS_BOOK_DETAILS
Values('BL000002', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt',  'Tata Mcgraw Hill ', ('2011-10-10'), 5, 750.00, 'A1', ('2011-10-05'), 'S03');

Insert into LMS_BOOK_DETAILS 
Values('BL000003', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', ('1999-02-10'), 6, 600.00, 'A1', ('2012-05-12'), 'S01');

Insert into LMS_BOOK_DETAILS
Values('BL000004', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', ('2011-10-10'), 5, 750.00, 'A1', ('2012-05-12'), 'S01');

Insert into LMS_BOOK_DETAILS 
Values('BL000005', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel',  'Prentice Hall', ('1999-12-10'), 6, 600.00, 'A1', ('2012-05-12'), 'S01');

Insert into LMS_BOOK_DETAILS
Values('BL000006', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', ('2011-10-10'), 5, 750.00, 'A1', ('2012-05-12'), 'S03');

Insert into LMS_BOOK_DETAILS 
Values('BL000007', 'Let Us C', 'C', 'Yashavant Kanetkar ', 'BPB Publications', ('2010-12-11'),  9, 500.00 , 'A3', ('2010-01-03'), 'S03');

Insert into LMS_BOOK_DETAILS 
Values('BL000008', 'Let Us C', 'C', 'Yashavant Kanetkar ','BPB Publications', ('2010-12-11'),.9, 500.00 , 'A3', ('2010-01-03'), 'S04');



select * from LMS_BOOK_DETAILS ;



Insert into LMS_BOOK_ISSUE 
Values (001, 'LM001', 'BL000001',('2012-05-01'),('2012-05-16'), ('2012-05-16'),'N', 'R1');


Insert into LMS_BOOK_ISSUE 
Values (002, 'LM002', 'BL000002', ('2012-02-12'),('2012-06-06'), ('2012-11-01'), 'N', 'R2');

Insert into LMS_BOOK_ISSUE
Values (003, 'LM003', 'BL000007', ('2012-04-19'),('2012-05-06'), ('2012-10-05'),'Y','R1');

Insert into LMS_BOOK_ISSUE 
Values (004, 'LM004', 'BL000005', ('2012-05-01'),('2012-05-16'), ('2012-05-16'), 'Y', 'R1');

Insert into LMS_BOOK_ISSUE 
Values (005, 'LM005', 'BL000008',('2012-07-11'),('2012-08-16'), ('2012-08-19') ,'N', 'R2');

-- DROP DATABASE LMS;


