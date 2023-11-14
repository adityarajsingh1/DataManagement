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
    WHEN nationality IN ('British', 'German', 'Spanish', 'Finnish', 'French', 'Italian', 'Swiss', 'Portuguese', 'Dutch', 'Belgian', 'Austrian', 'Liechtensteiner', 'Luxembourgian', 'Monacan', 'Danish', 'Swedish', 'Norwegian', 'Finnish', 'Icelandic', 'Estonian', 'Latvian', 'Lithuanian', 'Polish', 'Czech', 'Slovakian', 'Hungarian', 'Slovenian', 'Croatian', 'Bosnian', 'Serbian', 'Montenegrin', 'Macedonian', 'Kosovar', 'Albanian', 'Greek', 'Maltese', 'Cypriot') THEN 'Europe'
    WHEN nationality IN ('Japanese', 'Chinese', 'Korean', 'Vietnamese', 'Thai', 'Indonesian', 'Malaysian', 'Filipino', 'Singaporean', 'Burma', 'Laotian', 'Cambodian') THEN 'Asia'
    WHEN nationality IN ('Brazilian', 'Argentine', 'Uruguayan', 'Chilean', 'Colombian', 'Venezuelan', 'Peruvian', 'Ecuadorian', 'Bolivian', 'Paraguayan') THEN 'South America'
    WHEN nationality IN ('American', 'Canadian', 'Mexican') THEN 'North America'
    WHEN nationality IN ('Australian', 'New Zealander') THEN 'Oceania'
    WHEN nationality IN ('South African', 'Namibian', 'Zimbabwean', 'Zambian', 'Angolan', 'Mozambican', 'Malawian', 'Tanzanian', 'Kenyan', 'Ugandan', 'Rwandan', 'Burundian', 'Congolese', 'Gabonese', 'Equatorial Guinean', 'Sao Tomean', 'Principean', 'Ivorian', 'Burkinabe', 'Malian', 'Nigerien', 'Chadian', 'Sudanese', 'South Sudanese', 'Eritrean', 'Djiboutian', 'Somali', 'Ethiopian') THEN 'Africa'
    ELSE 'Other'
  END AS nationality_group,
  url
FROM `datamanagement-404011.Formula1.drivers`