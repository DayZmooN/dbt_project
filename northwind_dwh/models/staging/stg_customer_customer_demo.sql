SELECT
    customer_id,
    customer_type_id
FROM {{source('Northwind','customer_customer_demo')}}