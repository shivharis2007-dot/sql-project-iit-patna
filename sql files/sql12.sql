select o.item,sum(o.amount) as total_revenue,
case 
when sum(o.amount)>=60000 then 'high'
when sum(o.amount)>=15000 then 'medium'
else 'low'
end as contribution_tier
from orders as o
where o.status ='Completed'
group by o.item
order by sum(o.amount)  desc;