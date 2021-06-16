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