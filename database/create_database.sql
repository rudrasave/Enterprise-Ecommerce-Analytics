-- /*
-- ===========================================================
-- Project : Enterprise E-commerce Analytics
-- Author  : Rudra Save
-- Database: PostgreSQL
-- Purpose : Create project schemas
-- ===========================================================
-- */

-- CREATE SCHEMA IF NOT EXISTS staging;

-- CREATE SCHEMA IF NOT EXISTS production;

-- CREATE SCHEMA IF NOT EXISTS analytics;

/*
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Database: PostgreSQL
Purpose : Create all staging tables
===========================================================
*/

-- =======================================================
-- STAGING CUSTOMERS
-- =======================================================

CREATE TABLE IF NOT EXISTS staging.stg_customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INTEGER,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);

-- =======================================================
-- STAGING ORDERS
-- =======================================================

CREATE TABLE IF NOT EXISTS staging.stg_orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

-- =======================================================
-- STAGING ORDER ITEMS
-- =======================================================

CREATE TABLE IF NOT EXISTS staging.stg_order_items (
    order_id VARCHAR(50),
    order_item_id INTEGER,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2)
);

-- =======================================================
-- STAGING PRODUCTS
-- =======================================================

CREATE TABLE IF NOT EXISTS staging.stg_products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_lenght INTEGER,
    product_description_lenght INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
);

-- =======================================================
-- STAGING PAYMENTS
-- =======================================================

CREATE TABLE IF NOT EXISTS staging.stg_payments (
    order_id VARCHAR(50),
    payment_sequential INTEGER,
    payment_type VARCHAR(30),
    payment_installments INTEGER,
    payment_value NUMERIC(10,2)
);

-- =======================================================
-- STAGING REVIEWS
-- =======================================================

CREATE TABLE IF NOT EXISTS staging.stg_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INTEGER,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

-- =======================================================
-- STAGING SELLERS
-- =======================================================

CREATE TABLE IF NOT EXISTS staging.stg_sellers (
    seller_id VARCHAR(50),
    seller_zip_code_prefix INTEGER,
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);

-- =======================================================
-- STAGING GEOLOCATION
-- =======================================================

CREATE TABLE IF NOT EXISTS staging.stg_geolocation (
    geolocation_zip_code_prefix INTEGER,
    geolocation_lat NUMERIC(12,8),
    geolocation_lng NUMERIC(12,8),
    geolocation_city VARCHAR(100),
    geolocation_state CHAR(2)
);

-- =======================================================
-- STAGING CATEGORY TRANSLATION
-- =======================================================

CREATE TABLE IF NOT EXISTS staging.stg_category_translation (
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100)
);


/*===========================================================
PRODUCTION TABLE : ORDERS

Purpose:
Stores validated customer orders.

Business Rules
--------------
• One record per order
• Every order belongs to one customer
• customer_id references Customers

===========================================================*/

CREATE TABLE IF NOT EXISTS production.orders (

    order_id VARCHAR(50) PRIMARY KEY,

    customer_id VARCHAR(50) NOT NULL,

    order_status VARCHAR(20) NOT NULL,

    order_purchase_timestamp TIMESTAMP NOT NULL,

    order_approved_at TIMESTAMP,

    order_delivered_carrier_date TIMESTAMP,

    order_delivered_customer_date TIMESTAMP,

    order_estimated_delivery_date TIMESTAMP NOT NULL,

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES production.customers(customer_id)

);