{{
    config(
        materialized='table'
    )
}}

select *
--from RAW.HIPCAMP."users"
from {{ source('hipcamp', '"users"') }}