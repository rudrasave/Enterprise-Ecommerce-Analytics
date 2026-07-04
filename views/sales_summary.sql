/*
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Database: PostgreSQL
Purpose : Sales Summary Analytics View (Optimized)
===========================================================
*/

CREATE OR REPLACE VIEW analytics.sales_summary AS

WITH payment_summary AS (

    SELECT

        order_id,

        SUM(payment_value) AS payment_value,

        STRING_AGG(DISTINCT payment_type, ', ') AS payment_type

    FROM production.payments

    GROUP BY order_id
),

review_summary AS (

    SELECT

        order_id,

        ROUND(AVG(review_score),2) AS average_review_score

    FROM production.reviews

    GROUP BY order_id
)

SELECT

    o.order_id,

    o.order_purchase_timestamp,

    c.customer_id,

    c.customer_city,

    c.customer_state,

    oi.product_id,

    p.product_category_name,

    oi.seller_id,

    s.seller_city,

    s.seller_state,

    pay.payment_type,

    pay.payment_value,

    oi.price,

    oi.freight_value,

    rev.average_review_score AS review_score

FROM production.orders o

JOIN production.customers c
ON o.customer_id = c.customer_id

JOIN production.order_items oi
ON o.order_id = oi.order_id

JOIN production.products p
ON oi.product_id = p.product_id

JOIN production.sellers s
ON oi.seller_id = s.seller_id

LEFT JOIN payment_summary pay
ON o.order_id = pay.order_id

LEFT JOIN review_summary rev
ON o.order_id = rev.order_id;