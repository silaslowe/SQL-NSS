update dealershipemployees 
set employee_id = 20
where employee_id = (employee_id from employees where first_name = 'Kristopher' and last_name = 'Blumflied')

update sales 
set payment_method = 'mastercard'
where invoice_number = '9086714242'

select * 
from sales s 
where invoice_number ='9086714242'
