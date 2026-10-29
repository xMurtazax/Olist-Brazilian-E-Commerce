with source as (
    select * from {{ source('bronze', 'product_category_name_translation') }}
)

select

    trim(product_category_name)             as product_category_name,
    trim(product_category_name_english)     as product_category_name_english

from source