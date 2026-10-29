with source as (
    select * from {{ source('bronze', 'order_items') }}
)
select

    trim(order_id)          as order_id,
    order_item_id           as order_item_id,
    trim(product_id)        as product_id,
    trim(seller_id)         as seller_id,
    shipping_limit_date     as shipping_limit_date,
    price                   as price,
    freight_value           as freight_value

from source