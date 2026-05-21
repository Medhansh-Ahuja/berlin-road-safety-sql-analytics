# Project Notes

## Project Goal

The goal of this project is to analyze Berlin road traffic accidents using SQL and PostgreSQL.

The project follows a complete analytics workflow:

1. Import raw CSV data
2. Create a raw staging table
3. Transform raw data into a clean analytical table
4. Run data quality checks
5. Write SQL analysis queries
6. Create reusable SQL views
7. Export final results as CSV files

## Data Quality Summary

The cleaning checks confirmed:

- Raw table row count: 11,267
- Clean table row count: 11,267
- Duplicate accident IDs: 0
- Missing coordinates: 0
- Invalid Berlin coordinate records: 0

## Main Output Files

The final outputs are stored in the `outputs/` folder:

- `district_accident_summary.csv`
- `hourly_accident_patterns.csv`
- `monthly_accident_trends.csv`
- `vehicle_involvement_summary.csv`
- `vulnerable_road_user_accidents.csv`
- `accident_map_export.csv`

## Next Improvement Ideas

- Add PostGIS spatial hotspot analysis
- Create a Power BI or Tableau dashboard
- Add multi-year accident comparison
- Join with population density or cycling infrastructure data