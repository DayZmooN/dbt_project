
-- Q13 — int_product_sales.sql — pour chaque produit : quantité totale vendue, CA généré, nb
-- commandes distinctes, stock restant depuis stg_products
SELECT
    p.product_id,
    SUM(od.quantity) AS quantite_total_vendue,
    ROUND(SUM(od.unit_price*od.quantity)::numeric,2) AS ca_genere,
    COUNT(DISTINCT od.order_id) AS nb_commandes_distinctes,
    SUM(p.units_in_stock)AS stock_restant 
FROM {{ref('stg_products')}} AS p
INNER JOIN {{ref('stg_order_details')}} AS od ON p.product_id = od.product_id 
GROUP BY p.product_id