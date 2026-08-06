SELECT 
    DATE_TRUNC('MONTH',o.order_date) AS mois,
   COUNT(DISTINCT o.order_id) AS nb_commandes,
    ROUND(
        SUM(od.unit_price * od.quantity)::"numeric" / COUNT(DISTINCT o.order_id),2
   ) AS panier_moyen,
    ROUND(SUM(od.unit_price * od.quantity) 
    - LAG((SUM(od.unit_price * od.quantity))) 
    OVER(ORDER BY DATE_TRUNC('MONTH', order_date)) ::"numeric",2) AS ca_mois_precedent,

       ROUND(
                (
                    (SUM(od.unit_price * od.quantity) 
                    - LAG(SUM(od.unit_price * od.quantity)) 
                        OVER(ORDER BY DATE_TRUNC('MONTH', order_date))
                    )::"numeric"
                    / 
                    LAG(SUM(od.unit_price * od.quantity)) 
                        OVER(ORDER BY DATE_TRUNC('MONTH', order_date))
                ) * 100, 2
            )
 AS variation_pct
FROM {{ref('stg_orders')}} o
INNER JOIN {{ref('stg_order_details')}} AS od ON o.order_id = od.order_id
GROUP BY  DATE_TRUNC('MONTH',o.order_date)
ORDER BY DATE_TRUNC('MONTH',o.order_date) ASC 

