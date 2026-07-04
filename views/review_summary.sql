/*
===========================================================
Project : Enterprise E-commerce Analytics
Author  : Rudra Save
Database: PostgreSQL
Purpose : Customer Review Analytics Summary View
===========================================================
*/

CREATE OR REPLACE VIEW analytics.review_summary AS

SELECT

    review_score,

    COUNT(*) AS total_reviews,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_reviews

FROM production.reviews

GROUP BY review_score

ORDER BY review_score;