do $$
declare
	newemployeeid int;
	currentts date;
	newemployeetype int;
begin
insert into employeetypes(name)
values('Automotive Mechanic')
returning employee_type_id into newemployeetype;
	insert into
		employees(
			first_name,
			last_name,
			email_address,
			phone,
			employee_type_id 
		)
	values
		(
			'Frank',
			'Miller',
			'frank@miller.com',
			'206-555-5555',
			newemployeetype
		) returning employee_id into newemployeeid;
		currentts = current_date;
	insert into dealershipemployees
		(
		employee_id,
		dealership_id 
		)
	values (
		newemployeeid,
		20
	),
	(
		newemployeeid,
		36
	),
	(
		newemployeeid,
		50
	);
--2
	insert into
		employees(
			first_name,
			last_name,
			email_address,
			phone,
			employee_type_id 
		)
	values
		(
			'Ze',
			'Frank',
			'ze@frank.com',
			'978-555-5555',
			newemployeetype
		) returning employee_id into newemployeeid;
		currentts = current_date;
	insert into dealershipemployees
		(
		employee_id,
		dealership_id 
		)
	values (
		newemployeeid,
		20
	),
	(
		newemployeeid,
		36
	),
	(
		newemployeeid,
		50
	);
	insert into
		employees(
			first_name,
			last_name,
			email_address,
			phone,
			employee_type_id 
		)
	values
		(
			'Mona',
			'Lisa',
			'mona@lisa.com',
			'999-555-5555',
			newemployeetype
		) returning employee_id into newemployeeid;
		currentts = current_date;
	insert into dealershipemployees
		(
		employee_id,
		dealership_id 
		)
	values (
		newemployeeid,
		20
	),
	(
		newemployeeid,
		36
	),
	(
		newemployeeid,
		50
	);
	insert into
		employees(
			first_name,
			last_name,
			email_address,
			phone,
			employee_type_id 
		)
	values
		(
			'Dan',
			'Harmon',
			'rick@morty.com',
			'000-555-5555',
			newemployeetype
		) returning employee_id into newemployeeid;
		currentts = current_date;
	insert into dealershipemployees
		(
		employee_id,
		dealership_id 
		)
	values (
		newemployeeid,
		20
	),
	(
		newemployeeid,
		36
	),
	(
		newemployeeid,
		50
	);
	insert into
		employees(
			first_name,
			last_name,
			email_address,
			phone,
			employee_type_id 
		)
	values
		(
			'Beth',
			'Harmon',
			'queen@bishop.com',
			'987-555-5555',
			newemployeetype
		) returning employee_id into newemployeeid;
		currentts = current_date;
	insert into dealershipemployees
		(
		employee_id,
		dealership_id 
		)
	values (
		newemployeeid,
		20
	),
	(
		newemployeeid,
		36
	),
	(
		newemployeeid,
		50
	);
end;
$$ language plpgsql;


/*Create a transaction for:
Creating a new dealership in Washington, D.C. called Felphun Automotive
Hire 3 new employees for the new dealership: Sales Manager, General Manager and Customer Service.
All employees that currently work at Nelsen Autos of Illinois will now start working at Cain Autos of Missouri instead.*/
do $$
declare
	newdealershipid int;
	newemployeeid int;
begin 
	INSERT INTO dealerships
(business_name, phone, city, state, website, tax_id)
VALUES(
'Felphun Automotive', 
'555-555-5555', 
'Washington D.C', 
'D.C', 
'http://www.carnivalcars.com/felphunautomotive', 
'dc-749-iz-2m08')
returning dealership_id into newdealershipid;
INSERT INTO employees
(first_name, last_name, email_address, phone, employee_type_id)
VALUES('Curly', 'Howard', 'curly@stooges.com', '555-555-5555', 3)
returning employee_id into newemployeeid;
insert into dealershipemployees
		(
		employee_id,
		dealership_id 
		)
	values (
		newemployeeid,
		newdealershipid
	);
INSERT INTO employees
(first_name, last_name, email_address, phone, employee_type_id)
VALUES('Mo', 'Howard', 'mo@stooges.com', '123-123-1234', 6)
returning employee_id into newemployeeid;
insert into dealershipemployees 
		(
		employee_id,
		dealership_id 
		)
	values (
		newemployeeid,
		newdealershipid
	);
