# Berlin Road Safety Analytics — SQL Portfolio Project

## Project Overview

This project analyzes road traffic accidents in Berlin using PostgreSQL and SQL.

The goal is to identify accident patterns by time, district, road-user involvement, and accident category. The project follows a complete SQL analytics workflow: raw data loading, data cleaning, data quality checks, analytical queries, reusable SQL views, and exported CSV outputs.

The project is designed as a portfolio project to demonstrate practical SQL, PostgreSQL, data cleaning, and analytics skills using real city-level open data.

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
8. Which districts have higher bicycle and pedestrian accident involvement?

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
- `.gitignore` — Git ignore rules
- `data/raw/` — original Berlin accident CSV file
- `docs/data_dictionary.md` — explanation of raw and cleaned columns
- `docs/project_notes.md` — project notes and data quality summary
- `outputs/` — exported CSV results from SQL views
- `sql/01_create_database_schema.sql` — creates raw and clean tables
- `sql/02_load_data.sql` — transforms raw data into the clean analytical table
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

This confirms that the raw CSV was successfully imported and transformed into a clean analytical table without row loss.

---

## Key Findings

Berlin recorded 11,267 road traffic accident records in the 2021 dataset.

Mitte had the highest number of accidents, with 1,761 accidents. This represents 15.63% of all recorded accidents in the dataset.

The next highest accident districts were Charlottenburg-Wilmersdorf with 1,398 accidents and Friedrichshain-Kreuzberg with 1,107 accidents.

The districts with the lowest total accident counts were Lichtenberg with 619 accidents and Marzahn-Hellersdorf with 538 accidents.

Accident activity was highest during the afternoon commuting period. The peak accident hour was 15:00, with 1,031 accidents.

The next highest accident hours were 16:00 with 951 accidents and 17:00 with 915 accidents.

Late-night and early-morning hours had the lowest accident counts. The lowest accident hour was 03:00, with only 50 accidents.

Car involvement was the most common road-user category, appearing in 9,038 accident records.

Bicycle involvement appeared in 4,251 accident records, showing that cyclists are a major road-user group in Berlin accident data.

Pedestrian involvement appeared in 1,460 accident records, while motorcycle involvement appeared in 1,656 records.

Goods vehicles appeared in 342 accident records.

The road-user involvement counts are not mutually exclusive because one accident can involve multiple road-user types.

---

## District Accident Summary

The top districts by total accident count were:

| Rank | District | Total Accidents | Share of Total |
|---|---|---:|---:|
| 1 | Mitte | 1,761 | 15.63% |
| 2 | Charlottenburg-Wilmersdorf | 1,398 | 12.41% |
| 3 | Friedrichshain-Kreuzberg | 1,107 | 9.83% |
| 4 | Tempelhof-Schöneberg | 1,059 | 9.40% |
| 5 | Pankow | 1,011 | 8.97% |

---

## Hourly Accident Pattern

The accident pattern shows a clear increase during daytime and commuting hours.

| Hour | Total Accidents | Share of Total |
|---:|---:|---:|
| 15:00 | 1,031 | 9.15% |
| 16:00 | 951 | 8.44% |
| 17:00 | 915 | 8.12% |
| 14:00 | 895 | 7.94% |
| 18:00 | 788 | 6.99% |

The lowest accident counts were recorded during early morning hours:

| Hour | Total Accidents |
|---:|---:|
| 03:00 | 50 |
| 04:00 | 56 |
| 02:00 | 58 |
| 01:00 | 80 |

---

## Road-User Involvement Summary

| Road-User Type | Accident Records |
|---|---:|
| Car | 9,038 |
| Bicycle | 4,251 |
| Other | 1,848 |
| Motorcycle | 1,656 |
| Pedestrian | 1,460 |
| Goods Vehicle | 342 |

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

## How to Run This Project

1. Create a PostgreSQL database named `berlin_road_safety`.

2. Run the SQL files in this order:

- `sql/01_create_database_schema.sql`
- Import the raw CSV into `accidents_raw`
- `sql/02_load_data.sql`
- `sql/03_cleaning_checks.sql`
- `sql/04_analysis_queries.sql`
- `sql/05_views.sql`
- `sql/06_export_outputs.sql`

3. Review the exported CSV files in the `outputs/` folder.

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
