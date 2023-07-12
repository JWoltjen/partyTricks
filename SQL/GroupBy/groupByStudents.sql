/*
This is a custom problem that I came up with myself.
Given the STUDENTS table, write a query to find the average age of students 
for each gender (GENDER column). 
Return the gender and the average age, rounded to two decimal places.

STUDENTS Table:
| STUDENT_ID | NAME     | GENDER | AGE |
|------------|----------|--------|-----|
| 1          | John     | Male   | 21  |
| 2          | Emily    | Female | 19  |
| 3          | Michael  | Male   | 22  |
| 4          | Jessica  | Female | 20  |
| 5          | Robert   | Male   | 21  |
| 6          | Jennifer | Female | 22  |


*/
SELECT GENDER, AVG(Age) AS AverageAge
FROM STUDENTS
Group By STUDENTS.GENDER



/*
COMMENTARY


*/