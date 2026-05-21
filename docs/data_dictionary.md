# Data Dictionary

## Source Dataset

Official Berlin road traffic accident dataset for 2021.

## Raw Columns

| Raw Column | Clean Column | Meaning |
|---|---|---|
| OBJECTID | accident_id | Unique accident record ID |
| LAND | state_code | State code |
| BEZ | district_code | Berlin district code |
| LOR_ab_2021 | lor_area | LOR planning area code |
| JAHR | accident_year | Accident year |
| UMONAT | accident_month | Accident month |
| USTUNDE | accident_hour | Accident hour |
| UWOCHENTAG | accident_weekday | Accident weekday |
| UKATEGORIE | accident_category_code | Accident category code |
| UART | accident_type_code | Accident type code |
| UTYP1 | accident_subtype_code | Accident subtype code |
| ULICHTVERH | light_condition_code | Light condition code |
| IstRad | involves_bicycle | Bicycle involved |
| IstPKW | involves_car | Car involved |
| IstFuss | involves_pedestrian | Pedestrian involved |
| IstKrad | involves_motorcycle | Motorcycle involved |
| IstGkf | involves_goods_vehicle | Goods vehicle involved |
| IstSonstige | involves_other | Other road user involved |
| USTRZUSTAND | road_condition_code | Road condition code |
| LINREFX | projected_x | Projected X coordinate |
| LINREFY | projected_y | Projected Y coordinate |
| XGCSWGS84 | longitude | Longitude |
| YGCSWGS84 | latitude | Latitude |

## Tables

### `accidents_raw`

Raw imported CSV table. All fields are stored as text to prevent import errors.

### `accidents_clean`

Clean analytical table with readable column names and proper data types.