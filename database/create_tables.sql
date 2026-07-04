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