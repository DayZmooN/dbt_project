SELECT
    customer_id,
    INITCAP(TRIM(company_name)) AS company_name,
    INITCAP(TRIM(contact_name)) AS contact_name,
    INITCAP(TRIM(contact_title)) AS contact_title,
    INITCAP(TRIM(city)) AS city,
    UPPER(TRIM(country)) AS country,
    TRIM(phone) AS phone
FROM {{ source('Northwind', 'customers') }}