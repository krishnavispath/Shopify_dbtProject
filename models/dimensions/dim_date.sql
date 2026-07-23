
with date_spine as (

    {{
        dbt_utils.date_spine(
            datepart = "day",
            start_date = "to_date('2015-01-01')",
            end_date = "to_date('2035-12-31')"
        )
    }}

)

select
    to_number(to_char(date_day, 'YYYYMMDD')) as date_key,
    date_day as full_date,
    year(date_day) as year,
    monthname(date_day) as month_name,
    dayname(date_day) as day_name

from date_spine