CREATE INDEX i_r5O
ON records(Origin);
CREATE INDEX i_r5D
ON records(Dest);
CREATE INDEX i_a5
ON airports(iata);

SELECT ABS(ol-dl), oo, dd
FROM (
        SELECT Origin AS oo, Dest AS od, `long` AS ol
        FROM airports RIGHT JOIN records ON iata=Origin
    ) Ol JOIN (
        SELECT Origin AS do, Dest AS dd, `long` AS dl
        FROM airports RIGHT JOIN records ON iata=Dest
    ) Dl ON (oo=do AND od=dd)
ORDER BY ABS(ol-dl)
LIMIT 50;

DROP INDEX i_r5O
ON records;
DROP INDEX i_r5D
ON records;
DROP INDEX i_a5
ON airports;
