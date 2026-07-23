
select
    _airbyte_raw_id, 
    _airbyte_extracted_at, 
    code as country_code, 
    year, 
    vat_rate, 
    member_states as member_state

from {{ source('raw_data', 'VAT_RATES') }}