with source as (
    select * from {{ source('bronze', 'orders') }}
)
select * from source