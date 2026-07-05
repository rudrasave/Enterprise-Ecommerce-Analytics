/*
===========================================================
Advanced SQL - Common Table Expressions (CTEs)
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Purpose : Solve business problems using CTEs
===========================================================
*/

/*=========================================================
C01 - Top Customers by Revenue
=========================================================*/

WITH customer_revenue AS (

    SELECT
        customer_id,
        ROUND(SUM(price), 2) AS revenue
    FROM analytics.sales_summary
    GROUP BY customer_id

)

SELECT *
FROM customer_revenue
ORDER BY revenue DESC
LIMIT 10;

/*=========================================================
C02 - Monthly Revenue
=========================================================*/

WITH monthly_sales AS (

SELECT

DATE_TRUNC('month',order_purchase_timestamp) month,

SUM(price) revenue

FROM analytics.sales_summary

GROUP BY month

)

SELECT *

FROM monthly_sales

ORDER BY month;

/*=========================================================
C03 - Top Category Per State
=========================================================*/

WITH category_sales AS (

SELECT

customer_state,

product_category_name,

SUM(price) revenue,

ROW_NUMBER()

OVER(

PARTITION BY customer_state

ORDER BY SUM(price) DESC

) rn

FROM analytics.sales_summary

GROUP BY customer_state,product_category_name

)

SELECT *

FROM category_sales

WHERE rn=1

ORDER BY customer_state;

/*=========================================================
C04 - Revenue Above Average
=========================================================*/

WITH seller_sales AS (

SELECT

seller_id,

SUM(price) revenue

FROM analytics.sales_summary

GROUP BY seller_id

),

average_sales AS (

SELECT AVG(revenue) avg_rev

FROM seller_sales

)

SELECT

seller_id,

revenue

FROM seller_sales

WHERE revenue >

(

SELECT avg_rev

FROM average_sales

)

ORDER BY revenue DESC;

/*=========================================================
C05 - Monthly Growth
=========================================================*/

WITH monthly_sales AS (

    SELECT
        DATE_TRUNC('month', order_purchase_timestamp) AS month,
        SUM(price) AS revenue
    FROM analytics.sales_summary
    GROUP BY DATE_TRUNC('month', order_purchase_timestamp)

)

SELECT

    month,

    revenue,

    LAG(revenue) OVER (
        ORDER BY month
    ) AS previous_month

FROM monthly_sales

ORDER BY month;

/*=========================================================
C06 - Top Seller in Each State
=========================================================*/

WITH seller_revenue AS (

    SELECT
        seller_state,
        seller_id,
        SUM(price) AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY seller_state
            ORDER BY SUM(price) DESC
        ) AS rn

    FROM analytics.sales_summary

    GROUP BY seller_state, seller_id

)

SELECT
    seller_state,
    seller_id,
    ROUND(revenue,2) AS revenue
FROM seller_revenue
WHERE rn = 1
ORDER BY seller_state;

/*=========================================================
C07 - Revenue Contribution by State
=========================================================*/

WITH state_revenue AS (

    SELECT
        customer_state,
        SUM(price) AS revenue
    FROM analytics.sales_summary
    GROUP BY customer_state

),

total_revenue AS (

    SELECT
        SUM(revenue) AS total_revenue
    FROM state_revenue

)

SELECT

    sr.customer_state,

    ROUND(sr.revenue,2) AS revenue,

    ROUND(
        (sr.revenue / tr.total_revenue) * 100,
        2
    ) AS revenue_percentage

FROM state_revenue sr

CROSS JOIN total_revenue tr

ORDER BY revenue DESC;

/*=========================================================
C08 - Top Customer in Each State
=========================================================*/

WITH customer_revenue AS (

    SELECT
        customer_state,
        customer_id,
        SUM(price) AS revenue
    FROM analytics.sales_summary
    GROUP BY customer_state, customer_id

),

ranked_customers AS (

    SELECT
        customer_state,
        customer_id,
        revenue,
        ROW_NUMBER() OVER (
            PARTITION BY customer_state
            ORDER BY revenue DESC
        ) AS rn
    FROM customer_revenue

)

SELECT
    customer_state,
    customer_id,
    ROUND(revenue,2) AS revenue
FROM ranked_customers
WHERE rn = 1
ORDER BY customer_state;