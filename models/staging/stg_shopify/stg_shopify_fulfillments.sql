
select
    id,
    order_id,
    tracking_number,
    tracking_company,
    fulfillment_name,
    location_id,
    fulfillment_status,
    shipment_status,
    fulfillment_service,
    tracking_url,
    created_at,
    updated_at,
    inventory_management_method

from {{ source('raw_data', 'fulfillments') }}