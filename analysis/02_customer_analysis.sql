/*=========================================================
Q11 - Total Customers
Purpose:
Find the total number of unique customers.
=========================================================*/

SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM analytics.customer_summary;

/*=========================================================
Q12 - Top 10 Customers by Spending
=========================================================*/

SELECT
    customer_id,
    customer_city,
    customer_state,
    total_spent
FROM analytics.customer_summary
ORDER BY total_spent DESC
LIMIT 10;

/*=========================================================
Q13 - Average Customer Spending
=========================================================*/

SELECT
    ROUND(AVG(total_spent),2) AS average_customer_spending
FROM analytics.customer_summary;

/*=========================================================
Q14 - Highest Customer Spending
=========================================================*/

SELECT
    MAX(total_spent) AS highest_customer_spending
FROM analytics.customer_summary;

/*=========================================================
Q15 - Customers by State
=========================================================*/

SELECT
    customer_state,
    COUNT(*) AS total_customers
FROM analytics.customer_summary
GROUP BY customer_state
ORDER BY total_customers DESC;

/*=========================================================
Q16 - Customers by City
=========================================================*/

SELECT
    customer_city,
    COUNT(*) AS total_customers
FROM analytics.customer_summary
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;

/*=========================================================
Q17 - Repeat Customers
=========================================================*/

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM production.customers c
JOIN production.orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;

/*=========================================================
Q18 - Customer Lifetime Value Ranking
=========================================================*/

SELECT
    customer_id,
    total_spent,
    RANK() OVER(ORDER BY total_spent DESC) AS spending_rank
FROM analytics.customer_summary
LIMIT 20;

/*=========================================================
Q19 - First Customers
=========================================================*/

SELECT
    customer_id,
    first_order
FROM analytics.customer_summary
ORDER BY first_order
LIMIT 10;

/*=========================================================
Q20 - Latest Customers
=========================================================*/

SELECT
    customer_id,
    latest_order
FROM analytics.customer_summary
ORDER BY latest_order DESC
LIMIT 10;