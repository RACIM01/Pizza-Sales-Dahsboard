select * from pizza_sales;

-- Total revenue 
select sum(total_price) as Total_Revenue from pizza_sales;
-- Average revenue by order 
select avg(cast (total_price_sum as decimal (10,2)) ) as Avg_total_revenue
from (select order_id, sum(total_price) as total_price_sum from pizza_sales group by order_id) as subquery_alias;
-- total pizzas sold 
select sum(quantity) as Total_Pizza_Solded from pizza_sales;
-- Total orders
select count(Distinct order_id) as Total_Orders from pizza_sales;
-- average pizza per order
SELECT AVG( cast (quantity_sum as decimal (10,2)) ) as Average_pizza_order 
FROM (SELECT order_id, SUM(quantity) AS quantity_sum FROM pizza_sales GROUP BY order_id) AS subquery_alias;

-- chart number 1 Total orders by day name 

select datename(DW , order_date) as day_name, count(distinct order_id) as orders 
from pizza_sales 
group by datename(DW , order_date);

-- chart nuber 2 Totral

select datename(MM , order_date) as Month_name, count(distinct order_id) as orders
from pizza_sales
group by datename(MM , order_date);

-- chart 3 percentage of sales by categorie 
select pizza_category, sum(total_price) as total_price, sum(total_price) / (select sum(total_price) from pizza_sales) * 100 as Percentage_Sale
from pizza_sales
group by pizza_category;

-- chart 4 percentage of sales by Size 
select pizza_size, sum(total_price) as total_price, sum(total_price) / (select sum(total_price) from pizza_sales) * 100 as Percentage_Sale
from pizza_sales
group by pizza_size
order by Percentage_Sale DESC;

-- chart 5 total pizza by pizza category

select pizza_category, sum(quantity) as total_Pizza
from pizza_sales
group by pizza_category
order by total_Pizza DESC;

-- chart 6 best 5 pizza 

select TOP 5 pizza_name, sum(total_price) as revenue, sum(quantity) as Total_Quantity, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by revenue desc;

-- chart 7 worst 5 pizza 

select TOP 5 pizza_name, sum(total_price) as revenue, sum(quantity) as Total_Quantity, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by revenue ASC;