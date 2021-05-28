/* Question for class: Should the payment types be normalized? */

-- Write a query that returns the business name, city, state, and website for each dealership. Use an alias for the Dealerships table.

select 
	d.business_name,
	d.city,
	d.state,
	d.website
from dealerships d; 

-- Write a query that returns the first name, last name, and email address of every customer. Use an alias for the Customers table.

select 
	c.first_name,
	c.last_name,
	c.email 
from customers c; 

select *
from sales s
where s.sales_type_id = 2

-- Get a list of sales records where the sale was a lease.

SELECT *
FROM sales
WHERE sales_type_id 
IN (SELECT sales_type_id FROM salestypes WHERE name = 'Lease')

-- Get a list of sales where the purchase date is within the last two years.

select *
from sales s 
where date(s.purchase_date) >= '2019-05-27' 

-- Get a list of sales where the deposit was above 5000 or the customer payed with American Express.

select *
from sales s 
where payment_method = 'americanexpress' or deposit > 5000

-- Get a list of employees whose first names start with "M" or ends with "E".

select *
from employees e 
where e.first_name like 'M%' or e.first_name like 'E%'

-- Get a list of employees whose phone numbers have the 604 area code.

select *
from employees e 
where e.phone like '604%'





