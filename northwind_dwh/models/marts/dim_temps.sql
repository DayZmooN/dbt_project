-- Q17 — Créer dim_temps.sql — extraire depuis les dates de commandes : jour, mois, année,
-- trimestre, annee_mois, est_weekend

SELECT
CAST(TO_CHAR(order_date,'YYYYMMDD') AS INTEGER) AS date_id,
EXTRACT(DAY FROM order_date) AS jour,
EXTRACT(MONTH FROM order_date) AS mois,
EXTRACT(YEAR FROM order_date) AS annee,
EXTRACT(QUARTER FROM order_date) AS trimistre,
TO_CHAR(order_date, 'YYYY-MM') AS annee_mois,
CASE
    WHEN EXTRACT(DOW FROM order_date) IN (0,6) THEN TRUE
    ELSE FALSE 
END AS est_weekend
FROM {{ ref('stg_orders') }}