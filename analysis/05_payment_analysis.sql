/*
===========================================================
Payment Analysis
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Purpose : Payment Analytics & Customer Payment Behavior
===========================================================
*/
/*=========================================================
Q41 - Revenue by Payment Type
=========================================================*/

SELECT
    payment_type,
    total_payment_value
FROM analytics.payment_summary
ORDER BY total_payment_value DESC;

/*=========================================================
Q42 - Most Used Payment Methods
=========================================================*/

SELECT
    payment_type,
    total_transactions
FROM analytics.payment_summary
ORDER BY total_transactions DESC;

/*=========================================================
Q43 - Average Payment by Method
=========================================================*/

SELECT
    payment_type,
    average_payment
FROM analytics.payment_summary
ORDER BY average_payment DESC;

/*=========================================================
Q44 - Highest Revenue Payment Method
=========================================================*/

SELECT
    payment_type,
    total_payment_value
FROM analytics.payment_summary
ORDER BY total_payment_value DESC
LIMIT 1;

/*=========================================================
Q45 - Payment Method Distribution
=========================================================*/

SELECT
    payment_type,
    payment_percentage
FROM analytics.payment_summary
ORDER BY payment_percentage DESC;