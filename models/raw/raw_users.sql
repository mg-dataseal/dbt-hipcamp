{{
    config(
        materialized='table'
    )
}}

select *
from RAW.HIPCAMP."users"