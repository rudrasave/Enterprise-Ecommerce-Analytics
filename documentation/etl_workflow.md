# ETL Workflow

## Overview

The project follows a three-layer architecture to transform raw e-commerce data into analytics-ready datasets.

```
CSV Files
      │
      ▼
Staging Schema
      │
Data Quality Validation
      │
      ▼
Production Schema
      │
Analytics Views
      │
      ▼
SQL Analysis & Power BI Dashboard
```

---

## Step 1 - Data Ingestion

Raw CSV files are imported into the **staging** schema without modification.

Tables:

- stg_customers
- stg_orders
- stg_products
- stg_order_items
- stg_payments
- stg_reviews
- stg_sellers
- stg_geolocation
- stg_category_translation

---

## Step 2 - Data Validation

The following validations are performed before loading data into production:

- Duplicate record detection
- NULL value validation
- Foreign Key validation
- Record count verification
- Data type verification

---

## Step 3 - Production Load

Validated data is inserted into the **production** schema.

The production schema contains clean and relational business tables.

---

## Step 4 - Analytics Layer

SQL Views are created inside the **analytics** schema.

Views include:

- sales_summary
- customer_summary
- product_summary
- seller_summary
- payment_summary
- delivery_summary
- review_summary

---

## Step 5 - Reporting

The analytics views are consumed by:

- SQL Business Analysis
- Window Functions
- CTE Analysis
- Power BI Dashboard