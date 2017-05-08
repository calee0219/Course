CREATE INDEX i_r7
ON records(TailNum);
CREATE INDEX i_p7
ON plane_data(tailnum);

SELECT DISTINCT manufacturer
FROM (
    SELECT manufacturer, ArrDelay
    FROM records r, plane_data p
    WHERE r.TailNum=p.tailnum AND ArrDelay IS NOT NULL AND ArrDelay!=0
) T
GROUP BY manufacturer
HAVING AVG(ArrDelay) > 30;

DROP INDEX i_r7
ON records;
DROP INDEX i_p7
ON plane_data;
