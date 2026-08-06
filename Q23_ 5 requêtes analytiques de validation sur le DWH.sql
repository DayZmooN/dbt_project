SELECT
    c.company_name,
    SUM(f.montant_total_avec_frais) AS chiffre_affaires
FROM dbt_dev.fact_orders f
JOIN dbt_dev.dim_customers c
    ON f.customer_id = c.customer_id
GROUP BY c.company_name
ORDER BY chiffre_affaires DESC
LIMIT 10;



SELECT
    c.country,
    SUM(f.montant_total_avec_frais) AS chiffre_affaires
FROM dbt_dev.fact_orders f
JOIN dbt_dev.dim_customers c
    ON f.customer_id = c.customer_id
GROUP BY c.country
ORDER BY chiffre_affaires DESC;



SELECT
    e.full_name,
    COUNT(f.order_id) AS nombre_commandes,
    SUM(f.montant_total_avec_frais) AS chiffre_affaires
FROM dbt_dev.fact_orders f
JOIN dbt_dev.dim_employees e
    ON f.employee_id = e.employee_id
GROUP BY e.full_name
ORDER BY chiffre_affaires DESC;



SELECT
    s.company_name,
    COUNT(f.order_id) AS nombre_commandes,
    AVG(f.delai_livraison_jours) AS delai_moyen
FROM dbt_dev.fact_orders f
JOIN dbt_dev.dim_shippers s
    ON f.ship_via = s.shipper_id
GROUP BY s.company_name
ORDER BY nombre_commandes DESC;



SELECT
    is_on_time,
    COUNT(*) AS nombre_commandes,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),
        2
    ) AS pourcentage
FROM dbt_dev.fact_orders
GROUP BY is_on_time;