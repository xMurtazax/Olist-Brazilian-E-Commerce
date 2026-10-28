with source as (
    select * from {{ source('bronze', 'geolocation') }}
)
select * from source