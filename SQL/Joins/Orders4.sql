/*
Alright, let's make this a bit more complex by introducing the concept of regions. Now, employees belong to certain regions and each region has a manager. 

Here are the tables you'll be working with:

Customers:
```
| CustomerID | CustomerName |
|------------|--------------|
| 1          | John Doe     |
| 2          | Jane Doe     |
```

Employees:
```
| EmployeeID | EmployeeName | RegionID |
|------------|--------------|----------|
| 101        | Alice        | 1        |
| 102        | Bob          | 2        |
| 103        | Charlie      | 2        |
```

Orders:
```
| OrderID | CustomerID | EmployeeID | OrderDate  | OrderAmount |
|---------|------------|------------|------------|-------------|
| 1001    | 1          | 101        | 2023-07-01 | 100.00      |
| 1002    | 1          | 102        | 2023-07-05 | 200.00      |
| 1003    | 2          | 101        | 2023-07-10 | 150.00      |
| 1004    | 2          | 103        | 2023-07-12 | 300.00      |
```

Products:
```
| ProductID | ProductName | Price |
|-----------|-------------|-------|
| 1         | Product A   | 50    |
| 2         | Product B   | 30    |
| 3         | Product C   | 20    |
```

OrderDetails:
```
| OrderDetailID | OrderID | ProductID | Quantity |
|---------------|---------|-----------|----------|
| 1             | 1001    | 1         | 2        |
| 2             | 1001    | 2         | 1        |
| 3             | 1002    | 3         | 3        |
| 4             | 1003    | 1         | 1        |
| 5             | 1003    | 2         | 2        |
| 6             | 1004    | 3         | 5        |
```

Regions:
```
| RegionID | RegionName | ManagerID |
|----------|------------|-----------|
| 1        | East       | 101       |
| 2        | West       | 103       |
```

Now the problem is: 

Write an SQL query to fetch the region name (RegionName), the manager's name (ManagerName), 
and the total sales amount (TotalSales) for each region. 
The total sales amount for a region should be calculated as the sum of Price * Quantity for 
all products in all orders that employees from that region handled. 
Order the result by total sales in 
descending order.

This is a challenging problem because you'll need to join five tables and calculate 
the total sales per region. Go ahead and give it a try!

*/
Select      r.RegionName, e.EmployeeName, SUM(p.Price * od.Quantity) AS TotalSales
From        Regions r 
LEFT JOIN   Employees e ON e.RegionID = r.RegionID 
LEFT JOIN   Orders o ON o.EmployeeID = e.EmployeeID
LEFT JOIN   OrderDetails od ON od.OrderId = o.OrderID
LEFT JOIN   Products p ON p.productID = od.ProductID

GROUP BY r.RegionName, e.EmployeeName
ORDER BY TotalSales DESC

/*
Major hint for Group By

In SQL queries, whenever a calculation or an operation has to be performed "per" something 
(like per region, per employee, per product, etc.), it is a strong indication that the "per" 
column should be included in the GROUP BY clause. So, in this case, it is per region 
per employee, thus you need to include both in the GROUP BY clause.

The phrase "for each" is another indicator that you might need to use the GROUP BY clause. 
When a problem statement says to calculate something "for each" of a certain entity, 
it often implies that the calculation needs to be done separately for each unique instance 
of that entity.
*/