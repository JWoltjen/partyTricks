/*

Alright, let's try with this one:

**Tables:**

**Orders:**

| OrderID | CustomerID | EmployeeID | OrderDate  |
|---------|------------|------------|------------|
| 1       | 3          | 1          | 2023-01-01 |
| 2       | 1          | 2          | 2023-02-01 |
| 3       | 2          | 3          | 2023-03-01 |
| 4       | 5          | 4          | 2023-04-01 |
| 5       | 4          | 1          | 2023-05-01 |

**OrderDetails:**

| OrderDetailID | OrderID | ProductID | Quantity |
|---------------|---------|-----------|----------|
| 1             | 1       | 1         | 10       |
| 2             | 2       | 2         | 5        |
| 3             | 3       | 3         | 7        |
| 4             | 4       | 4         | 3        |
| 5             | 5       | 5         | 9        |

**Products:**

| ProductID | ProductName | UnitPrice |
|-----------|-------------|-----------|
| 1         | Chai        | 18        |
| 2         | Chang       | 19        |
| 3         | Aniseed Syrup| 10       |
| 4         | Chef Anton's Chili Sauce| 22 |
| 5         | Chef Anton's Gumbo Mix  | 21.35 |

**Employees:**

| EmployeeID | EmployeeName | Salary | ManagerID |
|------------|--------------|--------|-----------|
| 1          | Alfred       | 3000   | 4         |
| 2          | Maria        | 3500   | 3         |
| 3          | Antonio      | 4000   | NULL      |
| 4          | Thomas       | 4500   | NULL      |

**Prompt:**

Write a query to find out, for each order, the following details: 

- The name of the employee who placed the order 
- The total number of items ordered 
- The total order amount
- The name of the manager of the employee who placed the order

Only consider orders that were placed in the year 2023 and order the output 
by the total order amount in descending order. 
If an employee doesn't have a manager, display 'No Manager'.
*/

