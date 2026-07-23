{{
    config(
        materialized = 'table'
    )
}}

select
    _airbyte_raw_id,
    _airbyte_extracted_at,
    cpc,
    cpm,
    cpp,
    ctr,
    ad_id,
    reach,
    spend,
    clicks,
    ad_name,
    country,
    date_stop,
    created_time,
    cost_per_unique_click

from {{ source('raw_data', 'facebook_ads') }}