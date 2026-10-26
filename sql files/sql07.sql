/* strong product */
select item ,count(order_id) as number_of_orders,sum(amount) as revenue
from orders
where status ='Completed'
group by item
having revenue >20000
order by revenue desc;