# Berlin Road Safety Analytics — SQL Portfolio Project

## Project Overview

This project analyzes road traffic accidents in Berlin using PostgreSQL and SQL.

The goal is to identify accident patterns by time, district, road-user involvement, and accident category. The project follows a complete SQL analytics workflow: raw data loading, data cleaning, data quality checks, analytical queries, reusable SQL views, and exported CSV outputs.

---

## Business Questions

This project answers the following questions:

1. How many road traffic accidents occurred in Berlin in 2021?
2. Which months had the highest accident counts?
3. Which hours of the day had the most accidents?
4. Which Berlin districts recorded the most accidents?
5. How do weekday and weekend accident patterns differ?
6. How many accidents involved bicycles, pedestrians, cars, motorcycles, and goods vehicles?
7. Which LOR planning areas appear as high-risk accident zones?

---

## Tools Used

- PostgreSQL
- SQL
- DBeaver
- VS Code
- Git
- GitHub

---

## Dataset

The project uses an official Berlin road traffic accident dataset for 2021.

The dataset includes:

- Accident year, month, weekday, and hour
- Berlin district code
- LOR planning area code
- Accident category and accident type codes
- Road-user involvement flags
- Longitude and latitude coordinates

The raw CSV file uses a semicolon delimiter and was imported into PostgreSQL using `\copy`.

---

## Database Workflow

### 1. Raw Data Loading

The original CSV file is imported into the `accidents_raw` table.

All raw fields are first stored as text. This makes the CSV import safer and avoids errors caused by mixed formats or unexpected values.

### 2. Data Cleaning

The raw data is transformed into the `accidents_clean` table.

Cleaning steps include:

- Converting numeric fields into integer or numeric data types
- Converting road-user involvement columns into boolean values
- Converting coordinate values into numeric longitude and latitude fields
- Renaming raw German column names into readable English column names

### 3. Data Quality Checks

The project checks:

- Row count consistency between raw and clean tables
- Duplicate accident IDs
- Missing coordinates
- Invalid coordinate ranges
- Invalid months
- Invalid hours
- Invalid weekday values
- Vehicle involvement totals

### 4. Analysis Queries

The main analysis includes:

- Accidents by month
- Accidents by hour
- Peak accident hours
- Weekday versus weekend accident counts
- Accidents by Berlin district
- Accident category and type distributions
- Bicycle accidents by district
- Pedestrian accidents by district
- High-risk LOR planning areas

### 5. Analytical Views

Reusable SQL views were created for:

- Monthly accident trends
- Hourly accident patterns
- District accident summary
- Vehicle involvement summary
- Vulnerable road-user accidents
- Accident map export

---

## Repository Structure

- `README.md` — project overview and documentation
- `data/raw/` — original Berlin accident CSV file
- `docs/data_dictionary.md` — explanation of raw and cleaned columns
- `docs/project_notes.md` — project notes and data quality summary
- `outputs/` — exported CSV results from SQL views
- `sql/01_create_database_schema.sql` — creates raw and clean tables
- `sql/02_load_data.sql` — transforms raw data into clean analytical table
- `sql/03_cleaning_checks.sql` — performs data quality checks
- `sql/04_analysis_queries.sql` — contains main SQL analysis queries
- `sql/05_views.sql` — creates reusable analytical views
- `sql/06_export_outputs.sql` — exports SQL view outputs as CSV files

---

## Output Files

The project exports the following result files into the `outputs/` folder:

- `district_accident_summary.csv`
- `hourly_accident_patterns.csv`
- `monthly_accident_trends.csv`
- `vehicle_involvement_summary.csv`
- `vulnerable_road_user_accidents.csv`
- `accident_map_export.csv`

---

## Key Data Quality Results

The data quality checks confirmed:

- Raw table rows: 11,267
- Clean table rows: 11,267
- Duplicate accident IDs: 0
- Missing coordinates: 0
- Invalid Berlin coordinate records: 0

---

## Key SQL Skills Demonstrated

This project demonstrates:

- PostgreSQL database setup
- CSV import using `\copy`
- Raw-to-clean data transformation
- Data type conversion
- Data quality validation
- Aggregations
- `CASE` statements
- Common Table Expressions
- Window functions
- Ranking queries
- SQL views
- Exporting SQL results to CSV
- GitHub project documentation

---

## Future Improvements

Potential extensions include:

- Add PostGIS for spatial hotspot analysis
- Create a Power BI, Tableau, or Streamlit dashboard
- Add multi-year accident comparison
- Join accident data with population density
- Join accident data with cycling infrastructure data
- Build a district-level road safety risk index

---

## Project Status

The SQL pipeline is complete.

Completed steps:

- PostgreSQL database created
- Raw CSV imported
- Clean analytical table created
- Data quality checks performed
- SQL analysis queries written
- Analytical views created
- Output CSV files exported
- Project uploaded to GitHub