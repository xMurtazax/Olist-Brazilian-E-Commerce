with source as (
    select * from {{ source('bronze', 'product_category_name_translation') }}
)
select * from source