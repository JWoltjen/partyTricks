/*
Sure, let's redefine the tables using real authors and book names and a problem:

```sql
`Authors`:

| AuthorID | AuthorName    |
|----------|---------------|
| 1        | Leo Tolstoy   |
| 2        | Fyodor Dostoevsky |
| 3        | Tom Clancy    |
| 4        | Ernest Hemingway |

`Books`:

| BookID | BookName                     | AuthorID |
|--------|------------------------------|----------|
| 1      | War and Peace                | 1        |
| 2      | Anna Karenina                | 1        |
| 3      | Crime and Punishment         | 2        |
| 4      | The Idiot                    | 2        |
| 5      | The Hunt for Red October     | 3        |
| 6      | Rainbow Six                  | 3        |
| 7      | The Old Man and the Sea      | 4        |
| 8      | A Farewell to Arms           | 4        |

`Orders`:

| OrderID | BookID | Quantity | OrderDate  |
|---------|--------|----------|------------|
| 1       | 1      | 10       | 2023-01-15 |
| 2       | 2      | 7        | 2023-02-20 |
| 3       | 3      | 15       | 2023-03-10 |
| 4       | 4      | 9        | 2023-03-15 |
| 5       | 5      | 12       | 2023-04-25 |
| 6       | 6      | 14       | 2023-05-01 |
| 7       | 7      | 11       | 2023-06-03 |
| 8       | 8      | 8        | 2023-07-12 |
```

Problem Statement:

In the year 2023, a global book reading competition was organized. 
The contest, based on the quantity of books sold, featured works from Leo Tolstoy, 
Fyodor Dostoevsky, Tom Clancy, and Ernest Hemingway. 
The competition organizers are interested in knowing which author's books 
were the most popular among readers during the contest.

Write an SQL query to fetch the author's name (AuthorName) and 
the total quantity of books sold (TotalQuantity) for the author whose 
books were sold the most in the year 2023.

Hint: This problem can be solved using a combination of
aggregation (`SUM`, `GROUP BY`), 
subqueries, and `JOIN`s. 
You need to aggregate the total quantity of books sold by each author, 
and then use a subquery to find the author who has the maximum total quantity. 
This is a two-step problem; start by writing a query that gives you 
the total quantity of books sold by each author, 
then use this query as a subquery to find the author who has sold 
the maximum total quantity of books.
*/

SELECT TOP 1 sq1.AuthorName, sq1.TotalQuantity
FROM (
    a.AuthorName, SUM(o.Quantity) AS TotalQuantity
    FROM Authors a 
    INNER JOIN Books b ON a.AuthorID = b.AuthorId 
    INNER JOIN Orderr o ON o.BookId = b.BookID
    WHERE YEAR(o.OderDate) = 2023
    GROUP BY a.AuthorName
) AS sq1 
ORDER BY sq1.TotalQuantity DESC