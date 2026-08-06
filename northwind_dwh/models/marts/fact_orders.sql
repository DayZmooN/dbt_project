-- Q18 — Créer fact_orders.sql depuis int_orders_enriched 
--ajouter montant_total_avec_frais


SELECT
order_id, 
customer_id, 
employee_id, 
ship_via, 
order_date, 
required_date, 
shipped_date, 
ship_city, 
ship_country, 
freight, 
is_on_time, 
delai_livraison_jours, 
nb_articles, 
quantite_totale, 
montant_total,
montant_total + freight AS montant_total_avec_frais
FROM {{ref('int_orders_enriched')}}