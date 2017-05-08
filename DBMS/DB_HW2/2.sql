SELECT COUNT(*) AS flaitAmount
FROM records
WHERE Dest='JFK' AND ActualElapsedTime BETWEEN 60 AND 180;
