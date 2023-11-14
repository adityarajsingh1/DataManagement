-- Count the total wins by nationality for drivers with position 1 in driver standings
{{ config(
    materialized='table'
) }}
SELECT
  d.nationality,                           -- Select the nationality column
  COUNT(DISTINCT ds.raceId) AS total_wins  -- Count the distinct raceIds for each nationality
FROM
  `datamanagement-404011.Formula1.driver_standings` ds  -- Ref the driver_standings table as ds
JOIN
  `datamanagement-404011.Formula1.drivers` d           -- Join with the drivers table as d
ON
  ds.driverId = d.driverId                          -- Match records based on driverId
WHERE
  ds.position = 1                                   -- Filter for drivers with position 1
GROUP BY
  d.nationality                                    -- Group the results by nationality
ORDER BY
  total_wins DESC                                  -- Order the results by total_wins in descending order