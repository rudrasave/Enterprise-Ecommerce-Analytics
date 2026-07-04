/*
===========================================================
Advanced SQL - Window Functions
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Purpose : Demonstrate advanced SQL analytical functions
===========================================================
*/
/*=========================================================
W01 - Rank Sellers by Revenue
=========================================================*/

SELECT

    seller_id,

    ROUND(SUM(price),2) AS revenue,

    RANK() OVER(
        ORDER BY SUM(price) DESC
    ) AS seller_rank

FROM analytics.sales_summary

GROUP BY seller_id

ORDER BY seller_rank;

/*=========================================================
W02 - Dense Rank Product Categories
=========================================================*/

SELECT

    product_category_name,

    ROUND(SUM(price),2) AS revenue,

    DENSE_RANK() OVER(
        ORDER BY SUM(price) DESC
    ) AS category_rank

FROM analytics.sales_summary

GROUP BY product_category_name

ORDER BY category_rank;

/*=========================================================
W03 - Row Number
=========================================================*/

SELECT

    order_id,

    customer_id,

    order_purchase_timestamp,

    ROW_NUMBER() OVER(
        ORDER BY order_purchase_timestamp
    ) AS order_sequence

FROM analytics.sales_summary

LIMIT 20;

/*=========================================================
W04 - Top Seller in Each State
=========================================================*/

WITH seller_revenue AS (

SELECT

    seller_state,

    seller_id,

    SUM(price) AS revenue,

    ROW_NUMBER() OVER(

        PARTITION BY seller_state

        ORDER BY SUM(price) DESC

    ) rn

FROM analytics.sales_summary

GROUP BY seller_state,seller_id

)

SELECT *

FROM seller_revenue

WHERE rn=1

ORDER BY seller_state;

/*=========================================================
W05 - Running Revenue
=========================================================*/

SELECT

DATE(order_purchase_timestamp) AS sales_date,

SUM(price) AS daily_revenue,

SUM(SUM(price))

OVER(

ORDER BY DATE(order_purchase_timestamp)

) AS running_revenue

FROM analytics.sales_summary

GROUP BY DATE(order_purchase_timestamp)

ORDER BY sales_date;

/*=========================================================
W06 - Previous Day Revenue
=========================================================*/

WITH daily_sales AS (

SELECT

DATE(order_purchase_timestamp) AS sales_date,

SUM(price) AS daily_revenue

FROM analytics.sales_summary

GROUP BY DATE(order_purchase_timestamp)

)

SELECT

sales_date,

daily_revenue,

LAG(daily_revenue)

OVER(

ORDER BY sales_date

) AS previous_day_revenue

FROM daily_sales

ORDER BY sales_date;

/*=========================================================
W07 - Next Day Revenue
=========================================================*/

WITH daily_sales AS (

SELECT

DATE(order_purchase_timestamp) sales_date,

SUM(price) daily_revenue

FROM analytics.sales_summary

GROUP BY DATE(order_purchase_timestamp)

)

SELECT

sales_date,

daily_revenue,

LEAD(daily_revenue)

OVER(

ORDER BY sales_date

) next_day_revenue

FROM daily_sales

ORDER BY sales_date;

/*=========================================================
W08 - Revenue Quartiles
=========================================================*/

SELECT

seller_id,

ROUND(SUM(price),2) revenue,

NTILE(4)

OVER(

ORDER BY SUM(price) DESC

) revenue_quartile

FROM analytics.sales_summary

GROUP BY seller_id

ORDER BY revenue DESC;

/*=========================================================
W09 - First Order Per Customer
=========================================================*/

SELECT

customer_id,

order_id,

order_purchase_timestamp,

FIRST_VALUE(order_purchase_timestamp)

OVER(

PARTITION BY customer_id

ORDER BY order_purchase_timestamp

) first_order

FROM analytics.sales_summary

LIMIT 20;

/*=========================================================
W10 - Last Order Per Customer
=========================================================*/

SELECT

customer_id,

order_id,

order_purchase_timestamp,

LAST_VALUE(order_purchase_timestamp)

OVER(

PARTITION BY customer_id

ORDER BY order_purchase_timestamp

ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING

) last_order

FROM analytics.sales_summary

LIMIT 20;