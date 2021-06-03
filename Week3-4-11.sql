Which model of vehicle has the lowest current inventory? This will help dealerships know which models the purchase from manufacturers.

select 
v2.name as model_name,
count(v2.name)
from vehicles v 
join vehicletypes vt
on v.vehicle_type_id = vt.vehicle_type_id 
join vehiclemodel v2 
on vt.model_id	= v2.vehicle_model_id
where v.is_sold = false
group by v2.name
order by count asc 
limit 1;

Which model of vehicle has the highest current inventory? This will help dealerships know which models are, perhaps, not selling.

select 
v2.name as model_name,
count(v2.name)
from vehicles v 
join vehicletypes vt
on v.vehicle_type_id = vt.vehicle_type_id 
join vehiclemodel v2 
on vt.model_id	= v2.vehicle_model_id
where v.is_sold = false
group by v2.name
order by count desc 
limit 1;

Which dealerships are currently selling the least number of vehicle models? This will let dealerships market vehicle models more effectively per region.

select
d.business_name,
count(distinct v3.name) as models_in_stock 
from dealerships d 
join vehicles v 
on d.dealership_id = v.dealership_location_id 
join vehicletypes v2 
on v.vehicle_type_id = v2.vehicle_type_id 
join vehiclemodel v3 
on v2.model_id = v3.vehicle_model_id
where v.is_sold = false
group by d.business_name
order by models_in_stock asc

Which dealerships are currently selling the highest number of vehicle models? This will let dealerships know which regions have either a high population, or less brand loyalty.

select
d.business_name,
count(distinct v3.name) as models_in_stock 
from dealerships d 
join vehicles v 
on d.dealership_id = v.dealership_location_id 
join vehicletypes v2 
on v.vehicle_type_id = v2.vehicle_type_id 
join vehiclemodel v3 
on v2.model_id = v3.vehicle_model_id
where v.is_sold = false
group by d.business_name
order by models_in_stock desc