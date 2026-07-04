/*
===========================================================
Delivery Analysis
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Purpose : Delivery Performance Analysis
===========================================================
*/

/*=========================================================
Q31 - Average Delivery Time
=========================================================*/

SELECT
    ROUND(AVG(actual_delivery_days),2) AS average_delivery_days
FROM analytics.delivery_summary;

/*=========================================================
Q32 - Average Estimated Delivery Time
=========================================================*/

SELECT
    ROUND(AVG(estimated_delivery_days),2) AS average_estimated_delivery_days
FROM analytics.delivery_summary;

/*=========================================================
Q33 - Orders Delivered On Time
=========================================================*/

SELECT
    COUNT(*) AS on_time_orders
FROM analytics.delivery_summary
WHERE delivery_status = 'On Time';

/*=========================================================
Q34 - Orders Delivered Late
=========================================================*/

SELECT
    COUNT(*) AS delayed_orders
FROM analytics.delivery_summary
WHERE delivery_status = 'Delayed';

/*=========================================================
Q35 - Delivery Status Distribution
=========================================================*/

SELECT
    delivery_status,
    COUNT(*) AS total_orders
FROM analytics.delivery_summary
GROUP BY delivery_status
ORDER BY total_orders DESC;

/*=========================================================
Q36 - Average Actual vs Estimated Delivery Time
=========================================================*/

SELECT

    ROUND(AVG(actual_delivery_days),2) AS avg_actual_delivery_days,

    ROUND(AVG(estimated_delivery_days),2) AS avg_estimated_delivery_days

FROM analytics.delivery_summary;

/*=========================================================
Q37 - Delivery Status Percentage
=========================================================*/

SELECT

    delivery_status,

    COUNT(*) AS total_orders,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(),
        2
    ) AS percentage

FROM analytics.delivery_summary

GROUP BY delivery_status

ORDER BY percentage DESC;

/*=========================================================
Q38 - Top 10 Longest Deliveries
=========================================================*/

SELECT

    order_id,

    customer_id,

    actual_delivery_days

FROM analytics.delivery_summary

ORDER BY actual_delivery_days DESC

LIMIT 10;

/*=========================================================
Q39 - Top 10 Fastest Deliveries
=========================================================*/

SELECT

    order_id,

    customer_id,

    actual_delivery_days

FROM analytics.delivery_summary

ORDER BY actual_delivery_days ASC

LIMIT 10;

/*=========================================================
Q40 - Monthly Average Delivery Time
=========================================================*/

SELECT

    DATE_TRUNC('month', order_purchase_timestamp) AS month,

    ROUND(AVG(actual_delivery_days),2) AS avg_delivery_days

FROM analytics.delivery_summary

GROUP BY month

ORDER BY month;