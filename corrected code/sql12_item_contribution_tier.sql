/* Q12: Item contribution tier on completed revenue */
SELECT item,
       SUM(amount) AS total_revenue,
       CASE
         WHEN SUM(amount) >= 60000 THEN 'high'
         WHEN SUM(amount) >= 15000 THEN 'medium'
         ELSE 'low'
       END AS contribution_tier
FROM orders
WHERE status = 'completed'
GROUP BY item
ORDER BY total_revenue DESC;
