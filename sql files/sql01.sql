/*pending orderfile.*/
select order_id,customer_id,item,amount
from orders
where status = 'pending'
order by order_id asc;