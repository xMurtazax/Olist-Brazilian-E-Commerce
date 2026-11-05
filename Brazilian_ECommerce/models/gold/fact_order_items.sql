select
    {{ dbt_utils.generate_surrogate_key(['oi.order_id', 'oi.order_item_id']) }} as order_item_key,
    oi.order_id,
    oi.order_item_id,

    dc.customer_key,
    dp.product_key,
    ds.seller_key,
    cast(date_format(o.order_purchase_timestamp, 'yyyyMMdd') as int) as purchase_date_key,

    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    oi.price,
    oi.freight_value,
    oi.price + oi.freight_value as total_amount,

    datediff(o.order_delivered_customer_date, o.order_purchase_timestamp) as delivery_days,
    o.order_delivered_customer_date > o.order_estimated_delivery_date     as is_late

from {{ ref('order_items') }} oi
join {{ ref('orders') }} o            on oi.order_id = o.order_id
left join {{ ref('dim_customer') }} dc on o.customer_id = dc.customer_id
left join {{ ref('dim_product') }} dp  on oi.product_id = dp.product_id
left join {{ ref('dim_seller') }} ds   on oi.seller_id = ds.seller_id