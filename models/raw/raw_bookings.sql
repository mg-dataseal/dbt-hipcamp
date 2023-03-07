{{
    config(
        materialized='table',
        transient = true
    )
}}

select *
--from RAW.HIPCAMP.BOOKINGS
from {{ source('hipcamp', 'bookings') }}