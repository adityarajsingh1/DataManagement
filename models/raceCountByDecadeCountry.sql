{{ config(
    materialized='table'
) }}
SELECT----This will group the races by decade, and you can see the total number of races for each country in each decade
  CONCAT(CAST(FLOOR(r.year / 10) * 10 AS STRING), 's') AS decade,
  c.country,
  COUNT(DISTINCT r.raceId) AS total_races
FROM
  `datamanagement-404011.Formula1.circuits` c
JOIN
  `datamanagement-404011.Formula1.races` r
ON
  c.circuitId = r.circuitId
GROUP BY
  decade, c.country
ORDER BY
  decade, total_races DESC