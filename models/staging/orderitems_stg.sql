select
OrderItemID, 
OrderID,
ProductID,
Quantity,
UnitPrice,
Quantity*UnitPrice as TotalPrice,
Updated_at
from
{{source('staging_source','orderitems')}}