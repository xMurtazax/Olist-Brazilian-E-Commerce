select
    *
from
    {{ source('bronze', 'sellers') }}