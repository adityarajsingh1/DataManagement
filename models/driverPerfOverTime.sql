{{ config(
    materialized='table'
) }}
SELECT
  d.driverId,
  d.forename,
  d.surname,
  r.year,
  AVG(rs.points) AS average_points
FROM
  `datamanagement-404011.Formula1.drivers` d
JOIN
  `datamanagement-404011.Formula1.results` rs
ON
  d.driverId = rs.driverId
JOIN
  `datamanagement-404011.Formula1.races` r
ON
  rs.raceId = r.raceId
GROUP BY
  d.driverId, d.forename, d.surname, r.year