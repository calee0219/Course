CREATE INDEX i_r9
ON records(TailNum);
CREATE INDEX i_p9
ON plane_data(tailnum);

SELECT Year-issY, AVG(ArrDelay)
FROM (
    SELECT CAST(RIGHT(issue_date,4) AS int) AS issY, r.Year, ArrDelay
    FROM plane_data p RIGHT JOIN records r ON p.tailnum=r.TailNum
) T
WHERE issY IS NOT NULL AND Year IS NOT NULL AND Year >= issY AND issY!=0
GROUP BY Year-issY
ORDER BY Year-issY;

DROP INDEX i_r9
ON records;
DROP INDEX i_p9
ON plane_data;
