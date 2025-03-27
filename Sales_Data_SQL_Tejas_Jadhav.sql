-- 1} top 5 customers by spend
select
customers.customer_name ,
sum(total_amount) as total_spent 
from customers
join orders on customers.customer_id= orders.customer_id 
where orders.status = "delivered"
group by customers.customer_name
order by total_spent desc limit 5 ;

-- 2} count toatal orders 
SELECT 
    COUNT(*)
FROM
    orders
    
    -- 3}count total cutomers 

SELECT 
    COUNT(*)
FROM
    customers
    
    -- 4}count customers from mumbai location

SELECT 
    COUNT(*)
FROM
    customers
WHERE
    location = 'mumbai';
    
    -- 5} monthly sale data 


select * from orders
 where
 order_date between "2023-02-01" and "2023-02-28";
 
 -- 6} total revenue 


select sum(total_amount) as final_amount from orders 

-- 7} most sold product by quantity

SELECT 
    products.product_name,
    SUM(order_details.quantity) AS total_spend
FROM
    order_details
        JOIN
    products ON products.product_id = order_details.order_detail_id
GROUP BY products.product_name
ORDER BY total_spend DESC
LIMIT 5; 

-- 8} catagory wise sell

SELECT 
    category, SUM(order_details.subtotal) AS total_revenue
FROM
    order_details
        JOIN
    products ON order_details.product_id = products.product_id
GROUP BY products.category
ORDER BY total_revenue DESC
LIMIT 5
;

-- 9} total rejected quntity

select orders.status,

count(orders.status) as total_rejected from orders
where 
status = "cancelled"
group by orders.status
order by total_rejected desc limit 5;

-- 10} top revenue generated city

SELECT 
    customers.location,
    COUNT(order_details.quantity) AS top_city
FROM
    order_details
        JOIN
    customers ON customers.customer_id = order_details.order_detail_id
GROUP BY customers.location
ORDER BY top_city DESC
LIMIT 5;