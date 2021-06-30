create table denormalizedvehicles
(vehicle_id INT PRIMARY KEY GENERATED ALWAYS AS identity,
vin varchar(50),
engine_type varchar(2),
vehicle_type_id INT REFERENCES VehicleTypes (vehicle_type_id),
exterior_color varchar(50),
interior_color varchar(50),
floor_price int,
msr_price int,
miles_count int,
year_of_car int,
is_sold bool,
is_new bool,
dealership_location_id int,
body_type varchar,
make varchar,
model varchar);
do
$$
declare
v record;
begin
for v in (select * from Vehicles)	
loop
insert into  denormalizedvehicles(
vin,
engine_type,
vehicle_type_id,
exterior_color,
interior_color,
floor_price,
msr_price,
miles_count,
year_of_car,
is_sold,
is_new,
dealership_location_id,
body_type,
make,
model
)VALUES(
v.vin,
v.engine_type,
v.vehicle_type_id,
v.exterior_color,
v.interior_color,
v.floor_price,
v.msr_price,
v.miles_count,
v.year_of_car,
v.is_sold,
v.is_new,
v.dealership_location_id,
(
select VB."name" from VEHICLEBODYTYPE vb
join VEHICLETYPES VT on VT.BODY_TYPE_ID = VB.VEHICLE_BODY_TYPE_ID
where VT.VEHICLE_TYPE_ID = V.VEHICLE_TYPE_ID
),
(select VM."name" from VEHICLEMAKE vm
join VEHICLETYPES VT on VT.MAKE_ID = VM.VEHICLE_MAKE_ID
where VT.VEHICLE_TYPE_ID = V.VEHICLE_TYPE_ID
),
(select VM."name" from VEHICLEMODEL vm
join VEHICLETYPES VT on VT.MODEL_ID = VM.VEHICLE_MODEL_ID
where VT.VEHICLE_TYPE_ID = V.VEHICLE_TYPE_ID)
);
end loop;
end;
$$

EXPLAIN analyze SELECT
	*
FROM denormalizedvehicles  dv
Planning Time: 5.477 ms
Execution Time: 5.076 ms





8:10
SELECT * from Employees WHERE employee_type_id = 1;
  explain analyze select * from Employees WHERE employee_type_id = 1;
  SELECT * from Sales WHERE dealership_id = 500;
  explain analyze SELECT * from Sales WHERE dealership_id = 500;
  SELECT * from customers WHERE state = 'CA';
  explain analyze SELECT * from customers WHERE state = 'CA';
  SELECT * from vehicles where year_of_car BETWEEN 2018 AND 2020;
  explain analyze SELECT * from vehicles where year_of_car BETWEEN 2018 AND 2020;
  SELECT * from vehicles where floor_price < 30000;
   explain analyze  SELECT * from vehicles where floor_price < 30000;
8:11
SELECT * from Sales WHERE dealership_id = 50;
  explain analyze SELECT * from Sales WHERE dealership_id = 50;