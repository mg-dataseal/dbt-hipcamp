select
    id as booking_id,
    user_id,
    site_id,
    created_at::date as created_at,
    start_date::date as start_date,
    end_date::date as end_date
from {{ ref('raw_bookings') }} b
qualify row_number() over (partition by b.id order by b.id desc) = 1