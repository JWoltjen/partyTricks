/*

I see, let's try a problem that combines aggregation and two subqueries, which is a bit more challenging than the last one but still not as complex as the others.

Here are the tables we'll use:

`Customers`:

| CustomerID | CustomerName |
|------------|--------------|
| 1          | John Doe     |
| 2          | Jane Smith   |
| 3          | Alice Johnson|

`Orders`:

| OrderID | CustomerID | OrderDate  |
|---------|------------|------------|
| 1       | 1          | 2023-01-01 |
| 2       | 2          | 2023-02-01 |
| 3       | 3          | 2023-03-01 |
| 4       | 1          | 2023-04-01 |
| 5       | 2          | 2023-05-01 |

`OrderDetails`:

| OrderDetailID | OrderID | ProductID | Quantity |
|---------------|---------|-----------|----------|
| 1             | 1       | 1         | 5        |
| 2             | 1       | 2         | 2        |
| 3             | 2       | 3         | 3        |
| 4             | 3       | 2         | 4        |
| 5             | 4       | 1         | 1        |

`Products`:

| ProductID | ProductName | Price |
|-----------|-------------|-------|
| 1         | Product A   | 10    |
| 2         | Product B   | 20    |
| 3         | Product C   | 30    |

Problem:
For the year 2023, generate a report that includes:

The name of each product.
The total quantity sold of each product.
The total number of customers who bought each product.
The average quantity per order of each product.
*/

SELECT sq1.ProductName, sq1.TotalQuantity, sq1.AvgQuantity, sq2.CustomerName
FROM (
    SELECT DISTINCT p.ProductName, SUM(od.Quantity) AS TotalQuantity, AVG(od.Quantity) as AvgQuantity
    FROM Products p 
    INNER JOIN OrderDetails od ON p.ProductID = od.ProductID 
    INNER JOIN Orders o ON od.OrderID = o.OrderID 
    INNER JOIN Customers c ON c.CustomerID = o.CustomerID
    WHERE YEAR(o.OrderDate) = 2023
    GROUP BY p.ProductName 
    ORDER BY TotalQuantity, AvgQuantity
) AS sq1 
INNER JOIN 
(
    SELECT p.ProductName, COUNT(DISTINCT c.CustomerName) AS TotalCustomers
    FROM Products p 
    INNER JOIN Order Details od ON p.ProductID = od.ProductID 
    INNER JOIN Orders o ON od.OrderID = o.OrderID 
    INNER JOIN Customers c ON c.CustomerID = o.CustomerID
    WHERE YEAR(o.OrderDate) = 2023
    GROUP BY p.ProductName
) AS sq2 
ON sq1.ProductName = sq2.ProductName 
ORDER BY sq1.TotalQuantity DESC