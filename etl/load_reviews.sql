/*
===========================================================
Load Reviews into Production
===========================================================
*/

INSERT INTO production.reviews (

    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    review_answer_timestamp

)

SELECT

    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    review_answer_timestamp

FROM staging.stg_reviews;