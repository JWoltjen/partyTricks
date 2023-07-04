/*
Query the two cities in STATION with the shortest and longest CITY names,
as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city,
choose the one that comes first when ordered alphabetically.

For example, CITY has four entries: DEF, ABC, PQRS and WXY.

When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS,
and WXY, with lengths 3,3,4 and 3. The longest name is PQRS, but there are 
3 options for shortest named city. 
Choose ABC, because it comes first alphabetically.

NOTE WE ARE USING MS SQL SERVER SYNTAX SO LENGHT = LEN
*/

-- Select the city with the shortest name
SELECT TOP 1 CITY, LEN(CITY) AS Length
FROM STATION
ORDER BY LEN(CITY), CITY;

-- Select the city with the longest name
SELECT TOP 1 CITY, LEN(CITY) AS Length
FROM STATION
ORDER BY LEN(CITY) DESC, CITY;


/*
COMMENTARY

The AS keyword is used to rename a column or table with an alias, 
which makes it easier to read or process. When we write LEN(CITY) AS Length, 
we are renaming the column that results from LEN(CITY) to Length. 
And yes, you are correct, it could be named anything you like. 
Length was chosen here for readability, to clearly indicate what the 
numbers in that column represent.

The ORDER BY clause doesn't determine the order of columns in the output, but the order of rows. 
When we say ORDER BY LEN(CITY), CITY, we're asking SQL to order the results first by the length 
of the city name (in ascending order, which is the default), and then for those cities with the 
same length, order them by the city name alphabetically. This doesn't affect the order of columns; 
the order of columns is determined by the order they're listed in the SELECT clause.

The DESC keyword stands for 'descending' and is used with ORDER BY to sort the results in descending order.
If not specified, the sort order is ascending (i.e., from the lowest value to the highest value). 
In the context of your query, ORDER BY LEN(CITY) DESC, CITY means "order the results by the length of 
the city name in descending order, and then for cities with the same length, order them by the city 
name alphabetically".
*/