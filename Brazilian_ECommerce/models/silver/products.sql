with source as (
    select * from {{ source('bronze', 'products') }}
)
select * from source