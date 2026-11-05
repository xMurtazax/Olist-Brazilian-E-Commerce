select
    {{ dbt_utils.generate_surrogate_key(['s.seller_id']) }} as seller_key,
    s.seller_id,
    s.seller_zip_code_prefix   as zip_code_prefix,
    s.seller_city              as city,
    s.seller_state             as state,
    g.geolocation_lat          as latitude,
    g.geolocation_lng          as longitude
from {{ ref('sellers') }} s
left join {{ ref('geolocation') }} g
    on s.seller_zip_code_prefix = g.geolocation_zip_code_prefix