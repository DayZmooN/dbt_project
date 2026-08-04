SELECT
    customer_type_id,
    customer_desc
FROM {{source('Northwind','customer_demographics')}}