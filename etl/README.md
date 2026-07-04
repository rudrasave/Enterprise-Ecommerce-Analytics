# ETL (Extract, Transform, Load)

This folder contains SQL scripts responsible for loading validated data from the **staging** schema into the **production** schema.

## Workflow

CSV Files
↓
Staging Tables
↓
Data Quality Validation
↓
ETL Load Scripts
↓
Production Tables
↓
Analytics Layer

## Scripts

| Script | Purpose |
|---------|---------|
| load_customers.sql | Load customer data into production |
| load_orders.sql | Load order data into production |
| load_products.sql | Load product data into production |
| load_order_items.sql | Load order item data into production |
| load_payments.sql | Load payment data into production |
| load_reviews.sql | Load review data into production |
| load_sellers.sql | Load seller data into production |
| load_geolocation.sql | Load geolocation data |
| load_category_translation.sql | Load category translation data |