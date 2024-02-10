USE sakila;


#2
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

#3.1: 3.1 Titles of all films from the film table
SELECT title
FROM film;

#3.2: List of languages used in films, with the column aliased as language from the language table
SELECT name AS language
FROM language;

#3.3: List of first names of all employees from the staff table
SELECT first_name
FROM staff;

#4 Retrieve unique release years.

SELECT DISTINCT release_year
FROM film;

#5 Counting records for database insights:
#5.1 Determine the number of stores that the company has.

SELECT store_id, COUNT(*) as total_stores
FROM store
GROUP BY store_id;

#5.2 Determine the number of employees that the company has.

SELECT staff_id, COUNT(*)
FROM staff
GROUP BY staff_id;

#5.3 Determine how many films are available for rent and how many have been rented.

# Select my films in inventory where inventory_id is not in rental because the inventory_id in rental are rented/not available
SELECT (film_id) FROM inventory
WHERE inventory_id NOT IN(SELECT inventory_id FROM rental);

#Select my films in rental where inventory_id is not in inventory because the inventory_id in rental are my rented.
# but I don't have film_id I have inventory_id.
SELECT COUNT(inventory_id)
FROM rental
WHERE inventory_id NOT IN(SELECT COUNT(inventory_id) FROM inventory);
 
#5.4 Determine the number of distinct last names of the actors in the database.

SELECT COUNT(DISTINCT last_name)
FROM customer;

#6 Retrieve the 10 longest films.
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;

#7 USE filtering techniques in order to:
#7.1 Retrieve all actors with the first name "SCARLETT".

SELECT first_name
FROM actor
Where first_name = 'SCARLETT';

# I don't like LIKE i like =. When is LIKE not the same as =?
#7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.

SELECT title
FROM film
WHERE title LIKE '%ARMAGEDDON%' AND length>100;

#7.3 Determine the number of films that include Behind the Scenes content

SELECT COUNT(title)
FROM film
WHERE special_features LIKE '%Behind the Scenes%';