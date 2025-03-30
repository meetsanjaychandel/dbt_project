{{ dbt_utils.postgres__deduplicate(
    relation=source('staging_source', 'customers'),
    partition_by='customerid',
    order_by="updated_at desc",
)
}}