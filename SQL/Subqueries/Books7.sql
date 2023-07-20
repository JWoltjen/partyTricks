/*
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

For the year 2023, we want to calculate the maximum quantity of books 
sold per order for each publisher. 

However, we also want to know the maximum quantity sold 
in any single order across all publishers.
*/

SELECT sq1.PublisherName, sq1.MaxPerPublisher, sq2.OverallMax
FROM
    (
    SELECT p.PublisherName, MAX(o.Quantity) as MaxPerPublisher
    FROM Publishers p
    INNER JOIN Books b ON p.PublisherID = b.PublisherID
    INNER JOIN Orders o ON o.BookID = b.BookID
    WHERE YEAR (o.OrderDate) = 2023
    GROUP BY p.PublisherName 
    ) AS sq1 
CROSS JOIN 
    (
    SELECT MAX(o.Quantity) AS OverallMax
    FROM Orders 
    WHERE YEAR (o.OrderDate) = 2023
    ) as sq2 
ORDER BY MaxPerPublisher DESC

/*
OUTPUT
| PublisherName | MaxPerPublisher | OverallMax |
|---------------|-----------------|------------|
| Penguin       | 10              | 10         |
| Vintage       | 8               | 10         |



