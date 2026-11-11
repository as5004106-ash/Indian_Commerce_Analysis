#Customers Tier Revenue Contribution
select c.Customer_Tier,
count(distinct(c.Customer_ID)) as Unique_customers,
sum(Total_Amount)/ count(distinct(c.Customer_ID)) as Avg_Amounts_spend_percustomer,
sum(Total_Amount) as Total_Revenue
from sales s
join customers c
on s.Customer_ID = c.Customer_ID
group by c.Customer_Tier order by Total_Revenue desc;

#Top 5 cities by Customers base and volume
select c.city, 
count(Order_ID) as Total_Orders,
sum(Net_Order_Profit) as Total_netProfit
from sales s
join customers c
on s.Customer_ID = c.Customer_ID
group by C.City order by Total_netProfit desc 
limit 5;
