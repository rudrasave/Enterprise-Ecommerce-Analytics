/*
===========================================================
Load Order Items into Production
===========================================================
*/

INSERT INTO production.order_items (

    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value

)

SELECT

    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value

FROM staging.stg_order_items;