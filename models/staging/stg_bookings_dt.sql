select
b.id as booking_id,
b.user_id as user_id,
b.site_id as site_id,
b.start_date,
b.end_date,
u.first_name,
u.last_name,
u.email,
u.phone,
s.type,
s.price_per_night,
p.id as property_id,
p.name as property_name,
datediff(day, b.start_date, b.end_date) as stay_length
from {{ ref('raw_bookings') }} b
left join {{ ref('raw_users') }} u 
on b.user_id = u.id
left join {{ ref('raw_sites') }} s 
on b.site_id = s.id
left join {{ ref('raw_properties') }} p 
on s.property_id = p.id