/*

Let's assume that each book can have multiple authors, 
so we will need a junction table to manage the many-to-many 
relationship between books and authors. The tables might look like this:

**Books:**

| BookID | Title             | Previous_EditionID |
|--------|-------------------|------------------- |
| 1      | The First Book    | NULL               |
| 2      | Second Edition    | 1                  |
| 3      | Third Edition     | 2                  |
| 4      | Another Book      | NULL               |
| 5      | Yet Another Book  | 4                  |

**Authors:**

| AuthorID | AuthorName |
|----------|------------|
| 1        | John Smith |
| 2        | Jane Doe   |

**Book_Authors:**

| BookID | AuthorID |
|--------|----------|
| 1      | 1        |
| 2      | 1        |
| 3      | 1        |
| 4      | 2        |
| 5      | 2        |

Now the problem: For each book, find its title, 
the title of its previous edition (if any), 
and the names of all authors. 
Also, only include books that have had at least one previous edition.

You will need to use two self-joins in this case: 
one to link each book to its previous edition 
and the other to link each book to its author(s). 


Here `GROUP_CONCAT(a.AuthorName)` is used to concatenate all authors' names 
into a single string. This function is available in MySQL; 
if you're using a different database system, you may need to use a 
different function or method to achieve the same result.


*/

SELECT b1.Title AS New_Title, b2.Title AS Old_Title, GROUP_CONCAT(a.AuthorName) AS Authors
FROM Books b1 
    LEFT JOIN Books b2 ON b1.Previous_EditionID = b2.BookID
    INNER JOIN Book_Authors ba ON b1.BookID = ba.AuthorID 
    INNER JOIN Authors a ON a.AuthorID = ba.AuthorID 
WHERE b1.Previous_EditionID IS NOT NULL 
GROUP BY b1.Title, b2.Title
ORDER BY b1.Title ASC