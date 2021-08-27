-- create database lms;
use lms;
/*Create table LMS_MEMBERS
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

Insert into  LMS_SUPPLIERS_DETAILS 
Values ('S07','AK STORE', 'PUNE',null,'akbukstr@aol.com');

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

*/

-- simple ques ----------------------

/* 1:
Write a query to display the member id, member name, city and membership status who are all having life time membership. Hint: Life time membership status is “Permanent”.
*/
select member_id, member_name, city, membership_status
from lms_members
where membership_status = 'permanent';


/* 2:
Write a query to display the member id, member name who have not returned the books. Hint: Book return status is book_issue_status ='Y' or 'N'.
*/
select m.member_id, m.member_name, b.book_issue_status
from lms_members m, lms_book_issue b
where m.member_id = b.member_id and b.book_issue_status = 'n';


/* 3:
Write a query to display the member id, member name who have taken the book with book code 'BL000002'. 
*/
select m.member_id, m.member_name, b.book_code
from lms_members m, lms_book_details b, lms_book_issue i
where m.member_id = i.member_id and i.book_code = b.book_code and b.book_code = 'BL000002';


/* 4:
Write a query to display the book code, book title and author of the books whose author name begins with 'P'.
*/
select book_code, book_title, author
from lms_book_details
where author like 'p%';


/* 5:
Write a query to display the total number of Java books available in library with alias name ‘NO_OF_BOOKS’.
*/
select count(*) as NO_OF_BOOKS
from lms_book_details
where category = 'java';


/* 6:
Write a query to list the category and number of books in each category with alias name ‘NO_OF_BOOKS’.
*/
select count(category) as NO_OF_BOOKS, category
from lms_book_details
group by category;


/* 7:
Write a query to display the number of books published by "Prentice Hall” with the alias name “NO_OF_BOOKS”.
*/
select count(*) as NO_OF_BOOKS
from lms_book_details
where publication = 'prentice hall';


/*8:
Write a query to display the book code, book title of the books which are issued on the date "1st April 2012".
*/
select lms_book_details.book_code, book_title
from lms_book_issue, lms_book_details
where lms_book_issue.book_code = lms_book_details.book_code and date_issue = '2012-04-01';


/*  9:
Write a query to display the member id, member name, date of registration and expiry date of the members whose membership expiry date is before APR 2013.
*/
select member_id, member_name, date_register, date_expire
from lms_members
where date_expire < '2013-04-01';


/* 10:
write a query to display the member id, member name, date of registration, membership status of the members who registered before "March 2012" and membership status is "Temporary"
*/
select member_id, member_name, date_register, membership_status
from lms_members
where date_register < '2012-03-01' and membership_status = 'Temporary';


/* 11:
Write a query to display the member id, member name who’s City is CHENNAI or DELHI. Hint: Display the member name in title case with alias name 'Name'.
*/
select member_id, member_name as name
from lms_members
where city = 'chennai' or city = 'delhi';


/* 12:
Write a query to concatenate book title, author and display in the following format. Book_Title_is_written_by_Author
*/
select concat(book_title,' is written by ', author) as BOOK_WRITTEN_BY
from lms_book_details;


/* 13:
Write a query to display the average price of books which is belonging to ‘JAVA’ category with alias name “AVERAGEPRICE”
*/
select avg(price) as AVERAGEPRICE
from lms_book_details
where category = 'java' ;


/* 14:
Write a query to display the supplier id, supplier name and email of the suppliers who are all having gmail account.
*/
select supplier_id, supplier_name, email
from lms_suppliers_details
where email like "%@gmail.%";

-- 15 xx
/* 15:
Write a query to display the supplier id, supplier name and contact details. Contact details can be either phone
number or email or address with alias name “CONTACTDETAILS”. If phone number is null then display email,
even if email also null then display the address of the supplier. Hint: Use Coalesce function.
*/
select supplier_id,supplier_name, coalesce(contact,email,address) 'contact details' from lms_suppliers_details;


/* 16:
Write a query to display the supplier id, supplier name and contact. If phone number is null then display ‘No’ else display ‘Yes’ with alias name “PHONENUMAVAILABLE”.
*/
select supplier_id, supplier_name,
case when contact is null then 'no'
else 'yes'
end PHONENUMAVAILABLE
from lms_suppliers_details;

-- avg ques ----------------------------------------------------------------------
/* 1:
Write a query to display the member id, member name of the members, book code and book title of the books taken by them.
*/
select member_id, member_name, book_code, book_title
from lms_members join lms_book_issue
using(member_id) join lms_book_details
using(book_code) ;


/*  2 x:
Write a query to display the total number of books available in the library with alias name “NO_OF_BOOKS_AVAILABLE” (Which is not issued) 
*/
select count(*) as 'NO_OF_BOOKS_AVAILABLE'
from lms_book_issue
where BOOK_ISSUE_STATUS = 'n';


/* 3:
Write a query to display the member id, member name, fine range and fine amount of the members whose fine amount is less than 100.
*/
select member_id, member_name, FINE_RANGE, FINE_AMOUNT
from lms_members join lms_book_issue
using(member_id) join lms_fine_details
using(fine_range)
where fine_amount > 200;


