CREATE INDEX i_r12
ON records(TailNum);
CREATE INDEX i_p12
ON plane_data(tailnum);

SELECT `type`, AVG(Taxiln) AS avgTaxiln
FROM plane_data p, records r
WHERE p.tailnum=r.TailNum AND `type` IS NOT NULL
GROUP BY type
ORDER BY AVG(r.Taxiln);

DROP INDEX i_r12
ON records;
DROP INDEX i_p12
ON plane_data;
