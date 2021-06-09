--Write a query that shows the total purchase sales income per dealership.
 select SUM(price),d.business_name
 from sales s
 join dealerships d using(dealership_id)
GROUP By d.business_name;
--Write a query that shows the purchase sales income per dealership for the current month.
 select SUM(price),d.business_name
 from sales s
 join dealerships d using(dealership_id)
where s.purchase_date >= current_date - interval '1 month'
 GROUP By d.business_name
--Write a query that shows the purchase sales income per dealership for the current year.
  select SUM(price),d.business_name
 from sales s
 join dealerships d using(dealership_id)
where s.purchase_date >= current_date - interval '1 year'
 GROUP By d.business_name
-- Write a query that shows the total lease income per dealership.
   select SUM(price),d.business_name
 from sales s
 join dealerships d using(dealership_id)
where s.sales_type_id = '2'
 GROUP By d.business_name
--Write a query that shows the lease income per dealership for the current month.
  select SUM(price),d.business_name
 from sales s
 join dealerships d using(dealership_id)
where s.sales_type_id = '2' and s.purchase_date >= current_date - interval '1 month'
 GROUP By d.business_name
--Write a query that shows the lease income per dealership for the current year.
 select SUM(price),d.business_name
 from sales s
 join dealerships d using(dealership_id)
where s.sales_type_id = '2' and s.purchase_date >= current_date - interval '1 year'
 GROUP By d.business_name
-- Write a query that shows the total income (purchase and lease) per employee.
 select sum(price),
e.first_name || ' ' || e.last_name as emp_name
from sales s
join employees e on e.employee_id = s.employee_id
group by emp_name;