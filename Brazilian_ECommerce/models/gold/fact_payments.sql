select
    {{ dbt_utils.generate_surrogate_key(['p.order_id', 'p.payment_sequential']) }} as payment_key,
    p.order_id,
    dc.customer_key,
    cast(date_format(o.order_purchase_timestamp, 'yyyyMMdd') as int) as purchase_date_key,
    p.payment_sequential,
    p.payment_type,
    p.payment_installments,
    p.payment_value
from {{ ref('order_payments') }} p
join {{ ref('orders') }} o on p.order_id = o.order_id
left join {{ ref('dim_customer') }} dc on o.customer_id = dc.customer_id