/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 *
 * Write a SQL query that lists the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 * 4) have never been rented by anyone with an 'F' in their address (at the street, city, or country level).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

-- Solutions Mustafa Hourani

SELECT title FROM film 

-- 1
EXCEPT
SELECT title FROM film 
WHERE title ILIKE '%f%'

-- 2
EXCEPT 
SELECT title FROM film
JOIN film_actor USING(film_id)
JOIN actor USING(actor_id)
WHERE first_name ILIKE '%f%' OR last_name ILIKE '%f%'

-- 3
EXCEPT
SELECT title FROM film
JOIN inventory USING(film_id)
JOIN rental USING(inventory_id)
JOIN customer USING(customer_id)
WHERE first_name ILIKE '%f%' OR last_name ILIKE '%f%'

-- 4
EXCEPT
SELECT title FROM film
JOIN inventory USING(film_id)
JOIN rental USING(inventory_id)
JOIN customer USING(customer_id)
JOIN address USING(address_id)
JOIN city USING(city_id)
JOIN country USING(country_id)
WHERE country ILIKE '%f%' OR city ILIKE '%f%' OR address ILIKE '%f%' OR address2 ILIKE '%f%'

ORDER BY 1;
