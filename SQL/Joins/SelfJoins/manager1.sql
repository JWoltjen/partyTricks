/*

Consider the following table named `Employees`:

**Employees:**

| EmployeeID | EmployeeName | ManagerID |
|------------|--------------|-----------|
| 1          | Amy          | NULL      |
| 2          | Bob          | 1         |
| 3          | Charles      | 1         |
| 4          | Daisy        | 2         |
| 5          | Evan         | 2         |
| 6          | Frank        | 3         |
| 7          | Grace        | 3         |

In this table, each employee has a manager except for Amy, who is presumably 
the top-level boss because her ManagerID is NULL. The ManagerID for each 
other employee corresponds to the EmployeeID of their manager.

Problem: We want to generate a list that shows each employee and the name of their manager.


In this query, we perform a self-join on the `Employees` table to match 
each employee (represented by `e1`) with their manager (represented by `e2`). 
The result is a list of employees along with the names of their managers. 
Note that we use a LEFT JOIN here to include Amy, who does not have a manager.


*/
SELECT e1.EmployeeName AS Employee, e2.EmployeeName AS Manager 
FROM Employees e1 
LEFT JOIN Employees e2 ON e1.ManagerID = e2.EmployeeID 

/*

| Employee | Manager |
|----------|---------|
| Amy      | NULL    |
| Bob      | Amy     |
| Charles  | Amy     |
| Daisy    | Bob     |
| Evan     | Bob     |
| Frank    | Charles |
| Grace    | Charles |

As you can see, each employee is listed alongside their respective manager. 
For Amy, who has no manager, the corresponding field is NULL.


*/