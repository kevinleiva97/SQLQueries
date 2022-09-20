

select 
order_Number
, case 
	when pen_qty > can_qty and ((pen_qty > 0) or pen_qty = ship_qty )
	or (pen_qty > 0) 
 then 'Pending' 
	when can_qty > ship_qty or can_qty >= ship_qty or can_qty > ship_qty then 'Cancelled'
	when  ship_qty > (pen_qty+can_qty) then 'Shipped'
end as test
from 
(
select  Order_Number, 
sum(case when [status]='SHIPPED' then 1 else 0 end) as ship_qty, 
sum(case when [status]='PENDING' then 1 else 0 end) as pen_qty, 
sum(case when [status]='CANCELLED' then 1 else 0 end) as can_qty 
FROM [Customer_ord_lines]
group by Order_Number
having sum(case when [status]='SHIPPED' then 1 else 0 end) > 0
or sum(case when [status]='PENDING' then 1 else 0 end) > 0 
or sum(case when [status]='CANCELLED' then 1 else 0 end) > 0 ) a



  SELECT TOP (1000) [Order_number]
      ,[Item_name]
      ,[status]
  FROM [June].[dbo].[Customer_ord_lines]


