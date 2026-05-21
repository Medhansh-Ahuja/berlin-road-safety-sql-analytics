-- ============================================================
-- Berlin Road Safety Analytics
-- File: 02_load_data.sql
-- Purpose: Transform raw accident data into cleaned table
-- ============================================================

TRUNCATE TABLE accidents_clean;

INSERT INTO accidents_clean (
    accident_id,
    state_code,
    district_code,
    lor_area,
    accident_year,
    accident_month,
    accident_hour,
    accident_weekday,
    accident_category_code,
    accident_type_code,
    accident_subtype_code,
    light_condition_code,
    involves_bicycle,
    involves_car,
    involves_pedestrian,
    involves_motorcycle,
    involves_goods_vehicle,
    involves_other,
    road_condition_code,
    projected_x,
    projected_y,
    longitude,
    latitude
)
SELECT
    NULLIF(TRIM("OBJECTID"), '')::INTEGER AS accident_id,
    NULLIF(TRIM("LAND"), '')::INTEGER AS state_code,
    NULLIF(TRIM("BEZ"), '')::INTEGER AS district_code,
    NULLIF(TRIM("LOR_ab_2021"), '') AS lor_area,

    NULLIF(TRIM("JAHR"), '')::INTEGER AS accident_year,
    NULLIF(TRIM("UMONAT"), '')::INTEGER AS accident_month,
    NULLIF(TRIM("USTUNDE"), '')::INTEGER AS accident_hour,
    NULLIF(TRIM("UWOCHENTAG"), '')::INTEGER AS accident_weekday,

    NULLIF(TRIM("UKATEGORIE"), '')::INTEGER AS accident_category_code,
    NULLIF(TRIM("UART"), '')::INTEGER AS accident_type_code,
    NULLIF(TRIM("UTYP1"), '')::INTEGER AS accident_subtype_code,
    NULLIF(TRIM("ULICHTVERH"), '')::INTEGER AS light_condition_code,

    CASE WHEN TRIM("IstRad") = '1' THEN TRUE ELSE FALSE END AS involves_bicycle,
    CASE WHEN TRIM("IstPKW") = '1' THEN TRUE ELSE FALSE END AS involves_car,
    CASE WHEN TRIM("IstFuss") = '1' THEN TRUE ELSE FALSE END AS involves_pedestrian,
    CASE WHEN TRIM("IstKrad") = '1' THEN TRUE ELSE FALSE END AS involves_motorcycle,
    CASE WHEN TRIM("IstGkf") = '1' THEN TRUE ELSE FALSE END AS involves_goods_vehicle,
    CASE WHEN TRIM("IstSonstige") = '1' THEN TRUE ELSE FALSE END AS involves_other,

    NULLIF(TRIM("USTRZUSTAND"), '')::INTEGER AS road_condition_code,

    NULLIF(REPLACE(TRIM("LINREFX"), ',', '.'), '')::NUMERIC AS projected_x,
    NULLIF(REPLACE(TRIM("LINREFY"), ',', '.'), '')::NUMERIC AS projected_y,
    NULLIF(REPLACE(TRIM("XGCSWGS84"), ',', '.'), '')::NUMERIC AS longitude,
    NULLIF(REPLACE(TRIM("YGCSWGS84"), ',', '.'), '')::NUMERIC AS latitude
FROM accidents_raw;

-- Check cleaned rows
SELECT COUNT(*) AS cleaned_rows
FROM accidents_clean;