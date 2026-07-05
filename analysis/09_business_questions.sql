/*
=========================================================
Business Case Study 1
Revenue Trend Analysis
=========================================================

Scenario:
The CEO wants to analyze monthly revenue trends to identify
growth patterns and seasonal fluctuations.

Business Objective:
Identify revenue trends across months.

=========================================================
*/

SELECT

    DATE_TRUNC('month', order_purchase_timestamp) AS month,

    ROUND(SUM(price),2) AS monthly_revenue,

    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(AVG(price),2) AS average_product_price

FROM analytics.sales_summary

GROUP BY DATE_TRUNC('month', order_purchase_timestamp)

ORDER BY month;

/*
Business Insight

• Monthly revenue shows steady growth throughout 2017.
• The highest revenue is observed during late 2017 and early 2018.
• This indicates increasing customer demand and business expansion.
• Marketing campaigns can be planned around historically strong months.
*/

/*
=========================================================
Business Case Study 2
Identify High Value Customers
=========================================================

Scenario:
The Marketing team wants to launch a loyalty program for
its best customers.

Business Objective:
Identify customers based on total spending.
=========================================================
*/

SELECT

    customer_id,

    ROUND(SUM(price),2) AS total_spent,

    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(AVG(price),2) AS average_purchase

FROM analytics.sales_summary

GROUP BY customer_id

ORDER BY total_spent DESC

LIMIT 20;

/*
Business Insight

• A small group of customers contributes significantly to revenue.
• These customers are strong candidates for a loyalty or VIP program.
• Retaining these customers could increase long-term revenue.
*/

/*
=========================================================
Business Case Study 3
Top Performing Sellers
=========================================================

Scenario:
The Sales Director wants to reward the company's highest
performing sellers.

Business Objective:
Identify sellers generating the highest revenue.
=========================================================
*/

SELECT

    seller_id,

    ROUND(SUM(price),2) AS total_revenue,

    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(AVG(price),2) AS average_sale

FROM analytics.sales_summary

GROUP BY seller_id

ORDER BY total_revenue DESC

LIMIT 20;

/*
Business Insight

• A small number of sellers contribute a significant share of revenue.
• These sellers should be prioritized for incentive and retention programs.
• Their selling strategies can be analyzed and shared across the seller network.
*/

/*
=========================================================
Business Case Study 4
Underperforming Product Categories
=========================================================

Scenario:
The Product Team wants to identify low-performing product
categories.

Business Objective:
Find categories contributing the least revenue.
=========================================================
*/

SELECT

    product_category_name,

    ROUND(SUM(price),2) AS total_revenue,

    COUNT(DISTINCT order_id) AS total_orders

FROM analytics.sales_summary

GROUP BY product_category_name

ORDER BY total_revenue ASC

LIMIT 20;

/*
Business Insight

• Several product categories generate very low revenue.
• These categories should be reviewed for pricing, demand, or inventory optimization.
• Marketing campaigns or product rationalization may improve profitability.
*/