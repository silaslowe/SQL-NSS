CREATE FUNCTION set_pickup_date() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
  -- trigger function logic
  UPDATE sales
  SET pickup_date = NEW.purchase_date + integer '7'
  WHERE sales.sale_id = NEW.sale_id;
  
  RETURN NULL;
END;
$$

CREATE TRIGGER new_sale_made
  AFTER INSERT
  ON sales
  FOR EACH ROW
  EXECUTE PROCEDURE set_pickup_date();
  
INSERT INTO public.sales
(sales_type_id, vehicle_id, employee_id, customer_id, dealership_id, price, deposit, purchase_date, invoice_number, payment_method, sale_returned)
VALUES(2, 999, 380, 22, 16, 21868.37,	12648, '2005-08-26', '373186005', 'jcb', false);


select * 
from sales s 


-- Set the website to the prefix plus name where undercores replace spaces 

CREATE FUNCTION set_business_website_url() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
  -- trigger function logic
  UPDATE dealerships
  SET website = concat('http://www.carnivalcars.com/', lower(replace(NEW.business_name, ' ', '_')))
  WHERE dealerships.dealership_id = NEW.dealership_id;
  RETURN NULL;
END;
$$

CREATE TRIGGER new_business_website_url
  AFTER INSERT
  ON dealerships
  FOR EACH ROW
  EXECUTE PROCEDURE set_business_website_url();
 
 
 
INSERT INTO public.dealerships(
	business_name, phone, city, state, tax_id)
	VALUES ('Gary Honda of Tennessee', 
			'205-377-6957', 
			'Nashville', 
			'Tennessee', '123-123-123');

-- If a phone number is not provided for a new dealership, set the phone number to the default customer care number 777-111-0305.


CREATE FUNCTION set_default_phone() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
  -- trigger function logic
	  UPDATE dealerships
	  SET phone = COALESCE(NEW.phone, '777-111-0305')
	  WHERE dealerships.dealership_id = NEW.dealership_id;
  RETURN NULL;
END;
$$


CREATE TRIGGER default_phone
  AFTER INSERT
  ON dealerships
  FOR EACH ROW
  EXECUTE PROCEDURE set_default_phone();

INSERT INTO public.dealerships(
	business_name, phone, city, state, tax_id)
	VALUES ('Anita Carrsss of Tennessee', '555-555-5555', 'Nashville', 'Tennessee', '123-123-123');
		
select *
from dealerships d 

update dealerships d
set d.city = "Asheville"  
where d.dealership_id = 53;

-- For accounting purposes, the name of the state needs to be part of the dealership's tax id. For example, if the tax id provided is bv-832-2h-se8w for a dealership in Virginia, then it needs to be put into the database as bv-832-2h-se8w--virginia.

CREATE FUNCTION set_tax_id() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
  -- trigger function logic
  UPDATE dealerships
  SET tax_id = concat(NEW.tax_id, '--', lower(NEW.state))
  WHERE dealerships.dealership_id = NEW.dealership_id;
  RETURN NULL;
END;
$$

CREATE TRIGGER new_tax_id
  AFTER INSERT
  ON dealerships
  FOR EACH ROW
  EXECUTE PROCEDURE set_tax_id();

select *
from dealerships d 

INSERT INTO public.dealerships(
	business_name, phone, city, state, tax_id)
	VALUES ('Anita Lottta Trucks of Tennessee', '665-555-5555', 'Austin', 'Tennessee', '321-123-231');

