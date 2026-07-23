{{
    config(
        materialized = 'table'
    )
}}

with source as (

    select *
    from {{ source('raw_data', 'fedex_shipping_cost') }}

)

select
    shipment_tracking_number as tracking_number,
    recipient_country,
    service_description,
    net_charge_amount_billed_currency as net_amount_euro,
    shipment_date

from source