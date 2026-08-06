--  Q15 — Créer dim_products.sql depuis int_products_enriched — ajouter colonne gamme
-- (Entrée de gamme / Milieu de gamme / Premium)

SELECT
product_id,
product_name, 
unit_price, 
units_in_stock, 
units_on_order, 
discontinued, en_stock, 
category_name,
category_description, 
supplier_name,
supplier_country,

CASE 
    WHEN unit_price >= 30 THEN 'Premium'
    WHEN unit_price <= 10 THEN 'Entrée de gamme'
    ELSE 'Milieu de gamme'    
END AS gamme

FROM {{ref('int_products_enriched')}}