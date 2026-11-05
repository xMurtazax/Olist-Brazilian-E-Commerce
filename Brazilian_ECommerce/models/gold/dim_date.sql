with dates as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2016-01-01' as date)",
        end_date="cast('2019-01-01' as date)"
    ) }}
)

select
    cast(date_format(date_day, 'yyyyMMdd') as int) as date_key,
    cast(date_day as date)      as full_date,
    year(date_day)              as year,
    quarter(date_day)           as quarter,
    month(date_day)             as month,
    date_format(date_day, 'MMMM') as month_name,
    day(date_day)               as day_of_month,
    dayofweek(date_day)         as day_of_week,
    date_format(date_day, 'EEEE') as day_name,
    dayofweek(date_day) in (1, 7) as is_weekend
from dates