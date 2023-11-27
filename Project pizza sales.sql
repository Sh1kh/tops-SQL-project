create database pizzadb;
use pizzadb;
desc pizza_sales;
select * from pizza_sales;







/* --- 1. Total Revenue ---*/
select sum(quantity*unit_price) as total_revenue from pizza_sales;


/*--- 2. Average Order Value-----*/
 
 select sum(quantity*unit_price)/count(distinct(order_id)) as Average_Order_Value  from pizza_sales;
 
 
/*---- 3. Total Pizzas Sold ------*/

select sum(quantity) as quantities_of_pizza_sold from pizza_sales ;


/*--- 4. Total Orders: The total number of orders placed.-----*/
select count(distinct(order_id)) as total_orders from pizza_sales;


/*---- 5. Average Pizza Per Order: The average number of pizzas sold per order,
calculated by dividing the total number of pizzas sold by the total number of
orders----*/

select sum(quantity)/count(distinct(order_id))  as Avg_pizza_per_order from pizza_sales;
 
 
 
 
/* --- Daily trend for total Orders ---*/
select order_date, dayname(order_date)as day_of_week , count(distinct order_id) as daily_orders 
from pizza_sales
 group by order_date 
 order by order_date ;


/*--- 2. Monthly Trend for Total Order----*/
SELECT 
    MONTHNAME(order_date),
    COUNT(DISTINCT (order_id)) AS total_orders
FROM
    pizza_sales
group  BY order_date ASC;



/*---- Percentage of Sales by Pizza Category:----*/
select pizza_category, round(sum(total_price)/ (select sum(total_price) 
   from pizza_sales) *100, 2) as per_of_sales from 
pizza_sales
 group by pizza_category;

/* ---- Percentage of Sales by Pizza Size: ----*/

select pizza_size, round(sum(total_price)/(select sum(total_price)
 from 
pizza_sales)*100 ,2 ) as per_of_sales from pizza_sales
group by pizza_size;



/*---- Total Pizza Sold by Pizza Category:----*/

select pizza_category, sum(quantity) as total_pizza_sold from pizza_sales 
group by pizza_category 
order by  sum(quantity) asc;
;

/*----- Top 5 Best Sellers by Revenue, Total Quantity and Total Orders:----*/
select distinct(pizza_name), sum(total_price) as revenue from pizza_sales
group by pizza_name
order by revenue desc
 limit 5   ;

select distinct(pizza_name), sum(quantity)as total_quantity from pizza_sales 
group by pizza_name 
order by sum(quantity) desc limit 5; 

select pizza_name, count(distinct order_id)as total_order from pizza_sales 
group by pizza_name 
order by sum(order_id)desc limit 5 ;



/*----- Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders: -----*/
select distinct(pizza_name), sum(total_price) as revenue from pizza_sales
group by pizza_name
order by revenue asc 
limit 5   ;

select distinct(pizza_name), sum(quantity) as total_quantity 
from pizza_sales
group by pizza_name 
order by sum(quantity) asc 
limit 5; 

select pizza_name, count(distinct order_id)as total_order
 from pizza_sales 
group by pizza_name 
order by sum(order_id)asc 
limit 5 ;
