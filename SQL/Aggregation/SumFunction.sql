

/*Query the total population of all cities in CITY where District is California.*/

SELECT SUM(POPULATION) AS TOTALPOPULATION
FROM CITY
WHERE CITY.DISTRICT = "CALIFORNIA";

