/*
Sure! Let's add a new dimension to the problem by considering date ranges.

Consider these tables:

`Regions`:

| RegionID | RegionName |
|----------|------------|
| 1        | West       |
| 2        | East       |

`Employees`:

| EmployeeID | EmployeeName | ManagerName | RegionID |
|------------|--------------|-------------|----------|
| 101        | Alice        | Carol       | 1        |
| 102        | Bob          | David       | 2        |

`Orders`:

| OrderID | CustomerID | EmployeeID | OrderDate |
|---------|------------|------------|-----------|
| 1001    | 1          | 101        | 2023-06-01|
| 1002    | 1          | 102        | 2023-07-01|
| 1003    | 2          | 101        | 2023-08-01|

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
| 5             | 1003    | 2         | 2        |

And the problem statement:

Write an SQL query to fetch the region name (RegionName), the manager's name (ManagerName), 
and the total sales amount (TotalSales) for each region in the second quarter of the year 
(April, May, June). 

The total sales amount for a region should be calculated as the sum of `Price * Quantity` 
for all products in all orders that employees from that region handled during that quarter. 
Order the result by total sales in descending order.

Hint: This problem adds complexity by requiring filtering by a date range and joining across five tables. 
You will also need to calculate a product within the `SUM` function. Use the `YEAR()` and `MONTH()` functions 
to extract the year and month from the `OrderDate`, respectively. 

Remember to graphically visualize how these tables are connected to help you write the query.

*/

SELECT r.RegionName, e.ManagerName, SUM(od.Quantity * p.Price) AS TotalSales
FROM Regions r 
LEFT JOIN Employees e ON r.RegionID = e.RegionID
LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID
LEFT JOIN OrderDetails od ON o.OrderId = od.OrderId 
LEFT JOIN Products p ON od.ProductId = p.productId
WHERE YEAR(o.OrderDate) = 2023 AND MONTH(o.OrderDate) BETWEEN 4 AND 6
GROUP BY r.regionName, e.ManagerName
ORDER BY TotalSales DESC