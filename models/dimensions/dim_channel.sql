{{
    config(
        materialized = 'view'
    )
}}

with channels as (

    select distinct
        channel_id,
        channel_name as channel_name

    from {{ ref('stg_orders') }}
    where channel_id is not null 

)

select
    {{ dbt_utils.generate_surrogate_key([
        'channel_id'
    ]) }} as channel_key,
    channel_id,
    channel_name

from channels