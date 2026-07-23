
select
    dbt_scd_id as product_key,
    product_id,

    title as product_name,
    product_type as category,
    handle,
    status,
    tags,

    created_at,
    published_at,

    dbt_valid_from as valid_from,
    dbt_valid_to as valid_to,

    case
        when dbt_valid_to is null then true
        else false
    end as is_current

from {{ ref('snap_products') }}