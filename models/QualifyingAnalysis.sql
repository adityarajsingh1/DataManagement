{{ config(
    materialized='table'
) }}
SELECT-----Qualifying Analysis:
---Identify drivers who consistently perform well in qualifying
  q.driverId,
  d.forename,
  d.surname,
  AVG(q.position) AS avg_qualifying_position
FROM
  `datamanagement-404011.Formula1.qualifying` q
JOIN
  `datamanagement-404011.Formula1.drivers` d
ON
  q.driverId = d.driverId
GROUP BY
  q.driverId, d.forename, d.surname
ORDER BY
  avg_qualifying_position ASC