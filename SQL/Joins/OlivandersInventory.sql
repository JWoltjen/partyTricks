/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed 
to buy each non-evil wand of high power and age. 

Write a query to print the id, age, coins_needed, 
and power of the wands that Ron's interested in, 
sorted in order of descending power. 
If more than one wand has same power, sort the result in order of descending age.

INPUT FORMAT

Wands: The id is the id of the wand, 
code is the code of the wand, 
coins_needed is the total number of gold galleons needed to buy the wand, 
and power denotes the quality of the wand (the higher the power, the better the wand is).

Wands_Property: The code is the code of the wand, 
age is the age of the wand, 
and is_evil denotes whether the wand is good for the dark arts. 
If the value of is_evil is 0, it means that the wand is not evil. 

The mapping between code and age is one-one, 
meaning that if there are two pairs, (code1, age1) and (code2, age2), 
then code1 != code2 and age1 != age2.
*/

SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands w
JOIN Wands_Property wp ON w.code = wp.code
WHERE wp.is_evil = 0 
AND w.coins_needed = (
    SELECT MIN(coins_needed) 
    FROM Wands w1
    JOIN Wands_Property wp1 ON w1.code = wp1.code
    WHERE wp1.is_evil = 0 AND wp1.age = wp.age AND w1.power = w.power
)
ORDER BY w.power DESC, wp.age DESC;

/*
Commentary
1. The query starts with a JOIN between the Wands and Wands_Property tables on their common code field.
2. The WHERE clause filters the joined tables to include only the rows where is_evil is 0 (non-evil wands).
3. Then, the query further filters to include only the wands with the minimum coins_needed for each combination of age and power. 
    This is done using a subquery in the WHERE clause 
    that calculates the minimum coins_needed for each age and power combination among the non-evil wands.
4. Finally, the ORDER BY clause sorts the results first by power in descending order, and then by age in descending order.

The AND keyword in SQL is a logical operator that combines two or more conditions, 
and returns a result if all the conditions are true. So, in the statement WHERE wp.is_evil = 0 AND 
w.coins_needed = (subquery), it's saying "select the rows where is_evil is 0 AND coins_needed is equal to the result of the subquery".

MIN() is a SQL function that returns the smallest value of the selected column. 
So, MIN(coins_needed) returns the smallest value of the coins_needed column from the selected rows.

w1 and wp1 are table aliases - just like w and wp, they are short names to refer to the tables in the query. 
The numbers (1 in w1 and wp1) are used to differentiate these aliases from the w and wp used in the outer query. 
Inside the subquery, w1 refers to Wands and wp1 refers to Wands_Property.

The subquery is essentially a separate SELECT query enclosed in parentheses and used within another SQL statement. 
The subquery here is finding the minimum coins_needed for each combination of age and power among the non-evil wands. 
This result is then used in the outer query's WHERE clause to filter the wands.

In simpler terms, the subquery is saying "For each combination of age and power, find the minimum coins_needed among the wands that are not evil". 
This value is then used to filter the wands in the outer query.
*/