#Top 3 most Profitable products within every category

with Product_ranking as(
select Category, Product_Name, sum(Net_Order_Profit) as Total_profit,
row_number() over(partition by Category order by sum(Net_Order_Profit) desc) as Profit_rank
from sales s
join products p
on s.Product_ID = p.Product_ID
group by Category, Product_Name
) 

select *
from Product_ranking
where Profit_rank<4;

#Running Total of Revenue
select Order_Date,
sum(Net_Order_Profit) over(order by Order_Date) as Running_Total
from sales;

#Month to Month Revenue Growth

with Revenue_by_month as(
select date_format(Order_Date, '%Y-%m') as Order_Month,  sum(Net_Order_Profit) as Total_profit
from sales
group by date_format(Order_Date, '%Y-%m')
order by Order_Month
)

select*,
lag(Total_Profit) over(order by Order_month) as previous_month_profit,
(Total_profit- lag(Total_Profit) over(order by Order_month)) as Month_over_Month_Difference
from Revenue_by_month;

#Super-Customers(Spend more than average in their city)
select c.City, c.Customer_ID, c.Customer_Name, sum(Total_Spent) as Customer_Total_Spent
from sales s
join customers c
on s.Customer_ID = c.Customer_ID
group by c.Customer_ID, c.Customer_Name
having sum(Total_Spent)> (
select avg(Total_Spent)
from sales s1
join customers c1
on s1.Customer_ID = c1.Customer_ID
where c1.City = c.City
);


#Customer_Value_Quartiles 
with Customer_Total_Spent as(
select customer_id, customer_name, sum(total_spent) as Total_spent
from customers
group by customer_id, customer_name
),
Customer_quartile as(
select customer_id, customer_name, Total_spent,
ntile(4) over(order by Total_Spent desc) as Value_quartile
from Customer_Total_Spent
)

select customer_id, customer_name, Total_spent, Value_quartile,
case Value_quartile
   when 1 then 'High'
   when 2 then 'Medium High'
   when 3 then 'Medium Low'
   when 4 then 'Low'
end as Value_tier
from Customer_quartile;
