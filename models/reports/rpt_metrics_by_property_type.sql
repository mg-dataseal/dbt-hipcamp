select 
b.type as property_type,
avg(b.price_per_night) as ave_price,
avg(b.stay_length) as ave_stay_length
from {{ ref('bookings_dt') }} b
group by 1