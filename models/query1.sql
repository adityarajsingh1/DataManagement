{{ config(
    materialized='table'
) }}

SELECT 
    r.year,
    r.name AS race_name,
    r.raceId AS race_id,
    ds.points AS driver_points,
    ds.position AS driver_position,
    ds.wins AS driver_wins,
    cir.lat AS latitude,
    cir.lng AS longitude,
    d.forename AS driver_forename,
    d.surname AS driver_surname,
    c.name AS constructor_name,
    res.positionOrder AS race_result_position,
    res.points AS result_points,
    res.time,
    res.fastestLap,
    res.fastestLapTime
FROM `datamanagement-404011.Formula1.races` r
JOIN `datamanagement-404011.Formula1.driver_standings` ds ON r.raceId = ds.raceId
JOIN `datamanagement-404011.Formula1.results` res ON r.raceId = res.raceId AND ds.driverId = res.driverId
JOIN `datamanagement-404011.Formula1.constructors` c ON res.constructorId = c.constructorId
JOIN `datamanagement-404011.Formula1.drivers` d ON ds.driverId = d.driverId
JOIN `datamanagement-404011.Formula1.circuits` cir ON r.circuitId = cir.circuitId