INSERT INTO employees
(first_name, last_name, email_address, phone, employee_type_id)
VALUES('Larry', 'Howard', 'larry@stooges.com', '123-123-1234', 4)
returning employee_id into newemployeeid;
insert into dealershipemployees 
		(
		employee_id,
		dealership_id 
		)
	values (
		newemployeeid,
		newdealershipid
	);
--All employees that currently work at Nelsen Autos of Illinois will now start working at Cain Autos of Missouri instead.*/
update dealershipemployees de
set dealership_id = (
	select
		dealership_id
		from dealerships d
		where d.business_name ilike '%Cain Autos of Missouri')
where dealership_id = (
	select
		dealership_id
		from dealerships d
		where d.business_name ilike '%Nelsen Autos of Illinois'
);
END;
$$ language plpgsql;
select * from dealershipemployees d where dealership_id = 3;
select *
from employees e 
where e.first_name = 'Curly';

--Adding 5 brand new 2021 Honda CR-Vs to the inventory. They have I4 engines and are classified as a Crossover SUV or CUV. 
--All of them have beige interiors but the exterior colors are Lilac, Dark Red, Lime, Navy and Sand.
--The floor price is $21,755 and the MSR price is $18,999.
do $$
declare
	newvehicletype int;
	newmake int;
	newmodel int;
	newtypeid int;
begin
insert into vehiclebodytype(name)
values('CUV')
returning vehicle_body_type_id into newvehicletype;
insert into vehiclemake(name)
values('Honda')
returning vehicle_make_id into newmake;
insert into vehiclemodel(name)
values('CR-V')
returning vehicle_model_id into newmodel;
insert into vehicletypes(body_type_id, make_id, model_id)
values(newvehicletype, newmake, newmodel)
returning vehicle_type_id into newtypeid;
-- 1
insert into vehicles 
(vin, 
engine_type, 
vehicle_type_id, 
exterior_color, 
interior_color, 
floor_price, 
msr_price, 
miles_count, 
year_of_car, 
is_sold, is_new, 
dealership_location_id)
VALUES(
'3452345fea45dscv', 
'I4', 
newtypeid, 
'lilac', 
'beige', 
21755, 
18999, 
0, 
2021, 
false, 
true, 
4);
--2
insert into vehicles 
(vin, 
engine_type, 
vehicle_type_id, 
exterior_color, 
interior_color, 
floor_price, 
msr_price, 
miles_count, 
year_of_car, 
is_sold, is_new, 
dealership_location_id)
VALUES(
'345234sd5fea45dscv', 
'I4', 
newtypeid, 
'dark red', 
'beige', 
21755, 
18999, 
0, 
2021, 
false, 
true, 
4);
--3
insert into vehicles 
(vin, 
engine_type, 
vehicle_type_id, 
exterior_color, 
interior_color, 
floor_price, 
msr_price, 
miles_count, 
year_of_car, 
is_sold, is_new, 
dealership_location_id)
VALUES(
'234sd5fea45dscv', 
'I4', 
newtypeid, 
'lime', 
'beige', 
21755, 
18999, 
0, 
2021, 
false, 
true, 
4);
--4
insert into vehicles 
(vin, 
engine_type, 
vehicle_type_id, 
exterior_color, 
interior_color, 
floor_price, 
msr_price, 
miles_count, 
year_of_car, 
is_sold, is_new, 
dealership_location_id)
VALUES(
'ppfgzr0dsvmWKE', 
'I4', 
newtypeid, 
'navy', 
'beige', 
21755, 
18999, 
0, 
2021, 
false, 
true, 
4);
--5
insert into vehicles 
(vin, 
engine_type, 
vehicle_type_id, 
exterior_color, 
interior_color, 
floor_price, 
msr_price, 
miles_count, 
year_of_car, 
is_sold, is_new, 
dealership_location_id)
VALUES(
'Silasd5fea45dscv', 
'I4', 
newtypeid, 
'sand', 
'beige', 
21755, 
18999, 
0, 
2021, 
false, 
true, z
4);
end;
$$
language plpgsql;
select *
from vehicle