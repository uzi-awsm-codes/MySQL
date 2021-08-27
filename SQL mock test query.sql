-- 892953 Uzair Ahmed

/*
1. Write a query to display movie names and number of times that movie is issued to customers. Incase movies are never issued to customers display number of times as 0. 
Display the details in sorted order based on number of times (in descending order)  and then by movie name (in ascending order). */

select movie_name, count(cid.movie_id) ISSUE_COUNT 
from movies_master mm left join customer_issue_details cid on mm.movie_id=cid.movie_id 
group by movie_name 
order by Issue_count desc, movie_name;

/*2.Write a query to display id,name,age,contact no of customers whose age is greater than 25 and and who have registered in the year 2012.  
 Display contact no in the below format +91-XXX-XXX-XXXX example +91-987-678-3434 and use the alias name as "CONTACT_ISD". If the contact no is null then display as 'N/A'. 
 Sort all the records in ascending order based on age and then by name */
 
select customer_id, customer_name, age, coalesce(concat('+91-',substring(contact_no,1,3),'-',substring(contact_no,4,3),'-',substring(contact_no,7)),'N/A') CONTACT_ISD 
from customer_master 
where age>25 and year(date_of_registration)=2012 
order by age , customer_name;
 
/*
3.Write a query to display customer id, customer name, card id, card description and card amount in dollars of customers who have taken movie on the same day the library card is registered.
For Example Assume John registered a library card on 12th Jan 2013 and he took a movie on 12th Jan 2013 then display his details.
AMOUNT_DOLLAR = amount/52.42 and round it to zero decimal places and display as $Amount. Example Assume 500 is the amount then dollar value will be $10.
Hint: Use AMOUNT_DOLLAR as alias name for amount in dollar.
Display the records in ascending order based on customer name.
*/

select ccd.customer_id, customer_name, ccd.card_id, description, concat('$',round(amount/52.42,0)) AMOUNT_DOLLAR 
from customer_master cm join customer_card_details ccd 
on cm.customer_id=ccd.customer_id join library_card_master lcm 
on ccd.card_id=lcm.card_id  join customer_issue_details cid on cid.customer_id = cm.customer_id 
where cm.date_of_registration=cid.issue_date 
order by customer_name;

/* 4.Write a query to display customer id and total rent paid by the customers who are issued with the videos. Need not display the customers who has not taken / issued with any videos. 
Hint: Alias Name for total rent paid is TOTAL_COST. Display the records sorted in ascending order based on customer id */

select cid.customer_id,  sum(mm.RENTAL_COST) as total_cost 
from customer_issue_details cid join  movies_master mm on cid.movie_id=mm.movie_id
group by cid.customer_id;
