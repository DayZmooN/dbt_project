SELECT 
    o.order_id,
    o.customer_id,
    o.employee_id,
    o.ship_via,
    o.order_date,
    o.required_date,
    o.shipped_date,
    o.ship_city,
    o.ship_country,
    o.freight,
    CASE
        WHEN o.shipped_date <= o.required_date THEN TRUE
        ELSE FALSE
    END AS is_on_time,
    (shipped_date - o.order_date)  AS delai_livraison_jours,
    COUNT(o.order_id) AS nb_articles,
    SUM(quantity) AS quantite_total,
    ROUND(SUM(od.unit_price)::"numeric",2) AS montant_total
FROM {{ref('stg_orders')}} AS o
INNER JOIN {{ref('stg_order_details')}} AS od ON o.order_id = od.order_id
GROUP BY o.order_id