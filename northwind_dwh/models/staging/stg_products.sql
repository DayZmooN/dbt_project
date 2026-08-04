SELECT 
    CAST(product_id AS INTEGER) AS product_id,
    CAST(product_name AS TEXT) AS product_name,
    CAST(supplier_id AS INTEGER) AS supplier_id,
    CAST(category_id AS INTEGER) AS category_id,
    CAST(quantity_per_unit AS TEXT) AS quantity,
    CAST(unit_price AS INTEGER) AS unit_price,
    CAST(units_in_stock AS INTEGER) AS units_in_stock,
    CAST(units_on_order AS INTEGER) AS units_on_order,
    CAST(reorder_level AS INTEGER) AS  reorder_level,
    CAST(discontinued AS INTEGER) AS discountinued,

    CASE
        WHEN CAST(units_in_stock AS INTEGER) > 0 THEN TRUE
        ELSE FALSE
    END AS en_stock

FROM {{ source('Northwind', 'products')}}