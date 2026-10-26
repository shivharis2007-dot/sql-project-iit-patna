/*Headline kpis */
select count(order_id) as total_order,sum(amount) as total_revenue,avg(amount) as average_value,min(amount)as min_order_value,max(amount) as max_order_value
from orders
where status ='Completed';