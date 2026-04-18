📊 Sales Data Warehouse (SSIS ETL + Power BI)
📌 Overview

This project demonstrates a complete ETL pipeline and data warehouse design using mock sales data.

The dataset is intentionally small and simplified, but the goal is to showcase:

Data warehousing concepts
ETL pipeline design using SSIS
Handling Slowly Changing Dimensions (SCD)
Incremental loading strategies
Building analytical dashboards in Power BI
🏗️ Data Warehouse Design

A star schema is implemented with one fact table and multiple dimensions:

Fact Table
Fact_Sales
Measures: totalPrice, quantity
Foreign keys to all dimensions
Dimensions
DimCustomer (SCD Type 2)
DimSalesman (SCD Type 2)
DimProduct (SCD Type 2)
DimDate
DimTime
⚙️ ETL Pipeline (SSIS)

The project includes 4 SSIS packages:

Customer Load
Salesman Load
Product Load
Fact Sales Load
Key Features
🔁 Slowly Changing Dimensions (Type 2)

Implemented in:

Customer
Salesman
Product

Tracks history using:

start_date
end_date
isCurrent
🔄 Incremental Fact Loading
A tracker table stores the last load date
Only new records are inserted:
WHERE LoadDate > LastLoadedDate
🔑 Surrogate Key Handling
Lookups used to replace business keys with surrogate keys
Ensures proper relationships in the fact table
📅 Date & Time Dimensions
Generated using SSIS Script Task
Includes attributes like:
Year, Month, Quarter
Day of Week
Hour, Minute, AM/PM

📊 Power BI Dashboard

The Power BI report includes 5 pages:

1. Revenue Analysis
Monthly revenue
Revenue by category
2. Sales Performance
Peak hours and days
Sales per salesman
3. Customer Insights
Top 3 customers
Customers by gender
4. Reward System
Top 3 salespeople (promotion candidates)
Top customer (discount eligibility)
5. Product Contribution
Contribution of each product to total sales

📈 Analytical Queries

A collection of SQL queries used to validate the data warehouse and generate insights



🚀 How to Run
Restore or create the source (OLTP) database
Open SSIS project in Visual Studio
Configure connection managers
Run packages in this order:
Dimensions first
Then Fact table
Open Power BI file and refresh
⚠️ Notes
This project uses mock/sample data for demonstration purposes
The focus is on design and implementation, not data volume or performance at scale
Large .bak files are excluded due to GitHub size limits
🧠 What This Project Shows
End-to-end ETL pipeline design
Star schema modeling
SCD Type 2 implementation
Incremental loading logic
Integration between SSIS and Power BI
