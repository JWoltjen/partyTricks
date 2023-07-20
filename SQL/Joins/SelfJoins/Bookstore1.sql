/*

**Books:**

| BookID | Title                 | PreviousEditionID |
|--------|-----------------------|-------------------|
| 1      | Book A                | NULL              |
| 2      | Book B                | 1                 |
| 3      | Book C                | NULL              |
| 4      | Book D                | 2                 |
| 5      | Book E                | 4                 |
| 6      | Book F                | NULL              |
| 7      | Book G                | 6                 |

**Task**: Display the title of each book along with the title 
of its previous edition.


*/

SELECT b1.Title AS Title, b2.Title AS Previous_Edition 
FROM Books b1 
INNER JOIN Books b2 ON b1.BookID = b2.BookID 
ORDER BY b1.BookID