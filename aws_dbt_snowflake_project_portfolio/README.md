# Airbnb dbt Snowflake Project

This project is a dbt and Snowflake data transformation project.

It transforms Airbnb staging data into bronze, silver, and gold models.

The project is based on a beginner end-to-end data engineering tutorial, then cleaned up for a stronger portfolio structure.

## Tech Stack

- dbt
- Snowflake
- SQL
- Jinja macros

## Data Flow

The project follows a medallion-style flow:

```text
Snowflake staging sources
-> bronze raw models
-> silver cleaned models
-> gold dimension and fact models
-> final OBT reporting model
```

## Project Layers

### Bronze

The bronze layer loads raw source data from Snowflake staging tables.

Source tables:

- `staging.bookings`
- `staging.listings`
- `staging.hosts`

Bronze models:

- `bronze_bookings`
- `bronze_listings`
- `bronze_hosts`

### Silver

The silver layer cleans and prepares the data.

It creates:

- `silver_bookings`
- `silver_listings`
- `silver_hosts`

Examples of transformations:

- Calculates total booking amount.
- Adds price category tags.
- Cleans host names.
- Adds response rate quality labels.

### Gold

The gold layer creates business-ready tables.

Gold models:

- `dim_hosts`
- `dim_listings`
- `fct_bookings`
- `obt_airbnb_bookings`

The final `obt_airbnb_bookings` model joins bookings, listings, and hosts into one reporting table.

## dbt Features Used

- Sources
- Incremental models
- `ref()` and `source()`
- Custom macros
- Data tests
- Snapshots
- dbt docs
- Lineage graph

## Macros

This project includes reusable dbt macros:

- `tag` categorizes listing prices.
- `multiply` calculates rounded booking amounts.
- `trimmer` trims and formats text.
- `generate_schema_name` controls custom schema naming.

## Snapshots

Snapshots track changes over time for selected gold models.

Snapshot models:

- `snap_dim_hosts`
- `snap_dim_listings`
- `snap_fct_bookings`

## How To Run

Install dbt with the Snowflake adapter.

```bash
pip install dbt-snowflake
```

Create your local `profiles.yml` file using `profiles.example.yml` as a guide.

Then run:

```bash
dbt debug
dbt run
dbt snapshot
dbt test
```

Generate and open dbt docs:

```bash
dbt docs generate
dbt docs serve
```

## Recommended Screenshots

Add these screenshots to the README:

- dbt lineage graph showing `staging -> bronze -> silver -> dim/fact -> OBT`
- Snowflake schemas showing bronze, silver, and gold tables
- Query preview of `obt_airbnb_bookings`
- Terminal output showing successful `dbt run` and `dbt test`

## Lineage

The cleaned lineage should show this main flow:

```text
staging.bookings -> bronze_bookings -> silver_bookings -> fct_bookings
staging.listings -> bronze_listings -> silver_listings -> dim_listings
staging.hosts    -> bronze_hosts    -> silver_hosts    -> dim_hosts

fct_bookings + dim_listings + dim_hosts -> obt_airbnb_bookings
```
