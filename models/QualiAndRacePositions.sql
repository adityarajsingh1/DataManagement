{{ config(
    materialized='table'
) }}
SELECT
  q.driverId,
  d.forename,
  d.surname,
  AVG(CAST(q.position AS FLOAT64)) AS avg_qualifying_position,
  AVG(CAST(r.position AS FLOAT64)) AS avg_race_position
FROM
  `datamanagement-404011.Formula1.qualifying` q
JOIN
  `datamanagement-404011.Formula1.results` r
ON
  q.driverId = r.driverId
JOIN
  `datamanagement-404011.Formula1.drivers` d
ON
  q.driverId = d.driverId
WHERE
  SAFE_CAST(q.position AS INT64) IS NOT NULL
  AND SAFE_CAST(r.position AS INT64) IS NOT NULL
GROUP BY
  q.driverId, d.forename, d.surname
ORDER BY
  avg_qualifying_position ASC