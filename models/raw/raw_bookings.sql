{{
    config(
        materialized='table'
    )
}}

select *
--from RAW.HIPCAMP.BOOKINGS
from {{ source('hipcamp', 'bookings') }}