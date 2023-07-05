/*
Query the greatest value of the Northern Latitudes (LAT_N) 
from STATION that is less than . Truncate your answer to 4 decimal places.
*/

SELECT TOP 1 CAST((LAT_N) AS DECIMAL(10, 4))
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC;


/*
COMMENTARY

The first time I tried this with the TOP 1 syntax, I left out the last line, ORDER BY. 
The query you provided is missing the ORDER BY clause, which is necessary to determine 
the greatest value of the Northern Latitudes (LAT_N). 
The TOP 1 keyword alone will return an arbitrary row without any specific ordering.
*/