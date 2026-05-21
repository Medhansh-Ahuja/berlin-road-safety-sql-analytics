-- ============================================================
-- Berlin Road Safety Analytics
-- File: 06_export_outputs.sql
-- Purpose: Export analytical views as CSV files
-- ============================================================

\copy (SELECT * FROM vw_district_accident_summary) TO 'outputs/district_accident_summary.csv' WITH CSV HEADER

\copy (SELECT * FROM vw_hourly_accident_patterns) TO 'outputs/hourly_accident_patterns.csv' WITH CSV HEADER

\copy (SELECT * FROM vw_monthly_accident_trends) TO 'outputs/monthly_accident_trends.csv' WITH CSV HEADER

\copy (SELECT * FROM vw_vehicle_involvement_summary) TO 'outputs/vehicle_involvement_summary.csv' WITH CSV HEADER

\copy (SELECT * FROM vw_vulnerable_road_user_accidents) TO 'outputs/vulnerable_road_user_accidents.csv' WITH CSV HEADER

\copy (SELECT * FROM vw_accident_map_export) TO 'outputs/accident_map_export.csv' WITH CSV HEADER