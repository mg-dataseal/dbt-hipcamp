{{
    config(
        materialized='table'
    )
}}

select *
--from RAW.HIPCAMP.PROPERTIES
from {{ source('hipcamp', 'properties') }}