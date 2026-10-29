with source as (
    select * from {{ source('bronze', 'sellers') }}
),

cleaned as (
    select
        trim(seller_id)                              as seller_id,
        seller_zip_code_prefix                       as zip_code_prefix,
        initcap(trim(seller_city))                   as seller_city,
        upper(trim(seller_state))                    as seller_state
    from source
),

deduped as (
    select *,
        row_number() over (partition by seller_id order by seller_id) as rn
    from cleaned
)

select * except (rn)
from deduped
where rn = 1