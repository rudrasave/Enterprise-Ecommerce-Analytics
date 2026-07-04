/*
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Database: PostgreSQL
Purpose : Payment Analytics Summary View
===========================================================
*/

CREATE OR REPLACE VIEW analytics.payment_summary AS

SELECT

    payment_type,

    COUNT(*) AS total_transactions,

    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(SUM(payment_value),2) AS total_payment_value,

    ROUND(AVG(payment_value),2) AS average_payment,

    MIN(payment_value) AS minimum_payment,

    MAX(payment_value) AS maximum_payment,

    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (),
        2
    ) AS payment_percentage

FROM production.payments

GROUP BY payment_type;