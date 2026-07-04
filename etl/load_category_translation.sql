/*
===========================================================
Load Category Translation into Production
===========================================================
*/

INSERT INTO production.category_translation (

    product_category_name,
    product_category_name_english

)

SELECT

    product_category_name,
    product_category_name_english

FROM staging.stg_category_translation;