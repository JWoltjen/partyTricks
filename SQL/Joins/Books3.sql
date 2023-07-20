/*
Consider these tables:

`Authors`:

| AuthorID | AuthorName |
|----------|------------|
| 1        | Author A   |
| 2        | Author B   |

`Books`:

| BookID | BookName | AuthorID |
|--------|----------|----------|
| 1      | Book 1   | 1        |
| 2      | Book 2   | 1        |
| 3      | Book 3   | 2        |

`Orders`:

| OrderID | BookID | Quantity | OrderDate  |
|---------|--------|----------|------------|
| 1       | 1      | 5        | 2023-01-15 |
| 2       | 2      | 3        | 2023-02-20 |
| 3       | 1      | 2        | 2023-03-10 |
| 4       | 3      | 7        | 2023-03-15 |
| 5       | 2      | 1        | 2023-04-25 |

And the problem statement:

Write an SQL query to fetch the author name (AuthorName) 
and the total quantity of books sold (TotalQuantity) 
for the author who has sold the most number of books in the year 2023. 

Hint: This problem can be solved using a combination of aggregation 
(`SUM`, `GROUP BY`), subqueries and `JOIN`s. 
You need to aggregate the total quantity of books sold by each author, 
and then use a subquery to find the author who has the maximum total quantity.

This is a two-step problem, start by writing a query that 
gives you the total quantity of books sold by each author, 
then use this query as a subquery to find the author who has 
sold the maximum total quantity of books.
*/

SELECT TOP 1 sq1.AuthorName, TotalQuantity
FROM 
    (
    SELECT a.AuthorName, SUM(o.Quantity) as TotalQuantity
    FROM Authors a
    INNER JOIN Books b ON a.authorID = b.authorID
    INNER JOIN Orders o ON o.BookID = b.BookId; 
    WHERE YEAR(o.OrderDate)
    GROUP BY a.AuthorName,
    ) AS sq1 
ORDER BY TotalQuantity DESC











SELECT TOP 1 AuthorName, TotalQuantity
FROM (
    SELECT a.AuthorName, SUM(o.Quantity) AS TotalQuantity
    FROM Authors a 
    INNER JOIN Books b ON a.AuthorID = b.AuthorID
    INNER JOIN Orders o ON o.BookID = b.BookID
    WHERE YEAR(o.OrderDate) = 2023
    GROUP BY a.AuthorName,
) AS Subquery
ORDER BY TotalQuantity DESC