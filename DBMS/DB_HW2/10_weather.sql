SELECT AVG(WeatherDelay) AS avg_delay
FROM records
WHERE WeatherDelay IS NOT NULL;
