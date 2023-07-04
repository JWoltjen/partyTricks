/*Query the Name of any student in STUDENTS who scored higher than 75 Marks. 
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters 
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.*/

/*the STUDENTS table is described as follows:  
The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.*/

SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID ASC;

/*
Commentary
ORDER BY RIGHT(Name, 3): RIGHT is a function in SQL that returns the 
specified number of characters from the right end of a string. 
In this case, RIGHT(Name, 3) is used to get the last three characters of the Name field.

(Name, 3): Here, Name is the column from which we want to extract characters,
and 3 is the number of characters we want to extract from the right end of the string.

, ID ASC: This part of the ORDER BY clause is used to order the results by the 
ID column in ascending order (ASC). The comma here means that ID is used as a secondary sorting criterion. 

First, the query sorts results by the last three characters of the Name field. 
Then, for rows where the last three characters of Name are the same, it sorts those rows in ascending order by ID. 
This is known as a multi-column sort. 
It's used when you want to order by more than one column and designate 
which column is the primary key to sort by, which is the secondary, and so forth.
*/