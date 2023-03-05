{{
    config(
        materialized='table'
    )
}}

select *
from RAW.HIPCAMP.SITES