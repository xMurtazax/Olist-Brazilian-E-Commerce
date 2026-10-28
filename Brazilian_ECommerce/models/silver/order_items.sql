with source as (
    select * from {{ source('bronze', 'order_items') }}
)
select * from source