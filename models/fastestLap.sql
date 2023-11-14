{{ config(
    materialized='table'
) }}
SELECT
  driverId,
  COUNT(*) AS fastest_lap_count
FROM
  `datamanagement-404011.Formula1.results`
WHERE
  fastestLap IS NOT NULL
GROUP BY
  driverId
ORDER BY
  fastest_lap_count DESC
LIMIT 1