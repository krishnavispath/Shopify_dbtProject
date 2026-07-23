
select
    id as customer_id,
    first_name,
    last_name,
    email,
    phone,
    state,
    orders_count,
    total_spent,
    province,
    country,
    created_at,
    accepts_marketing,
    _fivetran_synced

from {{ source('raw_data', 'customers') }}