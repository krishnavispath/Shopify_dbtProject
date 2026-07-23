{{
    config(
        materialized = 'table'
    )
}}

select
    id as balance_transaction_id,
    source_order_id,
    fee,
    net,
    amount,
    type,
    transaction_type,
    payout_id,
    payout_status,
    currency,
    source_id,
    source_order_transaction_id,
    processed_at,
    adjustment_reason

from {{ source('raw_data', 'balance_transactions') }}