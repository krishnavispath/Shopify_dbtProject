
with 
source as (
    select * from {{ source('raw_data', 'products') }}
),

renamed as (
    select
        product_id,
        tags,
        title,
        handle,
        status,
        options,
        created_at,
        deleted_at,
        updated_at,
        product_type,
        published_at,
        published_scope,
        template_suffix,
    from source

)

select * from renamed