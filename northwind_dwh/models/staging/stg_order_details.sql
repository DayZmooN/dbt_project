SELECT
    order_id,
    product_id,

    COALESCE(unit_price, 0)::numeric AS unit_price,
    COALESCE(quantity, 0)::integer AS quantity,
    COALESCE(discount, 0)::numeric AS discount,
    ROUND(
        (
            COALESCE(unit_price, 0)::numeric
            * COALESCE(quantity, 0)
            * (1 - COALESCE(discount, 0)::numeric)
        ),2) AS sous_total
FROM {{source('Northwind', 'order_details')}}