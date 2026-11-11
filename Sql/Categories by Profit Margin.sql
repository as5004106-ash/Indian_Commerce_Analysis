select Category, 
count(Order_ID) as Quantity_sold,
sum(Net_Order_Profit) as Total_NetProfit
from sales s
join products p
on s.Product_ID = p.Product_ID
group by Category order by Total_NetProfit desc;