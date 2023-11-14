{{ config(
    materialized='table'
) }}

SELECT-- Average Races Per Decade
  CASE
    WHEN r.year BETWEEN 1950 AND 1959 THEN '1950s'
    WHEN r.year BETWEEN 1960 AND 1969 THEN '1960s'
    WHEN r.year BETWEEN 1970 AND 1979 THEN '1970s'
    WHEN r.year BETWEEN 1980 AND 1989 THEN '1980s'
    WHEN r.year BETWEEN 1990 AND 1999 THEN '1990s'
    WHEN r.year BETWEEN 2000 AND 2009 THEN '2000s'
    WHEN r.year BETWEEN 2010 AND 2019 THEN '2010s'
    WHEN r.year BETWEEN 2020 AND 2029 THEN '2020s'
    ELSE 'Other'
  END AS decade,
  AVG(total_races) AS avg_races_per_year
FROM (
  SELECT
    year,
    COUNT(DISTINCT raceId) AS total_races
  FROM
    `datamanagement-404011.Formula1.races`
  GROUP BY
    year
) r
GROUP BY
  decade
ORDER BY
  decade