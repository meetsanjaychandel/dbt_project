{{config(materialized='incremental',
unique_key='orderid')}}

with source_data as(
select
orderid,
orderdate,
customerid,
employeeid,
storeid,
status as StatusDesc,
updated_at
from {{source('staging_source','orders')}}
)

{% if is_incremental() %}
, updated_rows AS (
    DELETE FROM {{ this }}
    WHERE orderid IN (SELECT orderid FROM {{source('staging_source','orders')}})
    AND updated_at >= (SELECT MAX(updated_at) FROM {{ this }})
)
{% endif %}
select * from source_data
