
select distinct
    {{ dbt_utils.generate_surrogate_key([
        'billing_address:city', 
        'billing_address:province', 
        'billing_address:country', 
        'billing_address:zip']) }} as billing_location_key,
    billing_address:address1::string as address_line,
    billing_address:address2::string as address_line_2,
    billing_address:city::string as city,
    billing_address:province::string as state,
    billing_address:country::string as country,
    billing_address:country_code::string as country_code,
    billing_address:zip::string as postal_code,
    billing_address:phone::string as phone
from {{ ref('stg_orders') }}
where billing_address is not null