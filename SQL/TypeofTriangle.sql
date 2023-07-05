/*
Write a query identifying the type of each record in the TRIANGLES table using its 
three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.

*/

SELECT
    CASE
        WHEN A + B <= C OR B + C <= A OR A + C <= B THEN 'Not A Triangle'
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR B = C OR A = C THEN 'Isosceles'
        ELSE 'Scalene'
    END AS TriangleType
FROM
    TRIANGLES;

/*
COMMENTARY
In this query, we use a CASE statement to determine the type of each triangle based on 
its side lengths. We first check if the given side lengths satisfy the triangle inequality 
theorem, which states that the sum of the lengths of any two sides of a triangle must be 
greater than the length of the third side. If this condition is not met, we classify the 
triangle as "Not A Triangle."

The CASE statement in SQL is a conditional expression that allows you to perform conditional 
logic and control the flow of the query based on specified conditions. 
The basic syntax of the CASE statement is as follows:

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE resultN
END

The END AS keyword in SQL is used to provide an alias or a name for the result of an 
expression or a column in the query result. It allows you to assign a custom name to a column,
making the output more descriptive or readable.
*/