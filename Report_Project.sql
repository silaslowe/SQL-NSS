Who are the top 5 employees for generating sales income?


select
	e.first_name || ' ' || e.last_name as full_name,
	e.employee_id, s.employee_id, SUM(s.price) as total
from employees e 
join sales s
on e.employee_id = s.employee_id
group by full_name,s.employee_id, e.employee_id
order by total desc 
limit 5

Who are the top 5 dealership for generating sales income?


select
	d.business_name, d.dealership_id,
	 SUM(s.price) as total
from dealerships d 
join sales s
on d.dealership_id = s.dealership_id
group by d.business_name, d.dealership_id, s.dealership_id 
order by total desc 
limit 5

Which vehicle model generated the most sales income?

select 
	 v3.name, SUM(s.price) as total
from vehicles v 
join vehicletypes v2 
	on v2.vehicle_type_id = v.vehicle_type_id 
join vehiclemodel v3 
	on v3.vehicle_model_id = v2.model_id 
join sales s 
	on v.vehicle_id = s.vehicle_id 
group by v3.name
order by total desc 
limit 1

select 
round(avg(s.price),2) as average, c.state 
from customers c 
join sales s 
on c.customer_id = s.customer_id
group by c.state
order by average desc, c.state


select 
round(avg(s.price),2) as average, c.state 
from customers c 
join sales s 
on c.customer_id = s.customer_id
group by c.state
order by average desc, c.state
limit 5



Get the employee with the highest highest sales by dealership


with ranked_dealership_employees as (
	with employees_sales as (
		SELECT 	e.employee_id,
				e.first_name || ' ' || e.last_name as "employee name",
				SUM(s.price) as employee_sales
		   FROM employees e
			JOIN sales s ON e.employee_id = s.employee_id
		  WHERE s.sale_returned IS NOT TRUE
		  GROUP BY e.employee_id
		  ORDER BY (SUM(s.price)::double precision::numeric::money) DESC
	)
	select 
		d2.business_name,
		es."employee name",
		es.employee_sales,
		row_number() over (
			partition by d2.dealership_id
			order by es.employee_sales desc
		) as sales_ranking
	from employees_sales es
	join dealershipemployees d using (employee_id)
	join dealerships d2 using (dealership_id)
	where sales_ranking = 1
	order by d2.business_name
)
select business_name, "employee name", employee_sales, sales_ranking
from ranked_dealership_employees
where sales_ranking = 1