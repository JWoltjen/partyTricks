/*

Consider the same tables

`Books`:

| BookID | BookTitle             | AuthorID | PublisherID |
|--------|-----------------------|----------|-------------|
| 1      | The Idiot             | 1        | 1           |
| 2      | The Hobbit            | 2        | 1           |
| 3      | The Old Man and the Sea | 3      | 2           |
| 4      | Crime and Punishment  | 1        | 2           |
| 5      | War and Peace         | 4        | 1           |

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

The problem: For the year 2023, we want to calculate the average 
quantity of books sold per order for each publisher, 
and compare this average to the total average for all orders. 
*/

SELECT sq1.PublisherName, sq1.AvgForEachPublisher, sq2.TotalAverage
FROM 
(
SELECT p.PublisherName, AVG(o.Quantity) as AvgForEachPublisher
FROM Publishers p 
INNER JOIN Books b ON p.PublisherID = b.PublisherID 
INNER JOIN Orders o ON b.BookID = o.BookID
WHERE YEAR(o.OrderDate) = 2023
GROUP BY p.PublisherName
) as sq1
CROSS JOIN 
(
    SELECT AVG(o.Quantity) as TotalAverage
    FROM Orders 
    WHERE YEAR(o.OrderDate) = 2023
) as sq2
ORDER BY sq1.AvgForEachPublisher DESC