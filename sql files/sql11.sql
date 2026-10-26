/*here the disticnt is nesscary because we want count of unique coustomers*/
/*the join here we use to connect the 2 table which has a common column as customer_id*/
SELECT c.region AS region,
       o.order_month AS order_month,
       COUNT(*) AS number_of_orders,
       COUNT(DISTINCT c.customer_id)
         AS number_of_customers,
       SUM(o.amount) AS total_revenue,
       AVG(o.amount) AS average_revenue
FROM orders AS o
JOIN customers AS c
  ON o.customer_id = c.customer_id
WHERE o.status = 'completed'
GROUP BY c.region, o.order_month
ORDER BY c.region ASC, o.order_month ASC;