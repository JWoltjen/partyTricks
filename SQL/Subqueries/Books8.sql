/*
Check out these tables:

`Authors`:

| AuthorID | AuthorName |
|----------|------------|
| 1        | Author A   |
| 2        | Author B   |
| 3        | Author C   |

`Books`:

| BookID | BookTitle | AuthorID | CategoryID |
|--------|-----------|----------|------------|
| 1      | Book 1    | 1        | 1          |
| 2      | Book 2    | 1        | 2          |
| 3      | Book 3    | 2        | 1          |
| 4      | Book 4    | 3        | 3          |

`Categories`:

| CategoryID | CategoryName |
|------------|--------------|
| 1          | Category A   |
| 2          | Category B   |
| 3          | Category C   |

`Orders`:

| OrderID | BookID | OrderDate  | Quantity |
|---------|--------|------------|----------|
| 1       | 1      | 2023-01-01 | 10       |
| 2       | 2      | 2023-02-01 | 5        |
| 3       | 2      | 2023-03-01 | 20       |
| 4       | 3      | 2023-04-01 | 15       |
| 5       | 4      | 2023-05-01 | 25       |
| 6       | 1      | 2023-06-01 | 10       |


Write an SQL query to find the author who has sold the most books in each category
in the first half of 2023. The output should include the author's name (AuthorName),
the category (CategoryName), and the total quantity of books sold (TotalQuantity) 
by that author in that category.

*/

SELECT a.AuthorName, c.CategoryName, sq1.TotalQuantity
FROM (
    SELECT b.AuthorID, b.CategoryID, SUM(o.Quantity) as TotalQuantity
    FROM Orders o 
    INNER JOIN Books b ON o.BookID = b.BookID
    WHERE YEAR(o.OrderDate) = 2023 AND MONTH(o.OrderDate) BETWEEN 1 AND 6
    GROUP BY b.AuthorID, b.CategoryID
) AS sq1
INNER JOIN (
    SELECT CategoryID, MAX(TotalQuantity) as MaxQuantity
    FROM (
        SELECT b.AuthorID, b.CategoryID, SUM(o.Quantity) as TotalQuantity
        FROM Orders o 
        INNER JOIN Books b ON o.BookID = b.BookID
        WHERE YEAR(o.OrderDate) = 2023 AND MONTH(o.OrderDate) BETWEEN 1 AND 6
        GROUP BY b.AuthorID, b.CategoryID
    ) AS sq2
    GROUP BY CategoryID
) AS sq3 ON sq1.CategoryID = sq3.CategoryID AND sq1.TotalQuantity = sq3.MaxQuantity
INNER JOIN Authors a ON a.AuthorID = sq1.AuthorID
INNER JOIN Categories c ON c.CategoryID = sq1.CategoryID
ORDER BY c.CategoryName



/*
COMMENTARY

First, we calculate the total quantity sold per author per category. 
We want to group by both AuthorID and CategoryID so we get separate totals 
for each combination.

Next, we have to figure out the max total for each category. 
This is a second subquery where we group the results of the 
first subquery by CategoryID and find the max TotalQuantity.

Finally, we join these two subqueries on both the CategoryID 
and the TotalQuantity. This gives us the rows where an author's 
total quantity sold matches the max for their category.
*/