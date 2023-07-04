/*
Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
The CountryCode for America is USA. See Hackerrank for Table.
*/

Select NAME
From CITY
WHERE COUNTRYCODE = "USA" AND POPULATION > 120000