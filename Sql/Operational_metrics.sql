select state, 
avg(Delivery_Days) as Avg_Delievery_days,
sum(Shipping_Cost) as total_shipping_cost,
sum(Net_Order_Profit) as total_NOP
from sales s
group by State order by total_NOP desc;

select Order_Status, 
avg(Delivery_Days) as Avg_Delievery_days,
sum(Shipping_Cost) as total_shipping_cost,
sum(Net_Order_Profit) as total_NOP
from sales s
group by Order_Status order by total_NOP desc;