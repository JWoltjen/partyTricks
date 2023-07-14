/*

| CustomerID | CustomerName |
|------------|--------------|
| 1          | John Doe     |
| 2          | Jane Doe     |


Employees:

| EmployeeID | EmployeeName |
|------------|--------------|
| 101        | Alice        |
| 102        | Bob          |


Orders:
| OrderID | CustomerID | EmployeeID | OrderDate | OrderAmount |
|---------|------------|------------|-----------|-------------|
| 1001    | 1          | 101        |2023-07-01 | 100.00      |
| 1002    | 1          | 102        |2023-07-05 | 200.00      |
| 1003    | 2          | 101        |2023-07-10 | 150.00      |


Write an SQL query to fetch the employee name (EmployeeName) 
along with total amount of orders (TotalOrderAmount) they handled for all employees. 
Order the result by total amount in descending order.

*/

SELECT      e.EmployeeName, SUM(o.OrderAmount) AS TotalOrderValue
FROM        Employees e
LEFT JOIN   Orders o ON e.EmployeeId = o.EmployeeID 
GROUP BY    e.EmployeeName
ORDER BY    TotalOrderValue DESC