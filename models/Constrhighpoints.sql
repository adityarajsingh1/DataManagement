{{ config(
    materialized='table'
) }}
SELECT----Identify constructors with the highest points in a particular race
  r.raceId,
  c.constructorId,
  c.name AS constructor_name,
  cr.points
FROM
  `datamanagement-404011.Formula1.constructor_results` cr
JOIN
  `datamanagement-404011.Formula1.constructors` c
ON
  cr.constructorId = c.constructorId
JOIN
  `datamanagement-404011.Formula1.races` r
ON
  cr.raceId = r.raceId
ORDER BY
  r.raceId, cr.points DESC