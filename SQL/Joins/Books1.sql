/*
Take a look at the following scenario:

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

`OrderDetails`:

| OrderDetailID | OrderID | BookID | Quantity |
|---------------|---------|--------|----------|
| 1             | 1001    | 1      | 2        |
| 2             | 1002    | 2      | 1        |
| 3             | 1003    | 3      | 3        |
| 4             | 1004    | 4      | 1        |
| 5             | 1005    | 2      | 1        |
| 6             | 1006    | 1      | 2        |


Write an SQL query to fetch the author's name (AuthorName), 
the genre name (GenreName), and the total quantity of books sold (TotalQuantity) 
for each author and genre. 

The total quantity for an author and genre should be calculated as the sum of `Quantity` 
for all books of that genre written by that author. The books need to be sold in the first 
quarter of the year 2023.

Order the result by total quantity in descending order.

*/