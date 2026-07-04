/*
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Database: PostgreSQL
Purpose : Product Analytics Summary View
===========================================================
*/

CREATE OR REPLACE VIEW analytics.product_summary AS

SELECT

    p.product_id,

    p.product_category_name,

    COUNT(DISTINCT oi.order_id) AS total_orders,

    COUNT(oi.order_item_id) AS quantity_sold,

    ROUND(SUM(oi.price),2) AS total_revenue,

    ROUND(AVG(oi.price),2) AS average_price,

    ROUND(SUM(oi.freight_value),2) AS total_freight,

    COUNT(DISTINCT oi.seller_id) AS seller_count

FROM production.products p

LEFT JOIN production.order_items oi
ON p.product_id = oi.product_id

GROUP BY

    p.product_id,
    p.product_category_name;