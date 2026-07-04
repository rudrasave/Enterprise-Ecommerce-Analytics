/*
===========================================================
Load Sellers into Production
===========================================================
*/

INSERT INTO production.sellers (

    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state

)

SELECT

    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state

FROM staging.stg_sellers;