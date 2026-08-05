SELECT
    p.product_id,
    p.product_name,
    p.unit_price,
    p.units_in_stock,
    p.units_on_order,
    p.discontinued,
    p.en_stock,
    c.category_name,
    c.description AS category_description,
    s.company_name,
    s.country
FROM {{ref('stg_products')}} AS p
INNER JOIN {{ref('stg_categories')}} AS c ON p.product_id = c.category_id
INNER JOIN {{ref('stg_suppliers')}} AS s ON p.supplier_id = s.supplier_id
