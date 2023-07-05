/*
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than
38.7880  and less than 137.2345. Truncate your answer to  decimal places.
*/

SELECT CAST(SUM(LAT_N) AS DECIMAL(10, 4)) AS SumOfNorthernLatitudes
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;



/*
COMMENTARY
In this query, the CAST() function is used to convert the sum of the LAT_N column
to a decimal with a precision of 10 and a scale of 4, 
effectively truncating the decimal places to 4.


Precision (p):
The precision refers to the total number of digits that a decimal number can hold, 
both to the left and right of the decimal point. It determines the maximum number of 
digits that can be stored in the decimal number. For example, in DECIMAL(10, 4), 
the precision is 10, meaning that the decimal number can have up to 10 digits in total.

Scale (s):
The scale refers to the number of digits that can be stored to the right of the decimal point.
It determines the maximum number of decimal places that can be stored in the decimal number. 
For example, in DECIMAL(10, 4), the scale is 4, meaning that the decimal number can have 
up to 4 decimal places.
*/