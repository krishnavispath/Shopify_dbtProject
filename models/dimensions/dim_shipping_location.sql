{{
    config(
        materialized='view'
    )
}}

select distinct
    {{ dbt_utils.generate_surrogate_key([
        'shipping_address:city', 
        'shipping_address:province', 
        'shipping_address:country', 
        'shipping_address:zip'
    ]) }} as shipping_location_key,

    shipping_address:address1::string as address_line,
    shipping_address:address2::string as address_line_2,
    shipping_address:city::string as city,
    shipping_address:province::string as state,
    shipping_address:country::string as country,
    shipping_address:country_code::string as country_code,
    shipping_address:zip::string as postal_code,
    shipping_address:phone::string as phone

from {{ ref('stg_orders') }}

where shipping_address is not null