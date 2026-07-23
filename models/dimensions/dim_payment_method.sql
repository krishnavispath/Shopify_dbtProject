{{
    config(
        materialized = 'view'
    )
}}

select distinct
    {{ dbt_utils.generate_surrogate_key([
        'p.value::string'
    ]) }} as payment_method_key,

    p.value::string as payment_method_name

from {{ ref('stg_orders') }} as orders,
lateral flatten(
    input => try_parse_json(orders.payment_gateway_names)
) as p

where p.value is not null