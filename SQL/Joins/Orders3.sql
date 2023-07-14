/*

Employees: 
  EmployeeID  EmployeeName
     101         Alice       
     102         Bob          

Orders:
  OrderID  CustomerID  EmployeeID  OrderDate
    1001       1         101      2023-07-01 
    1002       1         102      2023-07-05
    1003       2         101      2023-07-10  

OrderDetails:
  OrderDetailID  OrderID  ProductID  Quantity
       1          1001        1         2        
       2          1001        2         1        
       3          1002        3         3       
       4          1003        1         1        
       5          1003        2         2   

Products:
  ProductID  ProductName  Price
      1       Product A    50   
      2       Product B    30   
      3       Product C    20   

Now each Order contains multiple OrderDetails, and each OrderDetail refers to a specific Product.

Here is the problem: 

Write an SQL query to fetch the employee name (EmployeeName), 
along with the total amount they sold (TotalSales), for all employees. 
Order the result by total sales in descending order. 
The total sales amount for an employee should be calculated as the sum of 
Price * Quantity for all products in all orders that employee handled.

HINT
This problem adds complexity by requiring joining across four tables and computing a product within the SUM function.


*/
SELECT      e.EmployeeName, SUM(p.price * od.quantity) AS TOTALSALES 
FROM        Employees e 
LEFT JOIN   Orders o ON o.EmployeeID = e.EmployeeID 
LEFT JOIN   OrderDetails od ON od.OrderID = o.OrderID
LEFT JOIN   Products p ON p.ProductID = od.ProductID
GROUP BY    e.employeeName 
ORDER BY    TotalSales DESC