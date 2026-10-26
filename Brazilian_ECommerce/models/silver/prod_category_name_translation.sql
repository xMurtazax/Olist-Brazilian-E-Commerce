select
    *
from
    {{ source('bronze', 'product_category_name_translation') }}