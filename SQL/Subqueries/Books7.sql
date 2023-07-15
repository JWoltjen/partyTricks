/*

Imagine you want to find out the top-selling authors, 
but you also want to know the total sales of all authors for comparison. 
To do this, you'll need two subqueries: 
    one to calculate the total sales for each author, 
    and another to calculate the total sales for all authors.

Here are the tables:

**Authors**
| AuthorID | AuthorName |
|----------|------------|
| 1        | Author A   |
| 2        | Author B   |
| 3        | Author C   |

**Books**
| BookID | Title     | AuthorID |
|--------|-----------|----------|
| 1      | Book 1    | 1        |
| 2      | Book 2    | 1        |
| 3      | Book 3    | 2        |
| 4      | Book 4    | 3        |

**Orders**
| OrderID | BookID | Quantity |
|---------|--------|----------|
| 1       | 1      | 100      |
| 2       | 2      | 150      |
| 3       | 3      | 200      |
| 4       | 4      | 250      |

Now try writing a SQL query using two subqueries: 
    one to find the total sales for each author, 
    and another to find the total sales for all authors. 

    Remember, you want to show each author's name, their total sales, 
    and the total sales for all authors in your result. 
*/

SELECT sq1.AuthorName, sq1.TotalSales
FROM (
    SELECT a.AuthorName, SUM(o.Quantity) AS TotalSales
    FROM Author a 
    INNER JOIN Books b ON a.AuthorID = b.AuthorID
    INNER JOIN Orders o ON o.BookID = b.BookID
    GROUP BY a.AuthorName
    ) AS sq1
CROSS JOIN (
    SELECT SUM(o.Quantity) AS TotalSales
    FROM Orders o 
) AS sq2 
ORDER BY sq1.TotalSales DESC;


/*
COMMENTARY
The CROSS JOIN here produces a result that combines each row from 
the first subquery (sq1) with each row from the second subquery (sq2). 
Since the second subquery only has one row (the total sales for all authors), 
this effectively adds the same value to each row from the first subquery.

Here's what the table from that query would look like given your new data:

| AuthorName | TotalSales | TotalSalesAllAuthors |
|------------|------------|----------------------|
| Author A   | 26         | 39                   |
| Author B   | 5          | 39                   |
| Author C   | 8          | 39                   |

Author A has the highest individual sales at 26 books, 
but the total sales across all authors is 39 books. 
Now you can clearly see how each author's sales compare to 
the total sales. 

*/