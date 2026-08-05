SELECT 
    customer_id,
    COUNT(o.order_id) AS nb_commandes,
    SUM(od.unit_price * od.quantity) AS ca_total,
    FIRST_VALUE(o.order_date) OVER() AS date_premiere_commande,
    LAST_VALUE(o.order_date) OVER() AS date_derniere_commande,
    AVG(o.required_date - o.order_date) AS delai_moyen_entre_commandes
FROM {{ref('stg_customers')}} AS c
INNER JOIN {{ref('stg_orders')}} AS o ON c.customer_id = o.customer_id
INNER JOIN {{ref('stg_order_details')}} AS od ON o.order_id = od.order_id
GROUP BY customer_id
