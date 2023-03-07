with

joined as (
    select
        b.created_at,
        b.id as booking_id,
        b.user_id,
        b.site_id,
        b.start_date,
        b.end_date,
        datediff('day', b.start_date, b.end_date) as no_of_nights,
        no_of_nights * s.price_per_night as total_price,
        p.name as property_name,
        rank() over (partition by b.user_id order by b.created_at) as booking_number,
        p.id as property_id,
        u.first_name,
        u.last_name,
        u.email,
        u.phone
    from {{ref('raw_bookings')}} b
    left join {{ref('raw_users')}} u
        on b.user_id = u.id
    left join {{ref('raw_sites')}} s
        on b.site_id = s.id
    left join {{ref('raw_properties')}} p
        on s.property_id = p.id
)
select * from joined