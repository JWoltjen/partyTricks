/* 
Query the list of CITY names from STATION which have vowels 
(i.e., a, e, i, o, and u) as both their first and last characters. 
Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '[AEIOU]%[AEIOU]'


/*
Commentary

This updated query uses the LIKE operator with a character range ([AEIOU]) 
to match CITY names where the first character is any vowel and the last character is also any vowel. 
The % wildcard character is used in the middle to represent any number of characters between the first and last vowels.
*/