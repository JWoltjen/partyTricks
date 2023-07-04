/*Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '[AEIOU]%' OR CITY NOT LIKE '%[AEIOU]'


/*
Commentary
In this modified query, the LIKE operator is used with the [AEIOU]% pattern
 to match CITY names that start with any vowel (A, E, I, O, U), and the '%[AEIOU]' pattern 
to match CITY names that end with any vowel. By using the OR operator, 
the query retrieves CITY names that either do not start with vowels or do not end with vowels.
*/