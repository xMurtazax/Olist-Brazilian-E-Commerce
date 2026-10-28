with source as (
    select * from {{ source('bronze', 'order_payments') }}
)
select * from source