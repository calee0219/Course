SELECT DISTINCT model
FROM plane_data
WHERE model IS NOT NULL AND tailnum NOT IN (
    SELECT DISTINCT TailNum
    FROM records
    WHERE year='2008'
);
