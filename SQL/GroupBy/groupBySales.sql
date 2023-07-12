/*
Given the SALES table, write a query to find the total sales amount for each product 
(PRODUCT_ID) and the number of sales transactions for each product. 
Return the results sorted by the total sales amount in descending order.

SALES Table:
| SALE_ID | PRODUCT_ID | AMOUNT |
|---------|------------|--------|
| 1       | 100        | 50     |
| 2       | 101        | 100    |
| 3       | 100        | 75     |
| 4       | 102        | 200    |
| 5       | 101        | 50     |
| 6       | 100        | 150    |

*/


SELECT PRODUCT_ID, SUM(AMOUNT) AS TotalAmount, COUNT(*) AS TransactionCount
FROM SALES
GROUP BY PRODUCT_ID
ORDER BY TotalAmount DESC;


/*
COMMENTARY

The key to this problem is understanding how COUNT works in conjunction with GROUP BY. 
The COUNT(*) doens't need a specific column because it operates on the entire row.
It counts the number of rows that match the grouping criteria specified in the GROUP BY
clause. Since it counts rows, rather than indivisual column values, it doesn't require
the specific column.

So here, the COUNT(*) function counts the number of sales transactions for each product.
It doesn't need to specify a particular column because it counts all the rows defined by 
GROUP BY clause. The result will be the number of rows associated with each product.


*/