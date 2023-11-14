-- name this file replace_nulls.sql in your dbt models directory

{{
    config(
        materialized='table'
    )
}}


SELECT
    driverId,
    CASE WHEN driverRef = '\\N' THEN NULL ELSE driverRef END as driverRef,
    CASE WHEN number = '\\N' THEN NULL ELSE number END as number,
    CASE WHEN code = '\\N' THEN NULL ELSE code END as code,
    CASE WHEN forename = '\\N' THEN NULL ELSE forename END as forename,
    CASE WHEN surname = '\\N' THEN NULL ELSE surname END as surname,
    CASE WHEN nationality = '\\N' THEN NULL ELSE nationality END as nationality,
    CASE WHEN url = '\\N' THEN NULL ELSE url END as url
FROM `datamanagement-404011.Formula1.drivers`
