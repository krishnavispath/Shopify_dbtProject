{{
    config(
        materialized = 'view'
    )
}}

with shipping_providers as (

    select distinct tracking_company as shipping_provider_name
    from {{ ref('stg_shopify_fulfillments') }}
    where tracking_company is not null


)

select
    {{ dbt_utils.generate_surrogate_key([
        'shipping_provider_name'
    ]) }} as shipping_provider_key,
    shipping_provider_name

from shipping_providers