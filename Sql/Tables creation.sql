-- 1. Create Customers Table
CREATE TABLE customers (
    Customer_ID VARCHAR(50) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Gender VARCHAR(20),
    Age INT,
    Age_Group VARCHAR(20),
    Date_Of_Birth DATE,
    Email VARCHAR(100),
    Phone VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Pincode VARCHAR(20),
    Registration_Date DATE,
    Customer_Tier VARCHAR(50),
    Total_Orders INT,
    Total_Spent DECIMAL(12,2),
    Spent_Per_Order DECIMAL(12,2)
);

-- 2. Create Products Table
CREATE TABLE products (
    Product_ID VARCHAR(50) PRIMARY KEY,
    Product_Name VARCHAR(255),
    Category VARCHAR(100),
    Brand VARCHAR(100),
    Original_Price DECIMAL(10,2),
    Discount_Percent DECIMAL(5,2),
    Discount_Amount DECIMAL(10,2),
    Selling_Price DECIMAL(10,2),
    Stock_Quantity INT,
    Weight_kg DECIMAL(6,2),
    Avg_Rating DECIMAL(3,2),
    Total_Reviews INT,
    Discount_Category VARCHAR(50)
);

-- 3. Create Sales Table (with Foreign Keys)
CREATE TABLE sales (
    Order_ID VARCHAR(50),
    Customer_ID VARCHAR(50),
    Product_ID VARCHAR(50),
    Order_Date DATE,
    Order_Time TIME,
    Delivery_Date DATE,
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Order_Value DECIMAL(12,2),
    Shipping_Cost DECIMAL(10,2),
    Coupon_Code VARCHAR(50),
    Coupon_Discount DECIMAL(10,2),
    Total_Amount DECIMAL(12,2),
    Payment_Mode VARCHAR(50),
    Order_Status VARCHAR(50),
    Rating INT,
    Review_Text TEXT,
    City VARCHAR(50),
    State VARCHAR(50),
    Customer_Age INT,
    Customer_Age_Group VARCHAR(20),
    Delivery_Days INT,
    Net_Order_Profit DECIMAL(12,2),
    FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES products(Product_ID)
);

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/YourUsername/Downloads/sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;