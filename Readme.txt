Indian E-Commerce Sales Analysis

Overview:
This projects aims an end to end data analysis solution evaluating transactional performance, customer demographics, and product category trends for an Indian E-commerce bussiness. Utilizing Excel for exploratory data profiling, Sql for relational querying and metrics extraction, and Power BI for interactive visualisation, this projects transforms raw transactional data into actionable bsuiness insights.

Objectives:
- Analyze sales performance across product categories, customer segments, and geographic regions.
- Evaluate core business metrics including Total Revenue, Average Order Value (AOV), and Customer Lifetime Value (LTV).
- Assess fulfillment performance by tracking delivery timelines and order cancellation rates.
- Build an interactive, executive-ready dashboard to support data-driven decision-making.

Data Architecture:
The analysis is based on a relational dataset containing three core tables:
1. `customers.csv`: Demographic and registration details for 40,000 customers.
2. `products.csv`: Catalog information including original price, discounts, ratings, and stock for 2,000 products.
3. `sales.csv`: Transactional records encompassing 250,000 order lines with shipping costs, coupon discounts, payment modes, and order statuses.

Data Preparation & Cleaning (Excel / Power Query):

[ customers Dataset]
- Standardization: Capitalized text values in the `Gender` column (`Male`, `Female`) for consistency.
- Data Type Alignment: Explicitly set data types across all columns, converting `Total_Spent` to Currency.
- Data Quality Check: Audited all fields for null values, duplicates, and formatting errors; confirmed zero missing critical fields.
- Feature Engineering: Added a calculated column `Spent_Per_Order` using conditional logic (`if Total_Orders = 0 then 0 else Total_Spent / Total_Orders`) to derive average customer order value while preventing division-by-zero errors.
-Closed and load data into excel.

[Products Dataset]

-Data Type Alignment: Standardized all price-related fields (Original_Price, Selling_Price, Discount_Amount) to Currency format.
-Data Quality Check: Audited the catalog for null values and pricing anomalies; verified data integrity.
-Feature Engineering: Created a Discount_Category conditional column to segment products into distinct promotional bins (No Discount, Low, Moderate, High) to enable granular price-sensitivity analysis in Power BI.

[Sales Dataset]

-Data Type Alignment: Converted all monetary fields (Unit_Price, Order_Value, Shipping_Cost, Coupon_Discount, Total_Amount) to Currency format.

-Handling Missing Values: Standardized missing values in text columns by replacing blank entries in Review_Text with "No review Written" and blank entries in Coupon_Code with "No code used" to ensure clear visualization filtering.

-Preserving Statistical Integrity: Retained null values in the Rating column rather than imputing zeros, preventing artificial skewing of average product rating metrics
.
-Feature Engineering: Created a Delivery_Days calculated column (Delivery_Date minus Order_Date) to measure order fulfillment duration, and derived Net_Revenue to evaluate true profitability per order line.


