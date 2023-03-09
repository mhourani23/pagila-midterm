/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query SELECT query that:
 * Lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 * (You may choose to either include or exclude the movie 'AMERICAN CIRCUS' in the results.)
 */

-- Solutions, Mustafa Hourani


WITH american_circus AS(
    SELECT * FROM film_actor
    WHERE film_actor.film_id IN (
        SELECT film_id FROM film
        WHERE title = 'AMERICAN CIRCUS')),

american_circus_films AS(
    SELECT film_actor.film_id FROM american_circus
    JOIN film_actor USING(actor_id)
    GROUP BY film_actor.film_id
    HAVING COUNT(american_circus.actor_id) >= 2)

SELECT title from film
JOIN american_circus_films USING(film_id)
ORDER BY title;
