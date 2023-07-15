/*
Consider the following:

`Genres`:

| GenreID | GenreName |
|---------|-----------|
| 1       | Fiction   |
| 2       | Non-Fiction |
| 3       | Fantasy   |
| 4       | Sci-Fi    |

`Authors`:

| AuthorID | AuthorName |
|----------|------------|
| 1        | Author A   |
| 2        | Author B   |
| 3        | Author C   |

`Books`:

| BookID | BookName   | AuthorID | GenreID |
|--------|------------|----------|---------|
| 1      | Book 1     | 1        | 1       |
| 2      | Book 2     | 1        | 2       |
| 3      | Book 3     | 2        | 3       |
| 4      | Book 4     | 3        | 4       |

`Orders`:

| OrderID | CustomerID | OrderDate |
|---------|------------|-----------|
| 1001    | 1          | 2023-01-01|
| 1002    | 2          | 2023-01-02|
| 1003    | 3          | 2023-02-01|
| 1004    | 4          | 2023-02-02|
| 1005    | 5          | 2023-03-01|
| 1006    | 1          | 2023-03-02|
| 1007    | 2          | 2023-04-01|
| 1008    | 3          | 2023-05-01|
| 1009    | 4          | 2023-06-01|
| 1010    | 5          | 2023-06-02|

`OrderDetails`:

| OrderDetailID | OrderID | BookID | Quantity |
|---------------|---------|--------|----------|
| 1             | 1001    | 1      | 2        |
| 2             | 1002    | 2      | 1        |
| 3             | 1003    | 3      | 3        |
| 4             | 1004    | 4      | 1        |
| 5             | 1005    | 2      | 1        |
| 6             | 1006    | 1      | 2        |
| 7             | 1007    | 2      | 1        |
| 8             | 1008    | 3      | 1        |
| 9             | 1009    | 4      | 1        |
| 10            | 1010    | 1      | 2        |

`Publishers`:

| PublisherID | PublisherName |
|-------------|---------------|
| 1           | Publisher A   |
| 2           | Publisher B   |
| 3           | Publisher C   |

`BookPublishers`:

| BookID | PublisherID |
|--------|-------------|
| 1      | 1           |
| 2      | 2           |
| 3      | 3           |
| 4      | 1           |
| 2      | 3           |
| 1      | 2           |

Notice that a book can be published by more than one publisher.

Now, write an SQL query to fetch the publisher's name (PublisherName), 
the author's name (AuthorName), the genre name (GenreName), 
and the total quantity of books sold (TotalQuantity) 
for each publisher, author, and genre.

The total quantity for a publisher, an author, and a genre 
should be calculated as the sum of `Quantity` for all books of 
that genre written by that author and published by that publisher. 
The books need to be sold in the first half of the year 2023.

Order the result by total quantity in descending order.

*/

SELECT p.PublisherName, a.AuthorName, g.GenreName, SUM(od.Quantity) AS TotalSales
FROM Publishers p 
INNER JOIN BookPublishers bp ON bp.PublisherID = p.PublisherID 
INNER JOIN Books b ON b.BookID = bp.BookID
INNER JOIN OrderDetails od ON od.BookID = b.BookID
INNER JOIN Orders o ON O.OrderID = od.OrderID
INNER JOIN Authors a ON a.AuthorID = b.AuthorID
INNER JOIN Genres g ON g.GenreID = b.GenreID
WHERE YEAR(o.OrderDate) = 2023 AND MONTH(o.OrderDate) BETWEEN 1 AND 6
GROUP BY p.PublisherName, a.AuthorName, g.GenreName
ORDER BY TotalSales DESC