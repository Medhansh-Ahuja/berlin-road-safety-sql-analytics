-- ============================================================
-- Berlin Road Safety Analytics
-- File: 05_views.sql
-- Purpose: Create reusable analytical views
-- ============================================================

DROP VIEW IF EXISTS vw_monthly_accident_trends;
DROP VIEW IF EXISTS vw_hourly_accident_patterns;
DROP VIEW IF EXISTS vw_district_accident_summary;
DROP VIEW IF EXISTS vw_vehicle_involvement_summary;
DROP VIEW IF EXISTS vw_vulnerable_road_user_accidents;
DROP VIEW IF EXISTS vw_accident_map_export;

-- ------------------------------------------------------------
-- 1. Monthly accident trend
-- ------------------------------------------------------------
CREATE VIEW vw_monthly_accident_trends AS
SELECT
    accident_month,
    COUNT(*) AS total_accidents,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM accidents_clean
GROUP BY accident_month
ORDER BY accident_month;


-- ------------------------------------------------------------
-- 2. Hourly accident pattern
-- ------------------------------------------------------------
CREATE VIEW vw_hourly_accident_patterns AS
SELECT
    accident_hour,
    COUNT(*) AS total_accidents,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM accidents_clean
GROUP BY accident_hour
ORDER BY accident_hour;


-- ------------------------------------------------------------
-- 3. District accident summary
-- ------------------------------------------------------------
CREATE VIEW vw_district_accident_summary AS
SELECT
    district_code,
    CASE district_code
        WHEN 1 THEN 'Mitte'
        WHEN 2 THEN 'Friedrichshain-Kreuzberg'
        WHEN 3 THEN 'Pankow'
        WHEN 4 THEN 'Charlottenburg-Wilmersdorf'
        WHEN 5 THEN 'Spandau'
        WHEN 6 THEN 'Steglitz-Zehlendorf'
        WHEN 7 THEN 'Tempelhof-Schöneberg'
        WHEN 8 THEN 'Neukölln'
        WHEN 9 THEN 'Treptow-Köpenick'
        WHEN 10 THEN 'Marzahn-Hellersdorf'
        WHEN 11 THEN 'Lichtenberg'
        WHEN 12 THEN 'Reinickendorf'
        ELSE 'Unknown'
    END AS district_name,
    COUNT(*) AS total_accidents,
    SUM(CASE WHEN involves_bicycle THEN 1 ELSE 0 END) AS bicycle_accidents,
    SUM(CASE WHEN involves_pedestrian THEN 1 ELSE 0 END) AS pedestrian_accidents,
    SUM(CASE WHEN involves_car THEN 1 ELSE 0 END) AS car_accidents,
    SUM(CASE WHEN involves_motorcycle THEN 1 ELSE 0 END) AS motorcycle_accidents,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM accidents_clean
GROUP BY district_code
ORDER BY total_accidents DESC;


-- ------------------------------------------------------------
-- 4. Vehicle involvement summary
-- ------------------------------------------------------------
CREATE VIEW vw_vehicle_involvement_summary AS
SELECT 'Bicycle' AS road_user_type, SUM(CASE WHEN involves_bicycle THEN 1 ELSE 0 END) AS total_accidents
FROM accidents_clean

UNION ALL

SELECT 'Car' AS road_user_type, SUM(CASE WHEN involves_car THEN 1 ELSE 0 END) AS total_accidents
FROM accidents_clean

UNION ALL

SELECT 'Pedestrian' AS road_user_type, SUM(CASE WHEN involves_pedestrian THEN 1 ELSE 0 END) AS total_accidents
FROM accidents_clean

UNION ALL

SELECT 'Motorcycle' AS road_user_type, SUM(CASE WHEN involves_motorcycle THEN 1 ELSE 0 END) AS total_accidents
FROM accidents_clean

UNION ALL

SELECT 'Goods Vehicle' AS road_user_type, SUM(CASE WHEN involves_goods_vehicle THEN 1 ELSE 0 END) AS total_accidents
FROM accidents_clean

UNION ALL

SELECT 'Other' AS road_user_type, SUM(CASE WHEN involves_other THEN 1 ELSE 0 END) AS total_accidents
FROM accidents_clean;


-- ------------------------------------------------------------
-- 5. Vulnerable road user accident view
-- Bicycle + pedestrian accidents
-- ------------------------------------------------------------
CREATE VIEW vw_vulnerable_road_user_accidents AS
SELECT
    accident_id,
    district_code,
    accident_month,
    accident_hour,
    accident_weekday,
    accident_category_code,
    accident_type_code,
    involves_bicycle,
    involves_pedestrian,
    longitude,
    latitude
FROM accidents_clean
WHERE involves_bicycle = TRUE
   OR involves_pedestrian = TRUE;


-- ------------------------------------------------------------
-- 6. Accident map export view
-- ------------------------------------------------------------
CREATE VIEW vw_accident_map_export AS
SELECT
    accident_id,
    district_code,
    accident_month,
    accident_hour,
    accident_weekday,
    accident_category_code,
    accident_type_code,
    involves_bicycle,
    involves_car,
    involves_pedestrian,
    involves_motorcycle,
    longitude,
    latitude
FROM accidents_clean
WHERE longitude IS NOT NULL
  AND latitude IS NOT NULL;