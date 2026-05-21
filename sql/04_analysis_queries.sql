-- ============================================================
-- Berlin Road Safety Analytics
-- File: 04_analysis_queries.sql
-- Purpose: Main SQL analysis queries
-- ============================================================

-- ------------------------------------------------------------
-- 1. Total number of accidents
-- ------------------------------------------------------------
SELECT
    COUNT(*) AS total_accidents
FROM accidents_clean;


-- ------------------------------------------------------------
-- 2. Accidents by month
-- ------------------------------------------------------------
SELECT
    accident_month,
    COUNT(*) AS total_accidents
FROM accidents_clean
GROUP BY accident_month
ORDER BY accident_month;


-- ------------------------------------------------------------
-- 3. Accidents by hour of day
-- ------------------------------------------------------------
SELECT
    accident_hour,
    COUNT(*) AS total_accidents
FROM accidents_clean
GROUP BY accident_hour
ORDER BY accident_hour;


-- ------------------------------------------------------------
-- 4. Top 5 peak accident hours
-- ------------------------------------------------------------
SELECT
    accident_hour,
    COUNT(*) AS total_accidents
FROM accidents_clean
GROUP BY accident_hour
ORDER BY total_accidents DESC
LIMIT 5;


-- ------------------------------------------------------------
-- 5. Accidents by weekday
-- ------------------------------------------------------------
SELECT
    accident_weekday,
    COUNT(*) AS total_accidents
FROM accidents_clean
GROUP BY accident_weekday
ORDER BY accident_weekday;


-- ------------------------------------------------------------
-- 6. Weekday vs weekend accidents
-- Assumption: weekday codes 1-5 = weekday, 6-7 = weekend
-- ------------------------------------------------------------
SELECT
    CASE
        WHEN accident_weekday IN (6, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(*) AS total_accidents,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM accidents_clean
GROUP BY day_type
ORDER BY total_accidents DESC;


-- ------------------------------------------------------------
-- 7. Accidents by Berlin district code
-- ------------------------------------------------------------
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
    COUNT(*) AS total_accidents
FROM accidents_clean
GROUP BY district_code
ORDER BY total_accidents DESC;


-- ------------------------------------------------------------
-- 8. Accident category distribution
-- ------------------------------------------------------------
SELECT
    accident_category_code,
    COUNT(*) AS total_accidents,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM accidents_clean
GROUP BY accident_category_code
ORDER BY total_accidents DESC;


-- ------------------------------------------------------------
-- 9. Accident type distribution
-- ------------------------------------------------------------
SELECT
    accident_type_code,
    COUNT(*) AS total_accidents,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM accidents_clean
GROUP BY accident_type_code
ORDER BY total_accidents DESC;


-- ------------------------------------------------------------
-- 10. Vehicle involvement summary
-- ------------------------------------------------------------
SELECT
    SUM(CASE WHEN involves_bicycle THEN 1 ELSE 0 END) AS bicycle_accidents,
    SUM(CASE WHEN involves_car THEN 1 ELSE 0 END) AS car_accidents,
    SUM(CASE WHEN involves_pedestrian THEN 1 ELSE 0 END) AS pedestrian_accidents,
    SUM(CASE WHEN involves_motorcycle THEN 1 ELSE 0 END) AS motorcycle_accidents,
    SUM(CASE WHEN involves_goods_vehicle THEN 1 ELSE 0 END) AS goods_vehicle_accidents,
    SUM(CASE WHEN involves_other THEN 1 ELSE 0 END) AS other_accidents
FROM accidents_clean;


-- ------------------------------------------------------------
-- 11. Bicycle accidents by district
-- ------------------------------------------------------------
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
    COUNT(*) AS bicycle_accidents
FROM accidents_clean
WHERE involves_bicycle = TRUE
GROUP BY district_code
ORDER BY bicycle_accidents DESC;


-- ------------------------------------------------------------
-- 12. Pedestrian accidents by district
-- ------------------------------------------------------------
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
    COUNT(*) AS pedestrian_accidents
FROM accidents_clean
WHERE involves_pedestrian = TRUE
GROUP BY district_code
ORDER BY pedestrian_accidents DESC;


-- ------------------------------------------------------------
-- 13. Hourly accident pattern by bicycle involvement
-- ------------------------------------------------------------
SELECT
    accident_hour,
    COUNT(*) AS bicycle_accidents
FROM accidents_clean
WHERE involves_bicycle = TRUE
GROUP BY accident_hour
ORDER BY accident_hour;


-- ------------------------------------------------------------
-- 14. Rank districts by total accidents
-- ------------------------------------------------------------
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
    RANK() OVER (ORDER BY COUNT(*) DESC) AS accident_rank
FROM accidents_clean
GROUP BY district_code
ORDER BY accident_rank;


-- ------------------------------------------------------------
-- 15. Peak accident hour per district
-- ------------------------------------------------------------
WITH district_hourly_accidents AS (
    SELECT
        district_code,
        accident_hour,
        COUNT(*) AS total_accidents,
        RANK() OVER (
            PARTITION BY district_code
            ORDER BY COUNT(*) DESC
        ) AS hour_rank
    FROM accidents_clean
    GROUP BY district_code, accident_hour
)
SELECT
    district_code,
    accident_hour,
    total_accidents
FROM district_hourly_accidents
WHERE hour_rank = 1
ORDER BY total_accidents DESC;


-- ------------------------------------------------------------
-- 16. Accident severity proxy by district
-- Lower accident_category_code generally indicates more severe accident category.
-- ------------------------------------------------------------
SELECT
    district_code,
    COUNT(*) AS total_accidents,
    AVG(accident_category_code) AS avg_category_code
FROM accidents_clean
GROUP BY district_code
ORDER BY avg_category_code ASC;


-- ------------------------------------------------------------
-- 17. Top high-risk LOR areas
-- ------------------------------------------------------------
SELECT
    lor_area,
    district_code,
    COUNT(*) AS total_accidents
FROM accidents_clean
GROUP BY lor_area, district_code
ORDER BY total_accidents DESC
LIMIT 20;


-- ------------------------------------------------------------
-- 18. Coordinates for accident map export
-- ------------------------------------------------------------
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
    longitude,
    latitude
FROM accidents_clean
WHERE longitude IS NOT NULL
  AND latitude IS NOT NULL;