{{
    config(
        materialized='table'
    )
}}

select *
--from RAW.HIPCAMP.SITES
from {{ source('hipcamp', 'sites') }}