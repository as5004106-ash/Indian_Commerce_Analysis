select Discount_Category, 
count(Order_ID) as Quantity_ordered,
avg(Net_Order_Profit) as Avg_Profit_per_order
from sales s
join products p
on s.Product_ID = p.Product_ID
group by Discount_Category order by Quantity_ordered desc;