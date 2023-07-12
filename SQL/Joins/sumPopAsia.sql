/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

*/

SELECT SUM(City.POPULATION)
FROM CITY
JOIN COUNTRY ON COUNTRY.CODE = CITY.COUNTRYCODE
WHERE COUNTRY.CONTINENT = "ASIA"