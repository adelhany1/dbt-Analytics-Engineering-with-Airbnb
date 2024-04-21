Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

- # Analytics Engineering Project: Exploring Airbnb Data with dbt and Snowflake

Welcome to my Analytics Engineering project repository! In this project, I leveraged dbt (data build tool) and Snowflake to conduct a detailed analysis of Airbnb data, exploring the impact of lunar cycles on guest reviews. Let me take you through the key components and insights gained from this project.

## Project Overview

The goal of this project was to analyze Airbnb datasets (`raw_listings`, `raw_reviews`, `raw_hosts`) using dbt and Snowflake to understand whether guest mood, as reflected in reviews, correlates with the occurrence of a full moon.

## Key Components and Techniques Used

### 1. Staging Layer (`src`)

- Transformed raw data into structured views (`src_listings`, `src_reviews`, `src_hosts`) for initial cleansing and renaming.
- Utilized different materialization methods (table, view, incremental table, ephemeral table) for efficient data processing.

### 2. Core Layer (`dim`, `fct`)

- Developed dimension tables (`dim_listings_cleansed`, `dim_hosts_cleansed`, `dim_listings_w_hosts`) using SQL queries within dbt models.
- Organized and transformed data into meaningful dimensions and facts to support analysis.

### 3. Mart Layer

- Explored the hypothesis with `mart_fullmoon_reviews` to analyze guest reviews around full moon dates.
- Linked review dates with full moon dates to investigate potential correlations.

### 4. Advanced Techniques and Tools

- Implemented YAML configuration (`sources.yml`) for managing data sources.
- Created custom tests (`dim_listings_minimum_nights.sql`, `consistent_created_at.sql`) and macros (`no_nulls_in_columns.sql`, `positive_value.sql`) to ensure data quality and consistency.
- Leveraged snapshotting to track changes at the source level (`raw_listings`, `raw_hosts`).

### 5. BI Dashboard Integration

- Connected with Preset for BI visualization, enabling the creation of interactive charts and visualizations based on the `mart_fullmoon_reviews` dataset.

## Results and Insights

Through this project, I aimed to prove or reject the hypothesis that a full moon affects guest mood, as reflected in their reviews. The analysis conducted provides valuable insights into the relationship between lunar cycles and guest experiences on Airbnb.

## Getting Started

To replicate or further explore this project:
1. Ensure you have dbt and Snowflake set up.
2. Clone this repository and navigate to the project directory.
3. Run dbt commands to execute the models, tests, and generate documentation.

## Conclusion

This project demonstrates the power of dbt and Snowflake in handling large-scale datasets and conducting sophisticated analytics. I'm excited to share my learnings and insights with the community and welcome any feedback or collaboration opportunities.
