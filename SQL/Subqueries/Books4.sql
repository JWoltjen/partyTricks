/*

Consider these tables:

`Categories`:

| CategoryID | CategoryName |
|------------|--------------|
| 1          | Fiction      |
| 2          | Non-Fiction  |

`Books`:

| BookID | BookName | CategoryID |
|--------|----------|------------|
| 1      | Book 1   | 1          |
| 2      | Book 2   | 2          |
| 3      | Book 3   | 1          |

`Orders`:

| OrderID | BookID | Quantity | OrderDate  |
|---------|--------|----------|------------|
| 1       | 1      | 5        | 2023-01-15 |
| 2       | 2      | 3        | 2023-02-20 |
| 3       | 1      | 2        | 2023-03-10 |
| 4       | 3      | 7        | 2023-03-15 |
| 5       | 2      | 1        | 2023-04-25 |

Problem statement:

Write an SQL query to fetch the category name (CategoryName) 
and the total quantity of books sold (TotalQuantity) for the 
category that has sold the most number of books in the first quarter of 2023 
(January, February, and March).
*/

SELECT TOP 1 Subquery.CategoryName, Subquery.TotalQuantity
FROM (
    SELECT c.CategoryName, SUM(o.Quantity) as TotalQuantity
    FROM Categories c 
    INNER JOIN Books b ON c.CategoryID = b.CategoryID 
    INNER JOIN Orders o ON b.BookID = o.BookID 
    WHERE YEAR(o.OrderDate) = 2023 AND MONTH(o.OrderDate) BETWEEN 1 AND 3
    GROUP BY c.CategoryName
) AS Subquery
ORDER BY Subquery.TotalQuantity DESC