CREATE INDEX i_r4
ON records(TailNum);
CREATE INDEX i_p4
ON plane_data(tailnum);

SELECT model, AVG(Distance)/AVG(ActualElapsedTime) AS AVG_speed
FROM (
    SELECT model, ActualElapsedTime, Distance
    FROM records r RIGHT JOIN plane_data p ON r.TailNum=p.tailnum
) T
WHERE model IS NOT NULL AND Distance IS NOT NULL AND ActualElapsedTime IS NOT NULL AND ActualElapsedTime!=0
GROUP BY model;

DROP INDEX i_r4
ON records;
DROP INDEX i_p4
ON plane_data;
