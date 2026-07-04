/*
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Database: PostgreSQL
Purpose : Data Quality Assessment
===========================================================
*/
/*=========================================================
SECTION 1 : ROW COUNT VALIDATION
Purpose:
Verify that all CSV records were successfully imported
into the staging tables.
=========================================================*/

SELECT 'Customers' AS table_name, COUNT(*) AS row_count
FROM staging.stg_customers

UNION ALL

SELECT 'Orders', COUNT(*)
FROM staging.stg_orders

UNION ALL

SELECT 'Order Items', COUNT(*)
FROM staging.stg_order_items

UNION ALL

SELECT 'Products', COUNT(*)
FROM staging.stg_products

UNION ALL

SELECT 'Payments', COUNT(*)
FROM staging.stg_payments

UNION ALL

SELECT 'Reviews', COUNT(*)
FROM staging.stg_reviews

UNION ALL

SELECT 'Sellers', COUNT(*)
FROM staging.stg_sellers

UNION ALL

SELECT 'Geolocation', COUNT(*)
FROM staging.stg_geolocation

UNION ALL

SELECT 'Category Translation', COUNT(*)
FROM staging.stg_category_translation;

-- Status : PASSED

/*===========================================================
SECTION 2 : DUPLICATE PRIMARY KEY VALIDATION

Description:
Ensure all business entities expected to have
unique identifiers contain no duplicate values.

===========================================================*/

-- ==========================================
-- Query 2.1 : Duplicate Customer IDs
--
-- Purpose:
-- Verify customer_id is unique.
--
-- Expected Result:
-- 0 rows
--
-- Business Rule:
-- customer_id will become the PRIMARY KEY
-- in the production schema.
-- ==========================================

SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM staging.stg_customers
GROUP BY customer_id
HAVING COUNT(*) > 1;



-- ==========================================
-- Query 2.2 : Duplicate Order IDs
--
-- Purpose:
-- Verify order_id is unique.
--
-- Expected Result:
-- 0 rows
--
-- Business Rule:
-- order_id is the business identifier
-- for every order.
-- ==========================================

SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM staging.stg_orders
GROUP BY order_id
HAVING COUNT(*) > 1;



-- Check Product IDs

SELECT
    product_id,
    COUNT(*) AS duplicate_count
FROM staging.stg_products
GROUP BY product_id
HAVING COUNT(*) > 1;



-- Check Seller IDs

SELECT
    seller_id,
    COUNT(*) AS duplicate_count
FROM staging.stg_sellers
GROUP BY seller_id
HAVING COUNT(*) > 1;

/*
===========================================================
SECTION 2 CONCLUSION

Result:
No duplicate Customer IDs found.
No duplicate Order IDs found.
No duplicate Product IDs found.
No duplicate Seller IDs found.

Conclusion:
These tables are ready for PRIMARY KEY
constraints in the production schema.

===========================================================
*/

-- Status : PASSED

/*===========================================================
SECTION 3 : MISSING VALUE ANALYSIS

Description:
Identify NULL values across important business columns.
This assessment helps determine which columns require
cleaning before loading data into the production schema.

===========================================================*/

-- ==========================================
-- Query 3.1 : Customers
--
-- Purpose:
-- Verify mandatory customer fields.
--
-- Expected Result:
-- Ideally all values should be zero.
-- ==========================================

SELECT
    COUNT(*) AS total_records,

    COUNT(*) FILTER (WHERE customer_id IS NULL) AS customer_id_nulls,

    COUNT(*) FILTER (WHERE customer_unique_id IS NULL) AS customer_unique_id_nulls,

    COUNT(*) FILTER (WHERE customer_zip_code_prefix IS NULL) AS zip_code_nulls,

    COUNT(*) FILTER (WHERE customer_city IS NULL) AS city_nulls,

    COUNT(*) FILTER (WHERE customer_state IS NULL) AS state_nulls

FROM staging.stg_customers;



-- ==========================================
-- Query 3.2 : Orders
--
-- Purpose:
-- Check NULL values in important order dates.
--
-- Expected Result:
-- customer_id should never be NULL.
-- Some timestamps may legitimately be NULL
-- depending on order status.
-- ==========================================

SELECT
    COUNT(*) AS total_orders,

    COUNT(*) FILTER (WHERE order_id IS NULL) AS order_id_nulls,

    COUNT(*) FILTER (WHERE customer_id IS NULL) AS customer_id_nulls,

    COUNT(*) FILTER (WHERE order_status IS NULL) AS status_nulls,

    COUNT(*) FILTER (WHERE order_purchase_timestamp IS NULL) AS purchase_time_nulls,

    COUNT(*) FILTER (WHERE order_approved_at IS NULL) AS approved_time_nulls,

    COUNT(*) FILTER (WHERE order_delivered_carrier_date IS NULL) AS carrier_delivery_nulls,

    COUNT(*) FILTER (WHERE order_delivered_customer_date IS NULL) AS customer_delivery_nulls,

    COUNT(*) FILTER (WHERE order_estimated_delivery_date IS NULL) AS estimated_delivery_nulls

FROM staging.stg_orders;



-- ==========================================
-- Query 3.3 : Products
--
-- Purpose:
-- Check product master data completeness.
--
-- Expected Result:
-- Product ID should never be NULL.
-- Some descriptive attributes may contain NULLs.
-- ==========================================

SELECT
    COUNT(*) AS total_products,

    COUNT(*) FILTER (WHERE product_id IS NULL) AS product_id_nulls,

    COUNT(*) FILTER (WHERE product_category_name IS NULL) AS category_nulls,

    COUNT(*) FILTER (WHERE product_name_lenght IS NULL) AS product_name_length_nulls,

    COUNT(*) FILTER (WHERE product_description_lenght IS NULL) AS description_length_nulls,

    COUNT(*) FILTER (WHERE product_photos_qty IS NULL) AS photos_nulls,

    COUNT(*) FILTER (WHERE product_weight_g IS NULL) AS weight_nulls

FROM staging.stg_products;



/*
===========================================================

SECTION 3 STATUS

(To be updated after execution)

===========================================================
*/

/*
===========================================================

SECTION 3 CONCLUSION

Result Summary

Customers
✓ No missing values detected.

Orders
✓ Mandatory identifiers are complete.
✓ NULL delivery timestamps are expected for
  cancelled or undelivered orders.

Products
✓ Product IDs are complete.
⚠ 610 products contain incomplete descriptive
  metadata.
⚠ Only 2 products are missing weight information.

Status : PASSED

===========================================================
*/

