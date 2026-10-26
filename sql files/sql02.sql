/*missing amount*/
select order_id,customer_id,item,status
from orders
where amount is null
order by order_id;