SELECT  CONCAT(ROUND(CRSDepTime/100, 0), 'hour') AS hour, AVG(ArrDelay)
FROM records
GROUP BY ROUND(CRSDepTime/100, 0);
