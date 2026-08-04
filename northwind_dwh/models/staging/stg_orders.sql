SELECT 
    CAST(order_id AS INTEGER) AS order_id,
    CAST(customer_id AS STRING) AS customer_id,
    CAST(employee_id AS INTEGER) AS employee_id,
    CAST(order_date AS DATE) AS order_date,
    CAST(required_date AS DATE) AS required_date,
    CAST(shipped_date AS DATE) AS shipped_date,
    CAST(ship_via AS INTEGER) AS ship_via,
    CAST(freight AS DECIMAL(10,2)) AS freight,
    CAST(ship_name AS STRING) AS ship_name,
    CAST(ship_address AS STRING) AS ship_address,
    CAST(ship_city AS STRING) AS ship_city,
    CAST(ship_region AS STRING) AS ship_region,
    CAST(ship_postal_code AS STRING) AS ship_postal_code,
    CAST(ship_country AS STRING) AS ship_country
    
    CASE
        WHEN shipped_date IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS is_shipped  
FROM {{source('Northwind', 'orders')}}