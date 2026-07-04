/*
===========================================================
Product Analysis
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Purpose : Product Performance Analysis
===========================================================
*/

/*=========================================================
Q21 - Top 10 Best Selling Products
=========================================================*/

SELECT

    product_id,

    COUNT(*) AS units_sold,

    ROUND(SUM(price),2) AS revenue

FROM analytics.sales_summary

GROUP BY product_id

ORDER BY units_sold DESC

LIMIT 10;

/*=========================================================
Q22 - Top Revenue Products
=========================================================*/

SELECT

    product_id,

    ROUND(SUM(price),2) AS revenue

FROM analytics.sales_summary

GROUP BY product_id

ORDER BY revenue DESC

LIMIT 10;

/*=========================================================
Q23 - Products Sold Only Once
=========================================================*/

SELECT

    product_id,

    COUNT(*) AS units_sold

FROM analytics.sales_summary

GROUP BY product_id

HAVING COUNT(*) = 1

ORDER BY product_id;

/*=========================================================
Q24 - Products Sold More Than 100 Times
=========================================================*/

SELECT

    product_id,

    COUNT(*) AS units_sold

FROM analytics.sales_summary

GROUP BY product_id

HAVING COUNT(*) > 100

ORDER BY units_sold DESC;

/*=========================================================
Q25 - Top Categories by Units Sold
=========================================================*/

SELECT

    product_category_name,

    COUNT(*) AS units_sold

FROM analytics.sales_summary

GROUP BY product_category_name

ORDER BY units_sold DESC

LIMIT 10;

/*=========================================================
Q26 - Top Categories by Average Product Price
=========================================================*/

SELECT

    product_category_name,

    ROUND(AVG(price),2) AS average_price

FROM analytics.sales_summary

GROUP BY product_category_name

ORDER BY average_price DESC

LIMIT 10;

/*=========================================================
Q27 - Lowest Selling Categories
=========================================================*/

SELECT

    product_category_name,

    COUNT(*) AS units_sold

FROM analytics.sales_summary

GROUP BY product_category_name

ORDER BY units_sold ASC

LIMIT 10;

/*=========================================================
Q28 - Category Revenue Contribution
=========================================================*/

SELECT

    product_category_name,

    ROUND(SUM(price),2) AS revenue,

    ROUND(
        100.0 * SUM(price) /
        (SELECT SUM(price) FROM analytics.sales_summary),
        2
    ) AS revenue_percentage

FROM analytics.sales_summary

GROUP BY product_category_name

ORDER BY revenue DESC;

/*=========================================================
Q29 - Product Price Distribution
=========================================================*/

SELECT

CASE

    WHEN price < 50 THEN 'Below 50'

    WHEN price BETWEEN 50 AND 100 THEN '50-100'

    WHEN price BETWEEN 101 AND 250 THEN '101-250'

    WHEN price BETWEEN 251 AND 500 THEN '251-500'

    ELSE 'Above 500'

END AS price_range,

COUNT(*) AS total_products

FROM analytics.sales_summary

GROUP BY price_range

ORDER BY total_products DESC;

/*=========================================================
Q30 - Most Expensive Products
=========================================================*/

SELECT

    product_id,

    product_category_name,

    price

FROM analytics.sales_summary

ORDER BY price DESC

LIMIT 10;