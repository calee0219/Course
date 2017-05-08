SELECT  season, SUM(ArrDelay) AS sum_delay
FROM (SELECT ArrDelay,
    CASE
        WHEN Month IN (3,4,5) THEN 'Spring'
        WHEN Month IN (6,7,8) THEN 'Summer'
        WHEN Month IN (9,10,11) THEN 'FALL'
        WHEN Month IN (12,1,2) THEN 'Winter'
    END AS season
    FROM records
) T
GROUP BY season
ORDER BY FIELD(season, 'Spring', 'Summer', 'Fall', 'Winter');
