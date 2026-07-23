{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

with transactions as(
    select
        transaction_id,
        order_id,
        transaction_kind,
        transaction_status,
        payment_gateway,
        amount,
        created_at,
        fee_amount_local_currency,
        fee_amount_currency_id,
        settle_amount,
        exchange_rate

    from {{ source('raw_data', 'transactions') }}
)
select * from transactions
where transaction_id is not null

{% if is_incremental() %}
    and created_at > (select max(created_at) from {{ this }})
{% endif %}