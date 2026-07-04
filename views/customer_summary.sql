/*
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Database: PostgreSQL
Purpose : Customer Analytics Summary View (Optimized)
===========================================================
*/

CREATE OR REPLACE VIEW analytics.customer_summary AS

WITH customer_orders AS (

    SELECT
        customer_id,
        COUNT(*) AS total_orders,
        MIN(order_purchase_timestamp) AS first_order,
        MAX(order_purchase_timestamp) AS latest_order

    FROM production.orders

    GROUP BY customer_id
),

customer_payments AS (

    SELECT
        o.customer_id,
        SUM(p.payment_value) AS total_spent,
        AVG(p.payment_value) AS average_order_value

    FROM production.orders o

    JOIN production.payments p
        ON o.order_id = p.order_id

    GROUP BY o.customer_id
),

customer_products AS (

    SELECT
        o.customer_id,
        COUNT(DISTINCT oi.product_id) AS unique_products

    FROM production.orders o

    JOIN production.order_items oi
        ON o.order_id = oi.order_id

    GROUP BY o.customer_id
)

SELECT

    c.customer_id,

    c.customer_city,

    c.customer_state,

    COALESCE(co.total_orders,0) AS total_orders,

    COALESCE(cp.unique_products,0) AS unique_products,

    ROUND(COALESCE(pay.total_spent,0),2) AS total_spent,

    ROUND(COALESCE(pay.average_order_value,0),2) AS average_order_value,

    co.first_order,

    co.latest_order

FROM production.customers c

LEFT JOIN customer_orders co
ON c.customer_id = co.customer_id

LEFT JOIN customer_products cp
ON c.customer_id = cp.customer_id

LEFT JOIN customer_payments pay
ON c.customer_id = pay.customer_id;