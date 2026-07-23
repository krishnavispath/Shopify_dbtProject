

{{
    config(
        materialized = 'table'
    )
}}

select
    _airbyte_raw_id,
    _airbyte_extracted_at,
    _airbyte_meta,
    tracking_number,
    split_part(tracking_number, '/', 1) as cleaned_tracking_number,
    net_amount_euro,
    recipient_country,
    service_description,
    shipment_date

from {{ source('raw_data', 'shipping_spring_shipping') }}