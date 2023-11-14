-- In your dbt model file, e.g., Groupbycontinents.sql
 
{{ config(
    materialized='table'
) }}
 
SELECT
  driverId,
  driverRef,
  number,
  code,
  forename,
  surname,
  dob,
  nationality,
  CASE
    WHEN TIMESTAMP(dob) BETWEEN TIMESTAMP('1900-03-29') AND TIMESTAMP('1997-03-29') THEN 'Older'
    WHEN TIMESTAMP(dob) BETWEEN TIMESTAMP('1998-03-29') AND TIMESTAMP('2010-03-29') THEN 'Middle-aged'
    WHEN TIMESTAMP(dob) BETWEEN TIMESTAMP('2011-03-29') AND TIMESTAMP('2023-03-29') THEN 'Young'
    -- Add more ranges as needed
    ELSE 'Other'
  END AS age_range,
  url
FROM `datamanagement-404011.Formula1.drivers`