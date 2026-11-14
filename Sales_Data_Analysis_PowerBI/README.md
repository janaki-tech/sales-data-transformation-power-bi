# Sales Data Analysis & Transformation Using Power BI

## Project overview
This project demonstrates an ETL (Extract, Transform, Load) workflow for a sales dataset using **Power BI Power Query**. The raw sample data includes intentional data-quality issues so the cleaning steps can be demonstrated.

## Objectives
- Import sales data from CSV into Power BI.
- Inspect and correct blank values, duplicate records, and incorrect data types.
- Create a curated, analysis-ready sales table.
- Build a sales report with useful business measures and visuals.

## Repository structure
```text
Sales_Data_Analysis_PowerBI/
├── data/
│   └── sales_raw.csv
├── power_query/
│   └── Sales_Cleaning_Query.m
├── documentation/
│   ├── data_dictionary.md
│   └── report_guide.md
├── dax/
│   └── measures.dax
└── README.md
```

## Dataset
`data/sales_raw.csv` is a **synthetic sample dataset created for demonstration**. It is not company or customer data. A few rows intentionally contain missing values, an invalid numeric value, or a duplicate record.

## How to use
1. Download or clone this repository.
2. Open **Power BI Desktop**.
3. Select **Home → Get data → Text/CSV** and import `data/sales_raw.csv`.
4. Choose **Transform Data** to open Power Query.
5. Use the steps in `power_query/Sales_Cleaning_Query.m` as a reference, or open **Advanced Editor** and adapt the query. Update the file path to the location where you saved the CSV.
6. Apply the transformations, then select **Close & Apply**.
7. Create the measures in `dax/measures.dax`.
8. Build visuals using the suggestions in `documentation/report_guide.md`.

## Data cleaning performed
- Trimmed and cleaned text fields.
- Replaced blank text values with `Unknown`.
- Converted `OrderDate`, `Quantity`, `UnitPrice`, and `Sales` to appropriate data types.
- Replaced invalid numeric values with null.
- Removed duplicate `OrderID` records.
- Recalculated `Sales` as `Quantity × UnitPrice` after cleaning.

## Suggested report visuals
- KPI cards: Total Sales, Total Orders, Total Quantity, Average Order Value.
- Column chart: Sales by Category.
- Bar chart: Sales by Region.
- Line chart: Sales by Month.
- Table: Product, Quantity, and Sales.

## Important note
This repository contains the sample CSV, Power Query M script, DAX measure examples, and documentation. It does **not** contain a `.pbix` report file. Open the CSV in Power BI Desktop and save your completed report as `Sales_Data_Analysis.pbix` before uploading it if you want the interactive Power BI report included.

## Resume project description
**Sales Data Analysis & Transformation Using Power BI**
- Performed ETL steps on sales datasets using Power Query.
- Identified and corrected data-quality issues, including blank values, duplicate records, and incorrect data types.
- Prepared curated, analysis-ready data for business reporting and visualization.
