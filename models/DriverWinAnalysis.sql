-- This query calculates some aggregate metrics for each driver:
--   - total number of races participated
--   - maximum number of wins
--   - total points across races
{{ config(
    materialized='table'
) }}
SELECT
  d.driverId,
  d.forename,
  d.surname,
  COUNT(DISTINCT q.raceId) AS total_races_participated,
  MAX(cs.wins) AS max_wins,
  SUM(cs.points) AS total_points
FROM
  `datamanagement-404011.Formula1.drivers` d
JOIN
  `datamanagement-404011.Formula1.qualifying` q
ON
  d.driverId = q.driverId
JOIN
  `datamanagement-404011.Formula1.constructor_standings` cs
ON
  q.raceId = cs.raceId
  AND q.constructorId = cs.constructorId
GROUP BY
  d.driverId, d.forename, d.surname
ORDER BY
  total_races_participated DESC
LIMIT
  1000