/*
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION
 is greater than 38.8770. Round your answer to  decimal places.
*/

SELECT TOP 1 CAST(LONG_W AS DECIMAL(10, 4))
FROM STATION 
WHERE LAT_N > 38.7780
ORDER BY LAT_N ASC;