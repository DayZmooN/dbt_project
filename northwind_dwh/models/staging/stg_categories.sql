SELECT
    category_id,
    category_name,
    description,
    picture

FROM {{source('Northwind','categories')}}