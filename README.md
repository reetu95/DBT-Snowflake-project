# Airbnb dbt Snowflake Project

This repository contains a dbt and Snowflake project built with Airbnb data.

It has two versions:

1. A tutorial implementation.
2. A portfolio extension that improves the project structure and lineage.

The project shows how raw Airbnb data can be transformed into clean analytics-ready tables using dbt.

## Project Folders

```text
aws_dbt_snowflake_project/
```

This is the tutorial version.

It follows the beginner end-to-end data engineering tutorial:

[Airbnb End-To-End Data Engineering Project | DBT + Snowflake + AWS](https://www.youtube.com/watch?v=3SZSDKEZqoA)

```text
aws_dbt_snowflake_project_portfolio/
```

This is my extended portfolio version.

I refactored the dbt models to make the lineage cleaner and the data model easier to explain.

## Tech Stack

- dbt
- Snowflake
- SQL
- Jinja macros
- AWS concepts from the tutorial

## Tutorial Version

The tutorial project demonstrates the main dbt concepts.

It includes:

- Snowflake staging sources
- Bronze, silver, and gold models
- Incremental models
- Jinja macros
- Custom tests
- Snapshots
- dbt docs
- dbt lineage graph

The tutorial flow creates an OBT model and then creates helper models for bookings, listings, and hosts.

That flow is useful for learning dbt features.

## Portfolio Extension

I extended the tutorial project to make the final data model cleaner.

The improved flow is:

```text
staging sources
-> bronze raw models
-> silver cleaned models
-> gold dimension and fact models
-> final OBT reporting model
```

The portfolio version uses this lineage:

```text
staging.bookings -> bronze_bookings -> silver_bookings -> fct_bookings
staging.listings -> bronze_listings -> silver_listings -> dim_listings
staging.hosts    -> bronze_hosts    -> silver_hosts    -> dim_hosts

fct_bookings + dim_listings + dim_hosts -> obt_airbnb_bookings
```

## What I Changed In The Extension

- Refactored the gold layer into dimension, fact, and mart models.
- Created `dim_hosts`, `dim_listings`, and `fct_bookings`.
- Created `obt_airbnb_bookings` as the final reporting table.
- Replaced hardcoded Snowflake table references with dbt `ref()` calls.
- Updated snapshots to track the new gold models.
- Added model descriptions and schema tests.
- Added a custom data quality test for negative booking amounts and fees.
- Moved practice SQL files out of the active dbt graph.
- Added a safer `profiles.example.yml` file.
- Improved the README and documentation structure.

## dbt Features Used

- `source()`
- `ref()`
- Incremental models
- Custom macros
- Generic tests
- Singular tests
- Relationships tests
- Snapshots
- dbt docs
- Lineage graph

## Data Quality

The portfolio version includes 27 dbt tests.

Current result:

```text
PASS=27 WARN=0 ERROR=0
```

## How To Run The Portfolio Version

Go to the portfolio project:

```bash
cd aws_dbt_snowflake_project_portfolio
```

Check the Snowflake connection:

```bash
dbt debug
```

Run the models:

```bash
dbt run --full-refresh
```

Run snapshots:

```bash
dbt snapshot
```

Run tests:

```bash
dbt test
```

Generate dbt docs:

```bash
dbt docs generate
```

Serve dbt docs:

```bash
dbt docs serve --port 8081
```

Open:

```text
http://localhost:8081
```

## Screenshots

Screenshots will be added in a separate update.

Planned screenshots:

- Tutorial lineage before refactor
- Portfolio lineage after refactor
- `dbt run --full-refresh` success
- `dbt test` success
- Gold tables created in Snowflake
- Final `OBT_AIRBNB_BOOKINGS` table preview

## Final Output

The final reporting model is:

```text
obt_airbnb_bookings
```

It combines booking, listing, and host data into one analytics-ready table.
