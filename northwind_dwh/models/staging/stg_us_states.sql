SELECT 
    state_id,
    state_name,
    state_abbr,
    state_region

FROM {{source('Northwind','us_states')}}