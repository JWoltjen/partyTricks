/*

**Books:**

| BookID | Title                 | PreviousEditionID | AuthorID |
|--------|-----------------------|-------------------|----------|
| 1      | Book A                | NULL              | 1        |
| 2      | Book B                | 1                 | 1        |
| 3      | Book C                | NULL              | 2        |
| 4      | Book D                | 2                 | 2        |
| 5      | Book E                | 4                 | 3        |
| 6      | Book F                | NULL              | 3        |
| 7      | Book G                | 6                 | 3        |

**Authors:**

| AuthorID | AuthorName |
|----------|------------|
| 1        | Author A   |
| 2        | Author B   |
| 3        | Author C   |

**Task:** Display the title of each book, 
the title of its previous edition, 
and the name of the author. 
For books without a previous edition, show NULL.

*/

SELECT b1.Title AS New_Title, b2.title AS Old_Title, a.AuthorID 
FROM Books b1 
    INNER JOIN Books b2 ON b1.bookID = b2.Previous_EditionID
INNER JOIN Authors a ON a.AuthorID = b1.AuthorID 
ORDER BY a.AuthorName DESC
