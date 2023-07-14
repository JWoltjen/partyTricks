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

Think of a CTE as a temporary table that we create within our query to store intermediate results. 
It allows us to break down complex problems into smaller, more manageable parts. 
In this case, we use a CTE to assign row numbers to names based on their occupation.

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

MAX is a function that helps us find the largest or maximum value in a set of values. 
In this solution, we use MAX to pick the non-null name for each occupation. 
Since there can be multiple names for each occupation, we want to select the one 
that comes last alphabetically.

PARTITION BY is used together with the OVER clause to divide our data into groups or partitions. 
It helps us perform calculations separately within each group. 
In this case, we partition the data by the Occupation column, which means we perform calculations 
separately for each occupation.

THEN Name END:
This is part of a conditional statement called a CASE expression. 
We use CASE to check a condition and return different values based on that condition. 
In this solution, we use CASE to check the occupation and assign the name to the 
corresponding column (Doctor, Professor, Singer, or Actor). 
The THEN Name END part indicates that if the condition is true, we return the Name value. 
If the condition is false, we don't return anything.

Executing this query on the given OCCUPATIONS table will 
provide the desired output with the names sorted alphabetically 
under their corresponding occupation headers.

What does pivoting mean?

To understand what it means to pivot columns, let's imagine you have a table of data 
where the values in one column need to be transformed into separate columns.

For example, let's say you have a table with the following data:

| Name    | Category |
|---------|----------|
| John    | A        |
| Emily   | B        |
| Michael | A        |
| Jessica | B        |
| Robert  | A        |
| Jennifer| B        |

Now, let's say you want to pivot the "Category" column so that each unique 
category becomes a separate column, and the corresponding values from the "Name" 
column are displayed under each category.

After pivoting, the table would look like this:

| A       | B        |
|---------|----------|
| John    | Emily    |
| Michael | Jessica  |
| Robert  | Jennifer |

In this transformed table, the original "Category" column has become separate columns (A and B), 
and the values from the "Name" column are displayed underneath each respective category.

Pivoting columns is a way to reshape data by converting values from a single column into 
multiple columns. It can be useful when you want to present data in a different format or 
perform calculations based on the new column arrangement.

To pivot the above columns, you could use a sql query like this:

SELECT
    MAX(CASE WHEN Category = 'A' THEN Name END) AS A,
    MAX(CASE WHEN Category = 'B' THEN Name END) AS B
FROM
    YourTable
GROUP BY
    1;


In the OCCUPATIONS problem you mentioned earlier, pivoting the "Occupation" column 
means transforming the data so that each unique occupation becomes a separate column, 
and the corresponding names are displayed under each occupation.

*/