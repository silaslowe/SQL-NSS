--For the CX-5s and CX-9s in the inventory that have not been sold, change the year of the car to 2021 since we will be updating our stock of Mazdas.
--For all other unsold Mazdas, update the year to 2020. The newer Mazdas all have red and black interiors.
do $$
begin 
update vehicles v
set year_of_car = 2021, interior_color = 'Red and Black'
where year_of_car = 2020 and is_sold = false and v.vehicle_type_id in (select v.vehicle_type_id 
from vehiclemodels vm
join vehicletypes vt on vm.vehicle_model_id = vt.vehicle_model_id 
join vehicles v on vt.vehicle_type_id = v.vehicle_type_id 
where vm.name like 'CX-5' or vm.name like 'CX-9');
update vehicles v 
set year_of_car = 2020
where year_of_car < 2020 and is_sold = false and v.vehicle_type_id in (select v.vehicle_type_id 
from vehiclemodels vm
join vehicletypes vt on vm.vehicle_model_id = vt.vehicle_model_id 
join vehicles v on vt.vehicle_type_id = v.vehicle_type_id 
where vm.name like 'CX-5' or vm.name like 'CX-9');
end;
$$ language plpgsql;