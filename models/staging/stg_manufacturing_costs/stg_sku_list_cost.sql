

{{
   config(
    materialized='table'
) 
}}

select
    _airbyte_raw_id,
    _airbyte_extracted_at,
    sku,
    cost,
    name,
    size,
    year,
    category

from {{ source('raw_data', 'sku_list_cost') }}