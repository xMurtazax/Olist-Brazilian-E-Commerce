select
    {{ dbt_utils.generate_surrogate_key(['review_id', 'order_id']) }} as review_key,
    review_id,
    order_id,
    review_score,
    review_creation_date,
    review_answer_timestamp
from {{ ref('order_reviews') }}