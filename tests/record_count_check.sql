{%set expected_counts={
    'customers':2,
    'emp':2,
    'orders':2
}%}

--test the count of records in each table.
{% for table,expected_count in expected_counts.items() %}
    select '{{table}}' as tablename,
        (select count(*) from {{source('staging_source',table)}}) as row_count,
        {{expected_count}} as expected_count
    where (select count(*) from {{source('staging_source',table)}})<{{expected_count}}
    {% if not loop.last %} union all {% endif %}

{%endfor%}