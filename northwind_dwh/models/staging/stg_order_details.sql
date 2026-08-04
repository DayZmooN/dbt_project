SELECT 
    order_id,
    product_id,
    unit_prix,
    quantity,
    discount,
    ROUND((unit_price * quantity * (1 - discount))::numeric,2) AS sous_total
FROM {{ source('Northwind', 'order_details')}}
GROUP BY order_id,product_id, unit_price,quantity,discount;
