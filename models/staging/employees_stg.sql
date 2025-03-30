with final as(
    select * from {{source('staging_source','emp')}}
)

select * from final