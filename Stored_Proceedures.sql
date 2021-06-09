create procedure car_sold(in v_id int4)
language plpgsql
as $$
begin
	update vehicles 
    set is_sold = true
    where vehicle_id = v_id; 
end
$$;

call car_sold(2300);

select *
from vehicles v 
where vehicle_id = 2300

create procedure car_returned(in v_id int4, in in_num varchar)
language plpgsql
as $$
begin
	update vehicles 
    set is_sold = true 
    where vehicle_id = v_id;
   
   	update sales 
    set sale_returned = false 
    where invoice_number = in_num; 
end
$$;

call car_returned(2, '1936644983');

create procedure car_return(in v_id int4, in in_num varchar)
language plpgsql
as $$
begin
	update vehicles 
    set is_sold = false 
    where vehicle_id = v_id;
   
   	update sales 
    set sale_returned = true 
    where invoice_number = in_num; 
end
$$;

call car_return(2, '1936644983');

select 
*
from vehicles v
join sales s 
on v.vehicle_id = s.vehicle_id 
where v.vehicle_id = 2 and s.invoice_number = '1936644983'


-- CALLENS VERSION

CREATE or replace PROCEDURE return_sold_vehicle_to_inventory(in invoice_num varchar)
LANGUAGE plpgsql
AS $$
Begin
update vehicles 
set is_sold = false
where vehicle_id = (
	select s.vehicle_id 
	from sales s
	where s.invoice_number = invoice_num
);
update sales
set sale_returned = true
where invoice_number = invoice_num;
insert into oilchangelogs(date_occured, vehicle_id)
values(now(), (
	select s.vehicle_id 
	from sales s
	where s.invoice_number = invoice_num 
));
END
$$;
CALL return_sold_vehicle_to_inventory('1936644983');
select is_sold, sale_returned, o.* 
from sales s 
left join oilchangelogs o on s.vehicle_id = o.vehicle_id 
join vehicles v on v.vehicle_id = s.vehicle_id 
where s.invoice_number = '1936644983'