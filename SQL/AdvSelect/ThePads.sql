/*
Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, 
immediately followed by the first letter of each profession as a parenthetical 
(i.e.: enclosed in parentheses). 

For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. 
Sort the occurrences in ascending order, and output them in the following format:

    There are a total of [occupation_count] [occupation]s.
    where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS 
    and [occupation] is the lowercase occupation name. 
    If more than one Occupation has the same [occupation_count], 
    they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.
*/

SELECT CONCAT(NAME, '(', LEFT(OCCUPATION, 1), ')')
FROM OCCUPATIONS
ORDER BY NAME;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(OCCUPATION), 's.')
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(*), OCCUPATION;


/*
Output:

Aamina(D)
Ashley(P)
Belvet(P)
Britney(P)
Christeen(S)
Eve(A)
Jane(S)
Jennifer(A)
Jenny(S)
Julia(D)
Ketty(A)
Kristeen(S)
Maria(P)
Meera(P)
Naomi(P)
Priya(D)
Priyanka(P)
Samantha(A)
There are a total of 3 doctors.
There are a total of 4 actors.
There are a total of 4 singers.

COMMENTARY

Solution 1 uses the CONCAT() function to combine the NAME column, an opening parenthesis, 
and the first letter of the OCCUPATION column. 
It orders the result alphabetically by NAME to meet the problem's requirements.

Solution 2 counts the number of occurrences of each occupation using COUNT(*). 
It then concatenates a formatted string to display the count, occupation in lowercase, 
and pluralize the occupation name. 
The result is grouped by OCCUPATION and ordered by the count and occupation alphabetically.

*/