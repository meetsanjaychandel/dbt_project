select os.StoreID,
    sum(OFACT.revenue) as totalrevenue
from{{ref('orders_stg')}} os
join {{ref('orders_fact')}} ofact on os.orderid= ofact.orderid
group by 1