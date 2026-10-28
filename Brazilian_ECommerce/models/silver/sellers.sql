with source as (
    select * from {{ source('bronze', 'sellers') }}
),

cleaned as (
    select
        trim(seller_id)                              as seller_id,
        lpad(cast(seller_zip_code_prefix as string), 5, '0') as zip_code_prefix,
        initcap(trim(seller_city))                   as city,
        upper(trim(seller_state))                    as state
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