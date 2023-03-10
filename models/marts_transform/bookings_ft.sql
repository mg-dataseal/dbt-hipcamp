select
b.booking_id,
b.user_id,
b.site_id,
b.created_at,
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
rank() over (partition by b.user_id order by b.created_at) as booking_number, -- if order placed the same day, booking number would be the same
row_number() over (partition by b.user_id order by b.created_at) as booking_number2, -- alternative to the above
datediff(day, b.start_date, b.end_date) as duration,
duration * s.price_per_night as total_price
from {{ ref('stg_bookings') }} b
left join {{ ref('stg_users') }} u 
on b.user_id = u.user_id
left join {{ ref('stg_sites') }} s 
on b.site_id = s.site_id
left join {{ ref('stg_properties') }} p 
on s.property_id = p.property_id