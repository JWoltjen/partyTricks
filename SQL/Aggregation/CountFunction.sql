/*
Query a count of the number of cities in CITY having a Population larger than 100,000.

*/

SELECT COUNT(*) AS NumCities
FROM CITY
WHERE CITY.POPULATION > 100000;