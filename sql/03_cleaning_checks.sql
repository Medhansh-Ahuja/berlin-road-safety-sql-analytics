-- ============================================================
-- Berlin Road Safety Analytics
-- File: 03_cleaning_checks.sql
-- Purpose: Data quality checks for cleaned accident data
-- ============================================================

-- 1. Check total rows in raw and clean tables
SELECT 'accidents_raw' AS table_name, COUNT(*) AS row_count
FROM accidents_raw
UNION ALL
SELECT 'accidents_clean' AS table_name, COUNT(*) AS row_count
FROM accidents_clean;

-- 2. Check duplicate accident IDs
SELECT
    accident_id,
    COUNT(*) AS duplicate_count
FROM accidents_clean
GROUP BY accident_id
HAVING COUNT(*) > 1;

-- 3. Check missing coordinates
SELECT
    COUNT(*) AS missing_coordinates
FROM accidents_clean
WHERE longitude IS NULL
   OR latitude IS NULL;

-- 4. Check invalid longitude/latitude ranges for Berlin/Germany
SELECT *
FROM accidents_clean
WHERE longitude NOT BETWEEN 13.0 AND 14.0
   OR latitude NOT BETWEEN 52.0 AND 53.0;

-- 5. Check accident year values
SELECT
    accident_year,
    COUNT(*) AS total_accidents
FROM accidents_clean
GROUP BY accident_year
ORDER BY accident_year;

-- 6. Check invalid months
SELECT *
FROM accidents_clean
WHERE accident_month < 1
   OR accident_month > 12
   OR accident_month IS NULL;

-- 7. Check invalid hours
SELECT *
FROM accidents_clean
WHERE accident_hour < 0
   OR accident_hour > 23
   OR accident_hour IS NULL;

-- 8. Check weekday distribution
SELECT
    accident_weekday,
    COUNT(*) AS total_accidents
FROM accidents_clean
GROUP BY accident_weekday
ORDER BY accident_weekday;

-- 9. Check invalid weekday values
SELECT *
FROM accidents_clean
WHERE accident_weekday < 1
   OR accident_weekday > 7
   OR accident_weekday IS NULL;

-- 10. Check accident category distribution
SELECT
    accident_category_code,
    COUNT(*) AS total_accidents
FROM accidents_clean
GROUP BY accident_category_code
ORDER BY accident_category_code;

-- 11. Check accident type distribution
SELECT
    accident_type_code,
    COUNT(*) AS total_accidents
FROM accidents_clean
GROUP BY accident_type_code
ORDER BY accident_type_code;

-- 12. Check vehicle involvement totals
SELECT
    SUM(CASE WHEN involves_bicycle THEN 1 ELSE 0 END) AS bicycle_accidents,
    SUM(CASE WHEN involves_car THEN 1 ELSE 0 END) AS car_accidents,
    SUM(CASE WHEN involves_pedestrian THEN 1 ELSE 0 END) AS pedestrian_accidents,
    SUM(CASE WHEN involves_motorcycle THEN 1 ELSE 0 END) AS motorcycle_accidents,
    SUM(CASE WHEN involves_goods_vehicle THEN 1 ELSE 0 END) AS goods_vehicle_accidents,
    SUM(CASE WHEN involves_other THEN 1 ELSE 0 END) AS other_accidents
FROM accidents_clean;

-- 13. Preview clean data
SELECT
    accident_id,
    district_code,
    accident_year,
    accident_month,
    accident_hour,
    accident_weekday,
    accident_category_code,
    accident_type_code,
    longitude,
    latitude
FROM accidents_clean
LIMIT 10;