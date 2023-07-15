/*Consider these tables:

`Customers`:

| CustomerID | CustomerName | Country |
|------------|--------------|---------|
| 1          | Acme Corp.   | USA     |
| 2          | Globex Corp. | UK      |
| 3          | Initech Corp.| Canada  |
| 4          | Vandelay Ind.| USA     |

`Employees`:

| EmployeeID | EmployeeName | ManagerID |
|------------|--------------|-----------|
| 101        | Alice        | 201       |
| 102        | Bob          | 202       |
| 103        | Charlie      | 201       |

`Managers`:

| ManagerID | ManagerName |
|-----------|-------------|
| 201       | Rachel      |
| 202       | Ross        |

`Orders`:

| OrderID | CustomerID | EmployeeID | OrderDate |
|---------|------------|------------|-----------|
| 1001    | 1          | 101        | 2023-05-01|
| 1002    | 1          | 102        | 2023-06-01|
| 1003    | 2          | 101        | 2023-07-01|
| 1004    | 3          | 103        | 2023-05-01|
| 1005    | 4          | 102        | 2023-06-01|

`Products`:

| ProductID | ProductName | Price |
|-----------|-------------|-------|
| 1         | Product A   | 50    |
| 2         | Product B   | 30    |
| 3         | Product C   | 20    |

`OrderDetails`:

| OrderDetailID | OrderID | ProductID | Quantity |
|---------------|---------|-----------|----------|
| 1             | 1001    | 1         | 2        |
| 2             | 1001    | 2         | 1        |
| 3             | 1002    | 3         | 3        |
| 4             | 1003    | 1         | 1        |
| 5             | 1004    | 2         | 2        |
| 6             | 1005    | 1         | 1        |
| 7             | 1005    | 3         | 2        |


Write an SQL query to fetch the manager's name (ManagerName), 
the customer's country (Country), and the total sales amount (TotalSales) 
for each manager for each country in the first half of the year (January to June).

The total sales amount should be calculated as the sum of `Price * Quantity` 
for all products in all orders that employees managed by a 
particular manager processed for customers from each country during that period. 

Order the result by total sales in descending order. 
Exclude countries with sales less than 100.

*/

SELECT m.ManagerName, c.Country, SUM(p.Price * od.Quantity) AS TotalSales
FROM Managers m 
LEFT JOIN Employees e ON m.ManagerID = e.ManagerID 
LEFT JOIN Orders o ON o.EmployeeID = e.EmployeeID
LEFT JOIN OrderDetails od ON o.OrderID = od.OrderID 
LEFT JOIN Products p ON od.ProductID = p.ProductID
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 2023 AND MONTH(o.OrderDate) BETWEEN 1 AND 6
GROUP BY m.ManagerName, c.Country
HAVING SUM(p.Price * od.Quantity) >= 100
ORDER BY TotalSales DESC

/*
COMMENTARY
The difference between LEFT JOIN and INNER JOIN:

For the purpose of illustration, let's consider some hypothetical results that could come 
from running the `LEFT JOIN` query and the `INNER JOIN` query.

Given the dummy data and assuming the conditions (Year, Month, and Minimum Sales) 
hold, we could get the following results from the `LEFT JOIN` version of the query:

| ManagerName | Country | TotalSales |
|-------------|---------|------------|
| John Doe    | USA     | 1000       |
| Jane Doe    | USA     | 900        |
| Alice Smith | Canada  | 800        |
| Bob Johnson | Canada  | 700        |
| John Doe    | Mexico  | NULL       |

As you can see, the last row has `NULL` for `TotalSales`. 
This is because with a `LEFT JOIN`, if there's a Manager (John Doe) 
who manages a country (Mexico) but has no sales records (as defined by our query's conditions), 
they will still appear in the results with `NULL` as the `TotalSales`.

Now, let's see what we might get with the `INNER JOIN` version of the query:

| ManagerName | Country | TotalSales |
|-------------|---------|------------|
| John Doe    | USA     | 1000       |
| Jane Doe    | USA     | 900        |
| Alice Smith | Canada  | 800        |
| Bob Johnson | Canada  | 700        |

As you can see, the row for John Doe managing Mexico is not present 
in the `INNER JOIN` result. This is because `INNER JOIN` only 
includes rows where there are matching records in both tables.

Again, these are hypothetical results for illustrative purposes. 
The actual results would depend on the specific data in your tables.

*/