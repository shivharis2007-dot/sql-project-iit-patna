/* Q3: Five biggest completed orders (ties broken by order_id) */
SELECT order_id, customer_id, item, amount, status
FROM orders
WHERE status = 'completed'
ORDER BY amount DESC, order_id ASC
LIMIT 5;
