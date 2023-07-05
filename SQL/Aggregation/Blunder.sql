/*
Samantha was tasked with calculating the average monthly salaries for all employees 
in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until 
after completing the calculation. 
She wants your help finding the difference between her miscalculation 
(using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: actual--miscalculated average monthly salaries), 
and round it up to the next integer.

input format: employees table has columns, "ID", "NAME", "SALARY"
*/

SELECT CEILING(AVG(Try_Convert(DECIMAL(10,2), Salary)) - AVG(Try_Convert(DECIMAL(10,2), REPLACE(Salary, '0', '')))) AS Difference
FROM EMPLOYEES;

/*
COMMENTARY

In this updated query, we use the TRY_CONVERT() function to attempt to convert the "Salary" values
 to the DECIMAL(10,2) data type, which allows for numeric calculations. 
 The REPLACE() function is also used to remove the zeros from the "Salary" values.
*/