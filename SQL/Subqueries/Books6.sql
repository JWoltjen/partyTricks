/*
We'll keep the same tables with different data:

`Books`:

| BookID | BookTitle             | AuthorID | PublisherID |
|--------|-----------------------|----------|-------------|
| 1      | The Idiot             | 1        | 1           |
| 2      | The Hobbit            | 2        | 1           |
| 3      | The Old Man and the Sea | 3      | 2           |
| 4      | Crime and Punishment  | 1        | 2           |
| 5      | War and Peace         | 4        | 1           |

`Authors`:

| AuthorID | AuthorName |
|----------|------------|
| 1        | Dostoyevsky|
| 2        | Tolkien    |
| 3        | Hemingway  |
| 4        | Tolstoy    |

`Publishers`:

| PublisherID | PublisherName |
|-------------|---------------|
| 1           | Penguin       |
| 2           | Vintage       |

`Orders`:

| OrderID | BookID | Quantity | OrderDate |
|---------|--------|----------|-----------|
| 1       | 1      | 10       | 2023-01-01|
| 2       | 2      | 5        | 2023-02-01|
| 3       | 3      | 8        | 2023-03-01|
| 4       | 4      | 6        | 2023-04-01|
| 5       | 1      | 3        | 2023-05-01|
| 6       | 4      | 7        | 2023-06-01|
| 7       | 5      | 9        | 2023-07-01|

Alright, now the problem: for the first half of 2023, 
we want to know the total quantity of books sold per publisher. 
However, we also want to know the percentage each publisher 
contributes to the total sales.

Your SQL query will need to involve two subqueries: 
one to calculate the total sales per publisher 
and another to calculate the total sales for all publishers. 
You'll then join these two subqueries on the PublisherName field.

*/

SELECT sq1.PublisherName, sq1.TotalSales, (sq1.TotalSales * 100.0 / sq2.TotalSales) AS SalesPercentage
FROM (
    Publishers p, SUM(o.Quantity) AS TotalSales
    INNER JOIN Books b ON p.PublisherID = b.PublisherID 
    INNER JOIN Orders o ON o.BookID = b.BookID 
    WHERE YEAR (o.OrderDate) = 2023 AND MONTH(o.OrderDate) BETWEEN 1 AND 6
    GROUP BY p.PublisherName 
) AS sq1 
CROSS JOIN
(
    SELECT SUM(o.Quantity) as TotalSales 
    FROM Orders o 
    WHERE YEAR (o.OrderDate) = 2023 AND MONTH(o.OrderDate) BETWEEN 1 AND 6
) AS sq2 
ORDER BY sq1.TotalSales DESC

/*
| PublisherName | TotalSales | SalesPercentage |
|---------------|------------|-----------------|
| Penguin       | 27         | 56.25           |
| Vintage       | 21         | 43.75           |

COMMENTARY

In this query, sq1 calculates the total sales per publisher, 
while sq2 calculates the total sales of all books. 
We use a CROSS JOIN to combine the result from sq1 with the result from sq2 
for every publisher.



*/