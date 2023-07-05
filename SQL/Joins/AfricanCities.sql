/*Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.*/

SELECT CITY.NAME
FROM CITY
JOIN COUNTRY on CITY.CountryCode = COUNTRY.Code
WHERE CONTINENT = 'Africa'

/*
COMMENTARY

The first time I tried this I tried SELECT NAME
but I didn't read the tables closely enough to notice that NAME is a 
Field for the country table as well, so I got an ambiguity error.
*/