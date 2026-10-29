with source as (
    select * from {{ source('bronze', 'geolocation') }}
)

select

    geolocation_zip_code_prefix     as geolocation_zip_code_prefix,
    geolocation_lat                 as geolocation_lat,
    geolocation_lng                 as geolocation_lng,
    trim(geolocation_city)          as geolocation_city,
    trim(geolocation_state)         as geolocation_state

from source