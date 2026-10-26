/*Target customer segment.*/
select customer_id,first_name,last_name,region,age
from customers
where age between 25 and 40  and region in ('NORTH','WEST')
order by age asc;