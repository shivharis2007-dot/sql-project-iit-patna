/* Q8: Customer count and age statistics by region */
SELECT region,
       COUNT(customer_id) AS number_of_customers,
       ROUND(AVG(age), 2) AS average_age,
       MIN(age)           AS min_age,
       MAX(age)           AS max_age
FROM customers
GROUP BY region
ORDER BY region ASC;