/* 4:
Write a query to display the book code, book title and availability status of the ‘JAVA’ books whose edition is "6”. Show the availability status with alias name “AVAILABILITYSTATUS”. 
*/
select book_code, book_title, BOOK_ISSUE_STATUS as AVAILABILITYSTATUS
from lms_book_details join lms_book_issue
using(book_code)
where CATEGORY = 'java' and BOOK_EDITION = 6;


/* 5:
Write a query to display the book code, book title and rack number of the books which are placed in rack 'A1' and sort by book title in ascending order. 
*/
select book_code, book_title, RACK_NUM
from lms_book_details
where RACK_NUM = 'a1'
order by book_title;

/* 6:
Write a query to display the member id, member name, due date and date returned of the members who has returned the books after the due date
*/
select MEMBER_ID, MEMBER_NAME, DATE_RETURN, DATE_RETURNED
from lms_members join lms_book_issue
using(member_id)
where DATE_RETURN = DATE_RETURNED;


/* 7:
Write a query to display the member id, member name and date of registration who have not taken any book.
*/
select MEMBER_ID, MEMBER_NAME, DATE_REGISTER
from lms_members left join lms_book_issue
using(member_id)
where lms_book_issue.member_id is null;


/* 8:
Write a Query to display the member id and member name of the members who has not paid any fine in the year 2012.
*/
select MEMBER_ID, MEMBER_NAME
from lms_members join lms_book_issue
using(member_id) 
where DATE_RETURNED < DATE_RETURN ;


/*  9 x: max 
Write a query to display the date on which the maximum numbers of books were issued and the number of
books issued with alias name “NOOFBOOKS”.
*/
select DATE_ISSUE, no_of_books
from (select DATE_ISSUE, count(DATE_ISSUE) as 'no_of_books'
from lms_book_issue
where BOOK_ISSUE_STATUS = 'y'
group by DATE_ISSUE) a
having no_of_books >= max(a.no_of_books);

/* 10:
Write a query to list the book title and supplier id for the books authored by “Herbert Schildt" and the book edition is 5 and supplied by supplier ‘S01’. 
*/
select book_title, supplier_id
from lms_book_details join lms_suppliers_details
using(SUPPLIER_ID)
where AUTHOR = 'Herbert Schildt' and BOOK_EDITION = '5';


/* 11:
Write a query to display the rack number and the number of books in each rack with alias name “NOOFBOOKS” and sort by rack number in ascending order.
*/
select RACK_NUM, count(RACK_NUM) as 'NOOFBOOK'
from lms_book_details
group by RACK_NUM;

/* 12:
Write a query to display book issue number, member name, date or registration, date of expiry, book title, category author, price, date of issue, date of return, actual returned date, issue status, fine amount.  
*/
select BOOK_ISSUE_NO, member_name, DATE_REGISTER, DATE_EXPIRE, BOOK_TITLE, CATEGORY, AUTHOR, PRICE, DATE_ISSUE, DATE_RETURN, DATE_RETURNED, BOOK_ISSUE_STATUS, FINE_AMOUNT
from lms_book_issue join lms_members 
using(member_id) join lms_book_details 
using(BOOK_CODE) join lms_fine_details
using(FINE_RANGE);


/* 13:
Write a query to display the book code, title, publish date of the books which is been published in the month of December. 
*/
select BOOK_CODE, BOOK_TITLE, PUBLISH_DATE
from lms_book_details
where month(PUBLISH_DATE) = '12';

/*  14:
Write a query to display the book code, book title and availability status of the ‘JAVA’ books whose edition is "5”. Show the availability status with alias name “AVAILABILITYSTATUS”
*/
select BOOK_CODE, BOOK_TITLE, case 
when BOOK_ISSUE_STATUS='n' then 'y'
else 'n' 
end AVAILABILITYSTATUS
from lms_book_details d join lms_book_issue using(BOOK_CODE)
where CATEGORY = 'java' and BOOK_EDITION = '5';

-- cmplx ques -----------------------------------------------------
-- 1
select book_code, book_title, SUPPLIER_NAME
from lms_book_details join lms_suppliers_details using(SUPPLIER_ID)
where SUPPLIER_ID = (select SUPPLIER_ID 
					from LMS_BOOK_DETAILS 
                    group by SUPPLIER_ID 
                    having COUNT(SUPPLIER_ID)=(select MAX(cnt) from (select COUNT(*) as cnt from LMS_BOOK_DETAILS group by SUPPLIER_ID) T));


-- 2
select m.member_id, m.member_name, 3-count(b.member_id) as 'remaining books'
from lms_members m join lms_book_issue b
using(member_id)
group by b.member_id;

-- 3 !Q! can be done like 1 ?
select book_code, book_title, SUPPLIER_NAME
from lms_book_details join lms_suppliers_details using(SUPPLIER_ID)
group by SUPPLIER_ID
having count(book_code) <= all(
select count(s.supplier_name) 
from lms_book_details b join lms_suppliers_details s using(SUPPLIER_ID)
group by SUPPLIER_ID);
