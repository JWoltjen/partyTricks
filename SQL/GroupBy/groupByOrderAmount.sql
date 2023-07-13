/*
This is a custom problem I generated myself.
Given the ORDERS table, write a query to find the total order amount for each customer
(CUSTOMER_ID) and the number of orders they have placed. Return the results sorted by 
the total order amount in descending order.

ORDERS Table:
| ORDER_ID | CUSTOMER_ID | AMOUNT |
|----------|-------------|--------|
| 1        | 100         | 50     |
| 2        | 101         | 100    |
| 3        | 100         | 75     |
| 4        | 102         | 200    |
| 5        | 101         | 50     |
| 6        | 100         | 150    |


*/



SELECT CUSTOMER_ID, COUNT(*) AS OrderCount, SUM(AMOUNT) AS TotalAmount
FROM ORDERS
GROUP BY CUSTOMER_ID
ORDER BY TotalAmount DESC;

/*
Commentary
The SELECT statement specifies the columns to be returned in the result set. 
Here, we select three columns: CUSTOMER_ID, COUNT(*) AS OrderCount, and SUM(AMOUNT) AS TotalAmount. 
COUNT(*) calculates the number of orders for each customer, while SUM(AMOUNT) 
calculates the total order amount for each customer.

The FROM clause specifies the table from which we are retrieving data, 
which is the ORDERS table in this case.

The GROUP BY clause is applied to group the data by the CUSTOMER_ID column. 
This groups the rows based on the unique customer IDs.

The ORDER BY clause is used to sort the results based on the TotalAmount 
column in descending order. This means that customers with higher total 
order amounts will appear first in the result set.

Expected Output:

| CUSTOMER_ID | OrderCount | TotalAmount |
|-------------|------------|-------------|
| 100         | 3          | 275         |
| 102         | 1          | 200         |
| 101         | 2          | 150         |


*/