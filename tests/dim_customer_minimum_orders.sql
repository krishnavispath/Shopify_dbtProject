select * from {{ ref('dim_customer') }} 
where orders_count < 1