/*
This is a custom problem that I created to work on Joins

Now, let's say we want to find out all the orders, who placed them (customer's name),
and who handled the order (employee's name). 
We can do that with a query that joins these three tables.

Write an SQL query to fetch the order id (OrderID), customer name (CustomerName), 
and employee name (EmployeeName) for all the orders.

Customers:

| CustomerID | CustomerName |
|------------|--------------|
| 1          | John Doe     |
| 2          | Jane Doe     |

Orders:

| OrderID | CustomerID | EmployeeID | OrderDate |
|---------|------------|------------|-----------|
| 1001    | 1          | 101        |2023-07-01 |
| 1002    | 1          | 102        |2023-07-05 |
| 1003    | 2          | 101        |2023-07-10 |

Employees:

| EmployeeID | EmployeeName |
|------------|--------------|
| 101        | Alice        |
| 102        | Bob          |

Write an SQL query to fetch the order id (OrderID), customer name (CustomerName), 
and employee name (EmployeeName) for all the orders.


*/

SELECT      O.Order_ID, c.CustomerName, e.EmployeeName 
FROM        Orders o
LEFT JOIN   Customers c ON o.CustomerID = c.CustomerID 
LEFT JOIN   Employees e ON e.EmployeeID = o.EmployeeID 


/*
Commentary
Super basic left join stuff. Deep breath in and out.
*/