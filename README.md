# 📊 Enterprise E-Commerce Analytics

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-blue?logo=postgresql)
![SQL](https://img.shields.io/badge/SQL-Advanced-orange)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow?logo=powerbi)
![ETL](https://img.shields.io/badge/ETL-Pipeline-green)
![License](https://img.shields.io/badge/License-MIT-brightgreen)

An end-to-end Enterprise E-Commerce Analytics project built using **PostgreSQL**, **SQL**, **ETL pipelines**, and **Power BI** on the Brazilian Olist E-Commerce dataset.

The project demonstrates the complete data analytics lifecycle—from raw CSV files to database design, ETL, SQL analytics, business reporting, and interactive dashboards.

---

# 📌 Project Overview

This project simulates a real-world enterprise analytics solution for an e-commerce company.

The raw Olist Brazilian E-Commerce dataset is imported into PostgreSQL using an ETL pipeline, cleaned, transformed, and optimized for analytical reporting.

Business-focused SQL queries, analytical views, KPIs, and Power BI dashboards provide insights into sales, customers, sellers, payments, delivery performance, and product trends.

The project follows an end-to-end analytics workflow similar to what is implemented in modern Business Intelligence teams.

---

# 🛠 Tech Stack

- PostgreSQL
- SQL
- Power BI
- ETL Pipeline
- CSV Files
- Git & GitHub

---

# ✨ Features

- Enterprise PostgreSQL Database Design
- Complete ETL Pipeline
- Data Cleaning & Validation
- SQL Analytics
- Business KPI Analysis
- Window Functions
- Common Table Expressions (CTEs)
- Analytical Views
- Query Optimization
- Interactive Power BI Dashboards
- Architecture Documentation
- Database Schema
- ETL Workflow Documentation

---

# 🏗 Enterprise Architecture

The project follows a complete enterprise analytics workflow from raw data ingestion to business intelligence reporting.

<p align="center">
  <img src="diagrams/Enterprise Architecture.png" width="100%">
</p>

---

# 🗄 Database Schema

The PostgreSQL database is designed using a relational schema with normalized tables connected through primary and foreign keys.

<p align="center">
  <img src="diagrams/database_schema.png" width="100%">
</p>

---

# 🔄 ETL Workflow

The ETL process extracts raw CSV files, validates and cleans the data, transforms it into structured tables, and creates analytical views for reporting.

<p align="center">
  <img src="diagrams/etl_flow.png" width="100%">
</p>

---

# 📊 Power BI Dashboards

## Executive Dashboard

<p align="center">
  <img src="screenshots/05_dashboard/Executive_Dashboard.png" width="100%">
</p>

---

## Customer Analytics

<p align="center">
  <img src="screenshots/05_dashboard/Customer_Analytics.png" width="100%">
</p>

---

## Operations Dashboard

<p align="center">
  <img src="screenshots/05_dashboard/Operations_Dashboard.png" width="100%">
</p>

---

# 📂 Project Structure

```
Enterprise-Ecommerce-Analytics/
│
├── analysis/              # SQL analysis queries
├── cleaning/              # Data cleaning scripts
├── dashboards/            # Power BI dashboard (.pbix)
├── data/
│   └── raw/               # Raw Olist CSV datasets
├── database/              # Database creation scripts
├── diagrams/              # Architecture, Schema & ETL diagrams
├── documentation/         # Project documentation
├── etl/                   # ETL loading scripts
├── optimization/          # Query optimization
├── screenshots/           # SQL & Dashboard screenshots
├── views/                 # Analytical SQL views
│
├── README.md
└── LICENSE
```

---

# 📦 Dataset

**Dataset:** Brazilian Olist E-Commerce Dataset

The dataset contains information about:

- Customers
- Orders
- Order Items
- Products
- Sellers
- Payments
- Reviews
- Geolocation
- Category Translation

It contains nearly **100,000 orders** placed across Brazil and is widely used for SQL and Business Intelligence projects.

---

# 🧠 SQL Concepts Used

This project demonstrates a wide range of SQL concepts including:

- SELECT Statements
- Filtering & Sorting
- GROUP BY
- HAVING
- Aggregate Functions
- CASE Statements
- Joins
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Ranking Functions
- Views
- Indexing
- Constraints
- Data Cleaning
- Query Optimization

---

# 📈 Business Questions Solved

This project answers important business questions such as:

- What is the total revenue?
- Which months generate the highest revenue?
- Which products contribute the most revenue?
- Who are the top-performing sellers?
- Which states generate the highest sales?
- Which cities have the most customers?
- What is the average order value?
- Which payment methods are most popular?
- How efficient is the delivery process?
- Which customers spend the most?
- Which products underperform?
- How do revenue trends change over time?

---

# 📊 Dashboard Pages

### Executive Dashboard

- Revenue KPIs
- Monthly Revenue Trend
- Product Categories
- Top Sellers

### Customer Analytics

- Revenue by State
- Revenue by City
- Top Customers
- Average Order Value

### Operations Dashboard

- Payment Analysis
- Delivery Performance
- Review Distribution
- Operational KPIs

---

# 📌 Key KPIs

- Total Revenue
- Total Orders
- Total Customers
- Average Review Score
- Average Delivery Time
- Revenue by Category
- Revenue by State
- Revenue by Seller
- Payment Distribution
- Customer Spending

---

# 🚀 Installation & Setup

## Clone the Repository

```bash
git clone https://github.com/rudrasave/Enterprise-Ecommerce-Analytics.git
```

## Open the Project

```bash
cd Enterprise-Ecommerce-Analytics
```

## Database Setup

1. Install PostgreSQL.
2. Execute the scripts in the following order:

- create_database.sql
- create_tables.sql
- constraints.sql
- indexes.sql

## Load Data

Run the SQL scripts inside the **etl/** folder to import the CSV files.

## Perform Analysis

Execute the SQL scripts inside the **analysis/** folder.

## Power BI Dashboard

Open the following file in Power BI Desktop:

```
dashboards/Enterprise_Ecommerce_Analytics_Final.pbix
```

---

# 🚀 Future Improvements

- Deploy dashboards to Power BI Service
- Automate ETL using Apache Airflow
- Integrate live data sources
- Build real-time dashboards
- Add customer segmentation using Machine Learning
- Create forecasting models for sales prediction
- Optimize SQL queries for large-scale datasets

---

# 👨‍💻 Author

**Rudra Save**

Electronics & Telecommunication Engineering Student

Aspiring Data Analyst | SQL | PostgreSQL | Power BI | Python

📧 Email: your-email@example.com

💼 LinkedIn: https://www.linkedin.com/in/YOUR-LINKEDIN/

🐙 GitHub: https://github.com/rudrasave

---

# 📄 License

This project is licensed under the MIT License.

Feel free to use this project for learning and portfolio purposes.
