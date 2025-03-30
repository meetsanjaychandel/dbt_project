{{config(materialized='table')}}

with source_customers as(
select * from {{ source("source_shop", "customers") }}
)

select * from source_customers
