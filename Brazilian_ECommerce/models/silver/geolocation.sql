with source as (
    select * from {{ source('bronze', 'geolocation') }}
)

select

    geolocation_zip_code_prefix,
    avg(geolocation_lat)                 as geolocation_lat,
    avg(geolocation_lng)                 as geolocation_lng,
    max(trim(geolocation_city))          as geolocation_city,
    max(trim(geolocation_state))         as geolocation_state

from source
group by geolocation_zip_code_prefix