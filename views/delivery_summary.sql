/*
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Database: PostgreSQL
Purpose : Delivery Analytics Summary View
===========================================================
*/

CREATE OR REPLACE VIEW analytics.delivery_summary AS

SELECT

    order_id,

    customer_id,

    order_purchase_timestamp,

    order_delivered_customer_date,

    order_estimated_delivery_date,

    (order_delivered_customer_date::date - order_purchase_timestamp::date)
        AS actual_delivery_days,

    (order_estimated_delivery_date::date - order_purchase_timestamp::date)
        AS estimated_delivery_days,

    CASE
        WHEN order_delivered_customer_date <= order_estimated_delivery_date
        THEN 'On Time'
        ELSE 'Delayed'
    END AS delivery_status

FROM production.orders

WHERE order_delivered_customer_date IS NOT NULL;