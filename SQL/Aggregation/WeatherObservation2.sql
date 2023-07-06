
/*
Query the following two values from the STATION table:

The sum of all values in LAT_N rounded to a scale of 2 decimal places.
The sum of all values in LONG_W rounded to a scale of 2 decimal places.

*/

SELECT 
    CAST(SUM(LAT_N) AS DECIMAL(10,2)) AS lat, 
    CAST(SUM(LONG_W) AS DECIMAL(10,2)) AS lon
FROM 
    STATION


/*
COMMENTARY

*/