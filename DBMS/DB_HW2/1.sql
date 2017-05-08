SELECT COUNT(*)
FROM (
	SELECT DISTINCT Origin, Dest
	FROM records
) T;

-- SELECT SUM(cnt) AS routeNum
-- FROM (
    -- SELECT COUNT(DISTINCT Origin) AS cnt
    -- FROM records
    -- GROUP BY Dest
-- ) cnt;
