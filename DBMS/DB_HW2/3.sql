SELECT model, COUNT(*) AS modelAmount
FROM plane_data
WHERE model LIKE '737%'
GROUP BY model;
