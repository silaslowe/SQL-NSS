/* Question for class: Should the payment types be normalized? */
/* What is a good way of know that the result you wanted was correct, especially if the data that is returned is */


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

-- Get a list of the sales that were made for each sales type.

select 
s.sale_id, 
s2.name
from sales s 
right join salestypes s2 
on s.sales_type_id = s2.sales_type_id 


-- Get a list of sales with the VIN of the vehicle, the first name and last name of the customer, first name and last name of the employee who made the sale and the name, city and state of the dealership.

select
v.vin,
concat(c.first_name, ' ', c.last_name) as customer_full_name,
concat(e.first_name, ' ', e.last_name) as employee_full_name,
d.business_name,
d.city,
d.state
from vehicles v
left join sales s 
on v.vehicle_id = s.vehicle_id 
left join customers c 
on s.customer_id = c.customer_id
left join employees e 
on e.employee_id = s.employee_id 
left join dealerships d 
on d.dealership_id = s.dealership_id 

-- Get a list of all the dealerships and the employees, if any, working at each one.

select 
d.business_name,
concat(e.first_name, ' ', e.last_name) as employee_full_name
from dealerships d 
left join dealershipemployees d2 
on d.dealership_id = d2.dealership_id 
left join employees e 
on d2.employee_id = e.employee_id 

-- Get a list of vehicles with the names of the body type, make, model and color.

select
v.vehicle_id id,
b.name as body_type,
m.name as make,
m2.name as model
from vehicles v 
left join vehicletypes t 
on v.vehicle_type_id = t.vehicle_type_id
left join vehiclebodytype b 
on t.body_type_id = b.vehicle_body_type_id
left join vehiclemake m 
on t.make_id = m.vehicle_make_id
left join vehiclemodel m2
on t.model_id = m2.vehicle_model_id







