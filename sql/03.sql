/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 */

-- Solution, Mustafa Hourani

SELECT DISTINCT actor.first_name, actor.last_name FROM actor

JOIN film_actor USING(actor_id)
JOIN film_category USING(film_id)
JOIN category ON film_category.category_id = category.category_id
    AND category.name = 'Children'

WHERE actor.actor_id NOT IN (
    SELECT film_actor.actor_id FROM film_actor
    JOIN film_category USING(film_id)
    JOIN category ON film_category.category_id = category.category_id 
        AND category.name = 'Horror' );
