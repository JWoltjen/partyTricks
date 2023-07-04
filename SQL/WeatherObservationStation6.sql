/*
Query the list of CITY names starting with vowels 
(i.e., a, e, i, o, or u) from STATION.
Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%';


/*
COMMENTARY
LIKE: The LIKE keyword in SQL is used in a WHERE clause 
to search for a specified pattern in a column. 
It's often used with % (the wildcard character) 
to represent zero, one, or multiple characters.

Wildcard Operators: In SQL, wildcard characters are used with the SQL LIKE operator. 
The most commonly used wildcard is %. When % is used in a pattern, 
it can match any number of characters, including zero characters.

For example, in your query, CITY LIKE 'A%' will match any city name that starts with 'A'.
The % after 'A' acts as a wildcard that matches zero or more characters, 
so it doesn't matter what comes after 'A' in the city name—it's a match as long as the name starts with 'A'.
*/