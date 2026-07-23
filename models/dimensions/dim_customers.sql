
select
    dbt_scd_id as customer_key,
    customer_id,
    accepts_marketing,
    first_name,
    last_name,
    email,
    phone,
    state,
    province,
    country,

    dbt_valid_from as valid_from,
    dbt_valid_to as valid_to,

    case
        when dbt_valid_to is null then true
        else false
    end as is_current

from {{ ref('snap_customers') }}