use pizzadb;
select * from pizza_sales;

-- 1. Total Revenue
select round(sum(total_price),2) as total_revenue
from pizza_sales;

-- 2. Average Order Value
select round(sum(total_price) / count(distinct order_id),2) as avg_order_value
from pizza_sales;

-- 3. Total Pizzas Sold
select sum(quantity) as total_pizzas_sold
from pizza_sales;

-- 4. Total Orders
select count(distinct order_id) as total_orders
from pizza_sales;

-- 5. Average Pizzas Per Order
select round(sum(quantity) / count(distinct order_id),2) as avg_pizzas_per_order
from pizza_sales;

-- Daily Trend for Total Orders
select dayname(order_date) as order_day , count(distinct order_id) as total_orders
from pizza_sales
group by dayname(order_date)
order by total_orders asc;

-- Monthly Trend for Orders
select monthname(order_date) as order_month , count(distinct order_id) as total_orders
from pizza_sales
group by monthname(order_date)
order by total_orders asc;

-- % of Sales by Pizza Category
select pizza_category , round(sum(total_price),2) as total_revenue , round((sum(total_price)*100)/(select sum(total_price) from pizza_sales),2) as percent_of_sales
from pizza_sales
group by pizza_category; 

--  % of Sales by Pizza Size
select pizza_size , round(sum(total_price),2) as total_revenue , round((sum(total_price)*100)/(select sum(total_price) from pizza_sales),2) as percent_of_sales
from pizza_sales
group by pizza_size; 

-- Total Pizzas Sold by Pizza Category
select pizza_category ,sum(quantity) as pizzas_sold
from pizza_sales 
group by pizza_category;

-- Top 5 Pizzas by Revenue
select pizza_name, round(sum(total_price),2) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue desc limit 5;

-- Bottom 5 Pizzas by Revenue
select pizza_name, round(sum(total_price),2) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue asc limit 5;

-- Top 5 Pizzas by Quantity
select pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity desc limit 5;

-- Bottom 5 Pizzas by Quantity
select pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity asc limit 5;

-- Top 5 Pizzas by Total Orders
select pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc limit 5;

-- Bottom 5 Pizzas by Total Orders
select pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders asc limit 5;



