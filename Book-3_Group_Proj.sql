--Provide a way for the accounting team to track all financial transactions by creating 
--a new table called Accounts Receivable. The table should have the following columns: credit_amount, debit_amount, 
--date_received as well as a PK and a FK to associate a sale with each transaction.

create table accountsreceivable(
accounts_receivable_id INT PRIMARY KEY GENERATED ALWAYS AS identity, 
credit_amount int, 
debit_amount numeric(8,2), 
date_received date,
sale_id  int references sales(sale_id)
);

--Set up a trigger on the Sales table. When a new row is added, add a new record to the Accounts Receivable table
-- with the deposit as credit_amount, the timestamp as date_received and the appropriate sale_id.

create or replace function update_accounts_receivable()
returns trigger 
language plpgsql
as $$
begin 
	insert into public.accountsreceivable(credit_amount, debit_amount, date_received, sale_id) values (
	(select deposit from sales where sales.sale_id = NEW.sale_id), 
	(select price - deposit from sales where sales.sale_id = NEW.sale_id),
	current_date,
	(select sale_id from sales where sales.sale_id = NEW.sale_id));
	return null;
end;
$$
create trigger add_accounts_receivable
after insert
on sales
for each row
execute procedure update_accounts_receivable();
INSERT INTO public.sales
(sales_type_id, vehicle_id, employee_id, customer_id, dealership_id, price, deposit, purchase_date, invoice_number, payment_method, sale_returned)
VALUES(3, 26, 33, 1, 15, 20000, 999, '2021-06-22', '123124123123123', 'masterfart', false);
select *
from accountsreceivable a ;