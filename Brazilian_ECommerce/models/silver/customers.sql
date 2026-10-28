with source as (
    select * from {{ source('bronze', 'customers') }}
)
select * from source