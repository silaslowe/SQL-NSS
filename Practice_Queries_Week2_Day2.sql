select 
	d.business_name,
	d.city,
	d.state,
	d.website
from dealerships d; 

select 
	c.first_name,
	c.last_name,
	c.email 
from customers c; 

select *
from sales s
where s.sales_type_id = 2


SELECT *
FROM sales
WHERE sales_type_id 
IN (SELECT sales_type_id FROM salestypes WHERE name = 'Lease')

select *
from sales s 
where date(s.purchase_date) >= '2019-05-27' 

select *
from sales s 
where payment_method = 'americanexpress' or deposit > 5000

/* Question for class: Should the payment types be normalized? */

