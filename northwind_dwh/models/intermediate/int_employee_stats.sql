SELECT 
    o.employee_id,
    COUNT(DISTINCT o.order_id) AS nb_commandes_traitees,
    SUM(od.unit_price * od.quantity) AS ca_total,
    ROUND(AVG(
        CASE
            WHEN o.is_on_time THEN 1
            ELSE 0
        END
    ) * 100, 2) AS taux_livraison_a_temps,
    ROUND(AVG(o.shipped_date - o.order_date),2) AS delai_moyen_livraison_jours
FROM {{ ref('stg_employees') }} AS e
INNER JOIN {{ ref('int_orders_enriched') }} AS o
    ON e.employee_id = o.employee_id
INNER JOIN {{ ref('stg_order_details') }} AS od
    ON o.order_id = od.order_id
GROUP BY o.employee_id