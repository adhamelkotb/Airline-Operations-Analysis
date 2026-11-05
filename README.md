# Airline Operations Analysis

**Tools:** SQL (PostgreSQL) · Tableau\
**Project type:** Aviation & Flight Operations case study

## Project Overview

This project explores flight operations data for a global airline
network. SQL was used to combine information from flight, aircraft,
airport, and crew tables into an analysis-ready dataset. Tableau was
then used to build a dashboard for exploring flight activity, airport
activity, aircraft information, and crew-related delays.

## Business Questions

The analysis was designed to explore questions including:

-   How is flight activity distributed across the year?
-   Which airports handle the most flights?
-   Which aircraft models are used most frequently?
-   Are some pilots or crew members recording higher average delays?
-   What operational patterns can be explored by airport, role, aircraft
    model, and delay category?

## Data Preparation and SQL

The SQL query combines data from the following tables:

-   `flights_fact`
-   `aircraft`
-   `airports` (used for origin, destination, and crew base)
-   `flight_crew_fact`
-   `crews`

The query uses `LEFT JOIN`, `CONCAT`, date/time extraction, calculated
flight duration, and a `CASE` expression to classify delays.

The resulting dataset includes flight ID, origin and destination,
aircraft model, departure month, aircraft age, crew member, crew role,
crew base, flight duration, delay minutes, and delay category.

## Data Modeling and Validation

The case study includes a data-modeling stage to understand
relationships between source tables and prepare a combined analytical
structure.

Validation activities documented in the case study include:

-   Checking join keys and table relationships.
-   Checking NULL and missing values.
-   Checking duplicates in relation to the dataset's grain.
-   Cross-checking dashboard KPIs and aggregations.
-   Reviewing unexpected patterns, anomalies, and calculated-field
    logic.

A one-to-many relationship exists between flights and crew assignments.
Tableau FIXED LOD calculations were used for flight-level calculations
while retaining crew-level detail in the combined dataset.

## Dashboard Preview

![Airline Operations Analysis dashboard](images/airline_dashboard.png)

The Tableau dashboard contains:

-   **Flights by country:** geographic distribution of flights.
-   **Flights by month:** flight volume by departure month.
-   **Flights by airport:** comparison of flight volume across airports.
-   **Aircraft data:** aircraft model, aircraft age, total flights, and
    flight hours.
-   **Delay per pilot:** average delay by crew member, with dashboard
    filters for airport, role, aircraft model, and delay category.

## Tools and Techniques

-   **SQL:** joins, date/time functions, string concatenation,
    conditional logic.
-   **Tableau:** dashboard design, filters, calculated fields, and FIXED
    LOD expressions.
-   **Analytics workflow:** data preparation, relationship/grain
    awareness, and KPI validation.

## Notes

This repository documents the project workflow and dashboard output. The
dashboard screenshot is provided as a static preview; it is not an
interactive Tableau Public link.

Before making this repository public, confirm that the dataset,
screenshots, and case-study materials are permitted for public sharing
and do not contain confidential or personal information.
