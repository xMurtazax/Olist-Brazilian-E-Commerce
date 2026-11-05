select
    {{ dbt_utils.generate_surrogate_key(['c.customer_id']) }} as customer_key,
    c.customer_id,
    c.customer_unique_id,
    c.customer_zip_code_prefix   as zip_code_prefix,
    c.customer_city              as city,
    c.customer_state             as state,
    g.geolocation_lat            as latitude,
    g.geolocation_lng            as longitude
from {{ ref('customers') }} c
left join {{ ref('geolocation') }} g
    on c.customer_zip_code_prefix = g.geolocation_zip_code_prefix