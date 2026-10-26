select region,sum(customer_id) as number_of_customers,avg(age) as average_age,min(age)as min_age,max(age)as max_age
from customers
group by region
order by region;