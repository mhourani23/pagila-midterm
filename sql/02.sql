/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it. 
 */

-- Solutions, Mustafa Hourani

SELECT country FROM customer

JOIN address USING(address_id)
JOIN city USING(city_id)
JOIN country USING(country_id)
WHERE NOT country = 'United States'

GROUP BY country 
ORDER BY COUNT(DISTINCT customer_id) DESC
LIMIT 1;
