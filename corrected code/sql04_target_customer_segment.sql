/* Q4: Target customer segment (age 25-40, North or West) */
SELECT customer_id, first_name, last_name, region, age
FROM customers
WHERE age BETWEEN 25 AND 40
  AND region IN ('North', 'West')
ORDER BY age ASC, customer_id ASC;
