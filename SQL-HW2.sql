
--question 1 
select address.address_id, first_name, last_name, district 
from address
full outer join customer
on address.address_id = customer.address_id
where district = 'Texas';

--question 2
select payment.customer_id, amount, first_name, last_name
from payment
full outer join customer
on payment.customer_id  = customer.customer_id 
where amount > 6.99;

--question 3
select customer_id, first_name, last_name
from customer 
where customer_id in (
	select customer_id
	from payment 
	group by customer_id 
	having sum(amount) > 175
);

--question 4
select customer_id, first_name, last_name 
from customer
where address_id in(
	select address_id
	from address
	where city_id in (
		select city_id 
		from city 
		where city = 'Nepal'
	)
);

--question 5 
select payment.staff_id, first_name, last_name, count(payment.payment_id)
from payment 
full outer join staff 
on payment.staff_id = staff.staff_id
group by payment.staff_id, staff.first_name, staff.last_name 
order by count desc

--question 6
select count(rating), rating from film
group by rating 
order by count

--question 7 
select customer_id, first_name, last_name
from customer 
where customer_id in (
	select customer_id
	from payment 
	group by customer_id, amount
	having amount > 6.99 
)
order by customer_id ;

--question 8 
select count(store_id), store_id, payment.amount
from customer 
full outer join payment 
on customer.customer_id = payment.customer_id 
where amount = 0
group by amount, store_id;








