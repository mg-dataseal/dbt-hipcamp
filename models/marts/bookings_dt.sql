select
b.booking_id,
b.user_id,
b.site_id,
b.start_date,
b.end_date,
u.first_name,
u.last_name,
u.email,
u.phone,
s.type,
s.price_per_night,
p.property_id,
p.name as property_name,
datediff(day, b.start_date, b.end_date) as stay_length
from {{ ref('stg_bookings') }} b
left join {{ ref('stg_users') }} u 
on b.user_id = u.user_id
left join {{ ref('stg_sites') }} s 
on b.site_id = s.site_id
left join {{ ref('stg_properties') }} p 
on s.property_id = p.property_id