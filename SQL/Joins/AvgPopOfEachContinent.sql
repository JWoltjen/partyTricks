/*
Given the CITY and COUNTRY tables, query the names of all the continents
(COUNTRY.Continent) and their respective average city populations 
(CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/




























SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population))
FROM CITY
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;



/*
COMMENTARY
SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population)): 
This line is telling SQL that we want to select the 'Continent' column 
from the 'COUNTRY' table and the average 'Population' from the 'CITY' table, 
rounded down to the nearest integer.


FROM CITY: This line specifies that the 'CITY' table is the one we're selecting from.

JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code: 
This line is joining the 'CITY' and 'COUNTRY' tables where 
the 'CountryCode' in the 'CITY' table matches the 'Code' in the 'COUNTRY' table.

GROUP BY COUNTRY.Continent: 
This line is grouping the results by the 'Continent' column of the 'COUNTRY' table. 
This is necessary because we're using an aggregate function (AVG) on a column that is
not included in the SELECT clause.
*/