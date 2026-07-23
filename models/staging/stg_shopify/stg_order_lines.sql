
{{
    config(
        materialized = 'table'
    )
}}

select
    order_id,
    order_name,
    order_created_at,
    currency,
    customer_id,
    financial_status,
    order_fulfillment_status,
    line_item_id,
    unique_identifier,
    fulfillable_quantity,
    fulfillment_service,
    line_item_fulfillment_status,
    product_id,
    variant_id,
    sku,
    name,
    title,
    variant_title,
    vendor,
    variant_inventory_management,
    product_exists,
    quantity,
    grams,
    gift_card,
    requires_shipping,
    taxable,
    price,
    total_discount,
    presentment_money_amount,
    presentment_money_currency,
    shop_money_amount,
    shop_money_currency,
    total_discount_presentment_money_amount,
    total_discount_presentment_money_currency,
    total_discount_shop_money_amount,
    total_discount_shop_money_currency_code

from {{ source('raw_data', 'order_line_items') }}