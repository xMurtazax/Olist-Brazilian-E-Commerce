with source as (
    select * from {{ source('bronze', 'order_reviews') }}
)
select * from source