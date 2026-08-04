SELECT
    territory_id,
    territory_description,
    region_id
FROM {{source('Northwind','territories')}}