{{
    config(
        materialized = 'view'
    )
}}

with vat_rates as (

    select distinct
        upper(trim(country_code)) as country_code,
        year,
        vat_rate,
        member_state as member_state

    from {{ ref('stg_vat_rates') }}
    where country_code is not null and year is not null

)

select
    {{ dbt_utils.generate_surrogate_key([
        'country_code',
        'year'
    ]) }} as vat_rate_key,
    country_code,
    year,
    vat_rate,
    member_state

from vat_rates