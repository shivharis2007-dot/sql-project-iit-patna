/* Q6: Orders and amount by status */
SELECT status,
       COUNT(order_id) AS number_of_orders,
       SUM(amount)     AS total_amount
FROM orders
GROUP BY status
ORDER BY number_of_orders DESC, status ASC;
