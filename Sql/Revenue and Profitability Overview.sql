#Summary Metrics:

select
sum(Order_Value) as gross_order_value,
sum(Shipping_Cost) as Total_shipping_cost,
sum(Total_Amount) as Amount_collected,
sum(Net_Order_Profit) as Total_Net_Order_Profit
from sales;
#Profitability by payment mode

select Payment_Mode,
count(Order_ID) as Orders_placed,
sum(Total_Amount) as Total_Revenue,
sum(Net_Order_Profit) as Total_net_profit,
avg(Net_Order_Profit) as Average_NOP
from sales
group by Payment_Mode order by Total_Revenue desc;

