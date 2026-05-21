-- ============================================================
-- Berlin Road Safety Analytics
-- File: 01_create_database_schema.sql
-- Purpose: Create raw and cleaned accident tables
-- ============================================================

DROP TABLE IF EXISTS accidents_clean CASCADE;
DROP TABLE IF EXISTS accidents_raw CASCADE;

-- Raw table: columns kept close to the original CSV structure.
-- All columns are TEXT first to make CSV import safer.
CREATE TABLE accidents_raw (
    "OBJECTID" TEXT,
    "LAND" TEXT,
    "BEZ" TEXT,
    "LOR_ab_2021" TEXT,
    "JAHR" TEXT,
    "UMONAT" TEXT,
    "USTUNDE" TEXT,
    "UWOCHENTAG" TEXT,
    "UKATEGORIE" TEXT,
    "UART" TEXT,
    "UTYP1" TEXT,
    "ULICHTVERH" TEXT,
    "IstRad" TEXT,
    "IstPKW" TEXT,
    "IstFuss" TEXT,
    "IstKrad" TEXT,
    "IstGkf" TEXT,
    "IstSonstige" TEXT,
    "USTRZUSTAND" TEXT,
    "LINREFX" TEXT,
    "LINREFY" TEXT,
    "XGCSWGS84" TEXT,
    "YGCSWGS84" TEXT
);

-- Clean analytical table with readable column names and proper data types.
CREATE TABLE accidents_clean (
    accident_id INTEGER PRIMARY KEY,
    state_code INTEGER,
    district_code INTEGER,
    lor_area TEXT,

    accident_year INTEGER,
    accident_month INTEGER,
    accident_hour INTEGER,
    accident_weekday INTEGER,

    accident_category_code INTEGER,
    accident_type_code INTEGER,
    accident_subtype_code INTEGER,
    light_condition_code INTEGER,

    involves_bicycle BOOLEAN,
    involves_car BOOLEAN,
    involves_pedestrian BOOLEAN,
    involves_motorcycle BOOLEAN,
    involves_goods_vehicle BOOLEAN,
    involves_other BOOLEAN,

    road_condition_code INTEGER,

    projected_x NUMERIC,
    projected_y NUMERIC,
    longitude NUMERIC,
    latitude NUMERIC
);

-- Useful indexes for faster analysis queries.
CREATE INDEX idx_accidents_clean_year 
ON accidents_clean(accident_year);

CREATE INDEX idx_accidents_clean_district 
ON accidents_clean(district_code);

CREATE INDEX idx_accidents_clean_hour 
ON accidents_clean(accident_hour);

CREATE INDEX idx_accidents_clean_weekday 
ON accidents_clean(accident_weekday);

CREATE INDEX idx_accidents_clean_coordinates 
ON accidents_clean(longitude, latitude);