/* Q11: Completed orders by region and month.
   DISTINCT is needed so a customer with several orders is counted once.
   The JOIN links orders to customers through customer_id. */
SELECT c.region AS region,
       o.order_month AS order_month,
       COUNT(*) AS number_of_orders,
       COUNT(DISTINCT c.customer_id) AS number_of_customers,
       SUM(o.amount) AS total_revenue,
       ROUND(AVG(o.amount), 2) AS average_revenue
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
WHERE o.status = 'completed'
GROUP BY c.region, o.order_month
ORDER BY c.region ASC, o.order_month ASC;
