/*
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Database: PostgreSQL
Purpose : Seller Analytics Summary View
===========================================================
*/

CREATE OR REPLACE VIEW analytics.seller_summary AS

SELECT

    s.seller_id,

    s.seller_city,

    s.seller_state,

    COUNT(DISTINCT oi.order_id) AS total_orders,

    COUNT(oi.order_item_id) AS items_sold,

    ROUND(SUM(oi.price),2) AS total_sales,

    ROUND(AVG(oi.price),2) AS average_item_price,

    ROUND(SUM(oi.freight_value),2) AS total_freight,

    COUNT(DISTINCT oi.product_id) AS unique_products

FROM production.sellers s

LEFT JOIN production.order_items oi
ON s.seller_id = oi.seller_id

GROUP BY

    s.seller_id,
    s.seller_city,
    s.seller_state;