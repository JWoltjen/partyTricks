/*
Pivot the Occupation column in OCCUPATIONS so that each Name 
is sorted alphabetically and displayed underneath its corresponding 
Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, 
respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

Input Format

The OCCUPATIONS table is described as follows:
*/


WITH CTE AS (
    SELECT ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS RowNum,
           Occupation,
           Name
    FROM OCCUPATIONS
)
SELECT MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
       MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
       MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
       MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM CTE
GROUP BY RowNum;


/*
COMMENTARY
1. The CTE (Common Table Expression) assigns a row number (RowNum) 
to each name within each occupation, ordered alphabetically by name.

2. In the final query, we use conditional aggregation to pivot the 
Name column based on the Occupation values. 
Each CASE statement checks the occupation and assigns the name to 
the corresponding column (Doctor, Professor, Singer, or Actor).

3. By grouping the results by RowNum, we ensure that each row 
contains the names corresponding to the same row number for 
each occupation.

4. The MAX() function is used to pick a non-null name for each 
occupation. If there are no more names corresponding to an 
occupation, the NULL value is automatically displayed.

Executing this query on the given OCCUPATIONS table will 
provide the desired output with the names sorted alphabetically 
under their corresponding occupation headers.
*/