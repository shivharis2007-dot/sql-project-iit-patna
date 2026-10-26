/*orders by stats*/
select count(order_id) as number_of_orders,status,sum(amount)as total_amount
from orders
group by status  
order by number_of_orders desc;