/*
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Database: PostgreSQL
Purpose : Create staging tables
===========================================================
*/

CREATE TABLE staging.stg_customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INTEGER,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);

-- =======================================================
-- PRODUCTION PRODUCTS
-- =======================================================

CREATE TABLE IF NOT EXISTS production.products (

    product_id VARCHAR(50) PRIMARY KEY,

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
-- PRODUCTION SELLERS
-- =======================================================

CREATE TABLE IF NOT EXISTS production.sellers (

    seller_id VARCHAR(50) PRIMARY KEY,

    seller_zip_code_prefix INTEGER,

    seller_city VARCHAR(100),

    seller_state CHAR(2)

);

-- =======================================================
-- PRODUCTION PAYMENTS
-- =======================================================

CREATE TABLE IF NOT EXISTS production.payments (

    order_id VARCHAR(50),

    payment_sequential INTEGER,

    payment_type VARCHAR(30),

    payment_installments INTEGER,

    payment_value NUMERIC(10,2),

    CONSTRAINT fk_payments_orders
        FOREIGN KEY(order_id)
        REFERENCES production.orders(order_id)

);

-- =======================================================
-- PRODUCTION REVIEWS
-- =======================================================

CREATE TABLE IF NOT EXISTS production.reviews (

    review_id VARCHAR(50) PRIMARY KEY,

    order_id VARCHAR(50),

    review_score INTEGER,

    review_comment_title TEXT,

    review_comment_message TEXT,

    review_creation_date TIMESTAMP,

    review_answer_timestamp TIMESTAMP,

    CONSTRAINT fk_reviews_orders
        FOREIGN KEY(order_id)
        REFERENCES production.orders(order_id)

);

-- =======================================================
-- PRODUCTION ORDER ITEMS
-- =======================================================

CREATE TABLE IF NOT EXISTS production.order_items (

    order_id VARCHAR(50),

    order_item_id INTEGER,

    product_id VARCHAR(50),

    seller_id VARCHAR(50),

    shipping_limit_date TIMESTAMP,

    price NUMERIC(10,2),

    freight_value NUMERIC(10,2),

    PRIMARY KEY(order_id, order_item_id),

    CONSTRAINT fk_orderitems_orders
        FOREIGN KEY(order_id)
        REFERENCES production.orders(order_id),

    CONSTRAINT fk_orderitems_products
        FOREIGN KEY(product_id)
        REFERENCES production.products(product_id),

    CONSTRAINT fk_orderitems_sellers
        FOREIGN KEY(seller_id)
        REFERENCES production.sellers(seller_id)

);

-- =======================================================
-- PRODUCTION GEOLOCATION
-- =======================================================

CREATE TABLE IF NOT EXISTS production.geolocation (

    geolocation_zip_code_prefix INTEGER,

    geolocation_lat NUMERIC(12,8),

    geolocation_lng NUMERIC(12,8),

    geolocation_city VARCHAR(100),

    geolocation_state CHAR(2)

);

-- =======================================================
-- PRODUCTION CATEGORY TRANSLATION
-- =======================================================

CREATE TABLE IF NOT EXISTS production.category_translation (

    product_category_name VARCHAR(100) PRIMARY KEY,

    product_category_name_english VARCHAR(100)

);