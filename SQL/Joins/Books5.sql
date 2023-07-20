/*
Consider the following tables:

`Books`:

| BookID | BookTitle | AuthorID | PublisherID |
|--------|-----------|----------|-------------|
| 1      | Book A    | 1        | 1           |
| 2      | Book B    | 2        | 1           |
| 3      | Book C    | 3        | 2           |
| 4      | Book D    | 1        | 2           |

`Authors`:

| AuthorID | AuthorName |
|----------|------------|
| 1        | Author A   |
| 2        | Author B   |
| 3        | Author C   |

`Publishers`:

| PublisherID | PublisherName |
|-------------|---------------|
| 1           | Publisher A   |
| 2           | Publisher B   |

`Orders`:

| OrderID | BookID | Quantity | OrderDate |
|---------|--------|----------|-----------|
| 1       | 1      | 10       | 2023-01-01|
| 2       | 2      | 5        | 2023-02-01|
| 3       | 3      | 8        | 2023-03-01|
| 4       | 4      | 6        | 2023-04-01|
| 5       | 1      | 3        | 2023-05-01|
| 6       | 4      | 7        | 2023-06-01|

Write an SQL query to find out which author's books have sold the most copies
in the first half of 2023, and also return the total number of books sold 
by that author during this period. 
The result should only include the top-selling author. 

The information needed in the result is the author's name (AuthorName) 
and the total number of books sold (TotalSold).
Ride that subquery wave! 🤘
*/
SELECT TOP 1 Subquery.AuthorName, Subquery.TotalSold
FROM (
    SELECT A.authorName, SUM(o.Quantity)
    FROM Author a 
    INNER JOIN Books b ON a.AuthorID = b.AuthorID
    INNER JOIN Orders o ON o.BookID = b.BookID 
    WHERE YEAR (o.OrderDate) = 2023 AND MONTH(o.OrderDate) BETWEEN 1 AND 6
    GROUP BY a.AuthorName
    ) AS Subquery
ORDER BY TotalSold DESC