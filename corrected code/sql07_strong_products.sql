/* Q7: Strong products - completed revenue above 20000 */
SELECT item,
       COUNT(order_id) AS number_of_orders,
       SUM(amount)     AS revenue
FROM orders
WHERE status = 'completed'
GROUP BY item
HAVING SUM(amount) > 20000
ORDER BY revenue DESC;
