USE globalstoredb ;

SELECT * FROM customers ;
SELECT * FROM orders ;
SELECT * FROM products ;
SELECT * FROM order_items ;

SHOW TABLES;

ALTER TABLE customers
ADD PRIMARY KEY (customer_id);

ALTER TABLE products
ADD PRIMARY KEY (product_id);

ALTER TABLE orders
ADD PRIMARY KEY (order_id);

ALTER TABLE order_items
ADD PRIMARY KEY (order_item_id);

-- Orders → Customers 
ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

-- Order Items → Orders 
ALTER TABLE order_items
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Order Items → Products
ALTER TABLE order_items
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES products(product_id);

USE globalstoredb;

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items; 

-- -- -- --- -- -- -- -- -- -- -- -- -- -- --- -- -- -- -- -- -- -- -- -- -- -- -- -- -- - -- -- -- -- -- -- -- -- -- -- - -- - -- - -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
--                                                              Basic SQL Queries
-- -- -- -- -- -- -- -- -- - - -- --- - -- -- -- - -- -- -- -- -- -- -- -- --- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- - -- -- -- -- -- -- -- -- -- -- --- -- -- -- --

-- 1 Show all customers
SELECT * 
FROM customers ;

-- 2 Show first 10 customers
SELECT * 
FROM customers 
LIMIT 10 ;

-- 3 Show customer name and city
SELECT customer_name , city 
FROM customers ;

-- 4 Show unique cities from customers
SELECT DISTINCT city 
FROM customers ;

-- 5 Show customers from Ahmedabad
SELECT * FROM customers 
WHERE city='Ahmedabad' ;

-- 6 Show customers from Mumbai
SELECT * FROM customers
 WHERE city='Mumbai' ;

-- 7 Show customers not from Delhi
SELECT * FROM customers 
WHERE city NOT IN ('Delhi') ;

-- 8 Show products with price greater than 5000
SELECT * FROM products 
WHERE price > 5000 ;

-- 9 Show products with price less than 500
SELECT * FROM products 
WHERE price < 500 ;

-- 10 Show products between price 1000 and 3000
SELECT * FROM products 
WHERE price 
BETWEEN 1000 AND 3000 ;

-- 11 Show all electronics products
SELECT * FROM products 
WHERE category='Electronics' ;

-- 12 Show all furniture products
SELECT * FROM products 
WHERE category='Furniture' ;

-- 13 Show all sports products
SELECT * FROM products 
WHERE category='Sports' ;

-- 14 Show orders with status Completed
SELECT * FROM orders 
WHERE status='Completed' ;

-- 15 Show orders with status Pending
SELECT * FROM orders 
WHERE status='Pending' ;

-- 16 Show orders with status Cancelled
SELECT * FROM orders 
WHERE status='Cancelled' ;

-- 17 Show orders placed after 2023
SELECT * FROM orders 
WHERE order_date > '2023-01-01' ;

-- 18 Show orders placed before 2022
SELECT * FROM orders 
WHERE order_date < '2022-01-01' ;

-- 19 Show customers sorted by signup date
SELECT * FROM customers 
ORDER BY signup_date ;

-- 20 Show customers sorted by latest signup
SELECT * FROM customers 
ORDER BY signup_date DESC ;

-- 21 Show products sorted by price
SELECT * FROM products 
ORDER BY price ;

-- 22 Show products sorted by highest price
SELECT * FROM products 
ORDER BY price DESC ;

-- 23 Show top 5 expensive products
SELECT * FROM products 
ORDER BY price DESC 
LIMIT 5 ;

-- 24 Show cheapest 5 products
SELECT * FROM products 
ORDER BY price 
LIMIT 5 ;

-- 25 Show first 20 orders
SELECT * FROM orders 
LIMIT 20 ;

-- 26 Show customers from Mumbai OR Delhi
SELECT * FROM customers 
WHERE city='Mumbai' 
OR city='Delhi'
ORDER BY customer_id ;

-- 27 Show customers from Ahmedabad AND signup after 2022
SELECT * FROM customers 
WHERE city='Ahmedabad' 
AND signup_date>'2022-01-01' ;

-- 28 Show products not in Electronics category
SELECT * FROM products 
WHERE category NOT IN ('Electronics') ;

-- 29 Show customers whose name starts with Customer_1
SELECT * FROM customers 
WHERE customer_name LIKE 'Customer_1%' ;

-- 30 Show customers whose name ends with 5
SELECT * FROM customers 
WHERE customer_name LIKE '%5' ;

-- 31 Show customers whose name contains 25
SELECT * FROM customers 
WHERE customer_name LIKE '%25%' ;

-- 32 Show orders sorted by order date
SELECT * FROM orders 
ORDER BY order_date ;

-- 33 Show latest orders
SELECT * FROM orders 
ORDER BY order_date DESC 
LIMIT 10 ;

-- 34 Show products price greater than 2000
SELECT * FROM products 
WHERE price > 2000 ;

-- 35 Show products price less than 1000
SELECT * FROM products 
WHERE price < 1000 ;

-- 36 Show products with category Clothing
SELECT * FROM products 
WHERE category='Clothing' ;

-- 37 Show products with category Stationery
SELECT * FROM products 
WHERE category='Stationery' ;

-- 38 Show customers from Jaipur
SELECT * FROM customers 
WHERE city='Jaipur' ;

-- 39 Show customers from Bangalore
SELECT * FROM customers 
 WHERE city='Bangalore' ;

-- 40 Show customers from Hyderabad
SELECT * FROM customers 
WHERE city='Hyderabad' ;

-- 41 Show orders with customer_id less than 100
SELECT * FROM orders 
WHERE customer_id < 100 ;

-- 42 Show orders with customer_id greater than 4000
SELECT * FROM orders 
WHERE customer_id > 4000 ;

-- 43 Show order_items quantity greater than 5
SELECT * FROM order_items 
WHERE quantity > 5 ;

-- 44 Show order_items quantity less than 3
SELECT * FROM order_items 
WHERE quantity < 3 ;

-- 45 Show order_items sorted by quantity
SELECT * FROM order_items 
ORDER BY quantity ;

-- 46 Show order_items sorted by highest quantity
SELECT * FROM order_items 
ORDER BY quantity DESC ;

-- 47 Show products with price between 2000 and 6000
SELECT * FROM products 
WHERE price 
BETWEEN 2000 AND 6000 ;

-- 48 Show customers with signup after 2021
SELECT * FROM customers 
WHERE signup_date > '2021-01-01' ;

-- 49 Show customers with signup before 2020
SELECT * FROM customers 
WHERE signup_date < '2020-01-01' ;

-- 50 Show orders with order_id between 100 and 200
SELECT * FROM orders 
WHERE order_id 
BETWEEN 100 AND 200 ;

-- 51 Show order_items with quantity 1
SELECT * FROM order_items 
WHERE quantity=1 ;

-- 52 Show order_items with quantity 10
SELECT * FROM order_items 
WHERE quantity=10 ;

-- 53 Show products sorted alphabetically
SELECT * FROM products 
ORDER BY product_name ;

-- 54 Show customers sorted by city
SELECT * FROM customers 
ORDER BY city ;

-- 55 Show products from Electronics or Furniture
SELECT * FROM products 
WHERE category='Electronics' OR category='Furniture';

-- 56 Show products price above 8000
SELECT * FROM products 
WHERE price > 8000 ;

-- 57 Show orders with status Returned
SELECT * FROM orders 
WHERE status='Returned' ;

-- 58 Show order_items sorted by unit_price
SELECT * FROM order_items 
ORDER BY unit_price ;

-- 59 Show order_items with price greater than 5000
SELECT * FROM order_items 
WHERE unit_price > 5000 ;

-- 60 Show top 10 expensive order items
SELECT * FROM order_items 
ORDER BY unit_price 
DESC LIMIT 10 ; 

-- =======================================================================================================================================
--                                                       AGREGATE QUIERIES 
-- =========================================================================================================================================

-- 61 Count total customers in the database
SELECT COUNT(*) 
FROM customers ;

-- 62 Count total products
SELECT COUNT(*) 
FROM products ;

-- 63 Count total orders
SELECT COUNT(*) 
FROM orders ;

-- 64 Count total order items
SELECT COUNT(*) 
FROM order_items ;

-- 65 Count customers per city
SELECT city, COUNT(*) 
AS total_customers
FROM customers
GROUP BY city ;

-- 66 Count products per category
SELECT category, COUNT(*) 
AS total_products
FROM products
GROUP BY category ;

-- 67 Count orders per status
SELECT status, COUNT(*) 
AS total_orders
FROM orders
GROUP BY status ;

-- 68 Count orders per year
SELECT YEAR(order_date) AS year, COUNT(*)
FROM orders
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date) ;

-- 69 Count orders per month
SELECT MONTH(order_date) AS month, COUNT(*)
FROM orders
GROUP BY MONTH(order_date) 
ORDER BY MONTH(order_date) ;

-- 70 Average product price
SELECT ROUND(AVG(price),2) AS avg_product_price
FROM products ;

-- 71 Highest product price
SELECT MAX(price) AS highest_product_price
FROM products ;

-- 72 Lowest product price
SELECT MIN(price) AS lowest_price_product
FROM products ;

-- 73 Total quantity sold
SELECT SUM(quantity) AS total_quntity_sold
FROM order_items ;

-- 74 Average quantity per order item
SELECT ROUND(AVG(quantity),2)
FROM order_items ;

-- 75 Maximum quantity in an order item
SELECT MAX(quantity) AS max_quntity
FROM order_items ;

-- 76 Minimum quantity in an order item
SELECT MIN(quantity) AS min_quantity
FROM order_items ;

-- 77 Total revenue of all orders
SELECT SUM(quantity * unit_price) AS total_revenue
FROM order_items;

-- 78 Total quantity sold per product
SELECT product_id, SUM(quantity) AS total_quantity
FROM order_items
GROUP BY product_id ;

-- 79 Revenue per product
SELECT product_id, ROUND(SUM(quantity * unit_price),2) AS revenue
FROM order_items
GROUP BY product_id ;

-- 80 Average quantity per product
SELECT product_id, ROUND(AVG(quantity),2)
FROM order_items
GROUP BY product_id ;

-- 81 Highest quantity per product
SELECT product_id, MAX(quantity)
FROM order_items
GROUP BY product_id ;

-- 82 Lowest quantity per product
SELECT product_id, MIN(quantity)
FROM order_items
GROUP BY product_id ;

-- 83 Total orders per customer
SELECT customer_id, COUNT(*) 
FROM orders
GROUP BY customer_id ;

-- 84 Customers with more than 5 orders
SELECT customer_id, COUNT(*) 
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 5 ;

-- 85 Total revenue per order
SELECT order_id, ROUND(SUM(quantity * unit_price),2) AS total_revenue
FROM order_items
GROUP BY order_id ;

-- 86 Average revenue per order
SELECT order_id, ROUND (AVG(quantity * unit_price),2) AS avg_revenue
FROM order_items
GROUP BY order_id ;

-- 87 Orders having revenue greater than 10000
SELECT order_id, ROUND(SUM(quantity * unit_price),2) AS revenue
FROM order_items
GROUP BY order_id
HAVING revenue > 10000 ;

-- 88 Total customers per signup year
SELECT YEAR(signup_date), COUNT(*)
FROM customers
GROUP BY YEAR(signup_date)
ORDER BY YEAR(signup_date) ;

-- 89 Total revenue per day
SELECT o.order_date, ROUND(SUM(oi.quantity * oi.unit_price),2) AS total_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_date 
ORDER BY o.order_date ;

-- 90 Total orders per day
SELECT order_date, COUNT(*) AS total_order
FROM orders
GROUP BY order_date 
ORDER BY order_date ;

-- 91 Average price per category
SELECT category, ROUND(AVG(price),2) avg_price
FROM products
GROUP BY category ;

-- 92 Highest price per category
SELECT category, MAX(price)
FROM products
GROUP BY category ;

-- 93 Lowest price per category
SELECT category, MIN(price)
FROM products
GROUP BY category ;

-- 94 Total price per category
SELECT category , ROUND(SUM(price),2) AS total_price
FROM products
GROUP BY category ;

-- 95 Categories with more than 500 products
SELECT category , COUNT(*) AS product
FROM products
GROUP BY category
HAVING COUNT(*) > 500 ;

-- 96 Total items per order
SELECT order_id , COUNT(*) AS order_
FROM order_items
GROUP BY order_id ;

-- 97 Orders with more than 3 products
SELECT order_id , COUNT(*) AS order_
FROM order_items
GROUP BY order_id
HAVING COUNT(*) > 3 ;

-- 98 Total revenue per customer
SELECT o.customer_id, ROUND(SUM(oi.quantity * oi.unit_price),2) AS total_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id ;

-- 99 Average revenue per customer
SELECT o.customer_id , ROUND(AVG(oi.quantity * oi.unit_price),2) AS avg_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id ;

-- 100 Highest revenue per customer
SELECT o.customer_id, ROUND(MAX(oi.quantity * oi.unit_price),2) AS higest_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id ;

-- 101 Lowest revenue per customer
SELECT o.customer_id, ROUND(MIN(oi.quantity * oi.unit_price),2) AS lowest_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id ;

-- 102 Average quantity purchased per customer
SELECT o.customer_id, ROUND(AVG(oi.quantity),2) AS avg_quantity
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id ;

-- 103 Total quantity purchased per customer
SELECT o.customer_id, SUM(oi.quantity) AS total_quantity
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id ;

-- 104 Customers with revenue greater than 50000
SELECT o.customer_id, ROUND(SUM(oi.quantity * oi.unit_price),2) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id
HAVING revenue > 50000 ;

-- 105 Average order revenue per day
SELECT o.order_date, ROUND(AVG(oi.quantity * oi.unit_price),2) AS avg_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_date
ORDER BY o.order_date ;

-- 106 Total quantity sold per day
SELECT o.order_date, SUM(oi.quantity) AS total_quantity
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_date
ORDER BY o.order_date ;

-- 107 Maximum revenue generated in a single order
SELECT ROUND(MAX(order_total),2) AS max_revenue
FROM 
(
SELECT order_id, SUM(quantity * unit_price) AS order_total
FROM order_items
GROUP BY order_id
) AS t; -- USE Alias AS t

-- 108 Minimum revenue generated in a single order
SELECT ROUND(MIN(order_total),2) AS min_revenue
FROM
(
SELECT order_id, SUM(quantity * unit_price) AS order_total
FROM order_items
GROUP BY order_id
) AS t ;

-- 109 Average revenue per order
SELECT ROUND(AVG(order_total),2) AS avg_revenue 
FROM
(
SELECT order_id, SUM(quantity * unit_price) AS order_total
FROM order_items
GROUP BY order_id
) AS t ;

-- 110 Total number of unique cities
SELECT COUNT(DISTINCT city) AS total_city
FROM customers ;

-- 111 Total number of unique product categories
SELECT COUNT(DISTINCT category) AS total_product
FROM products ;

-- 112 Total number of unique customers who placed orders
SELECT COUNT(DISTINCT customer_id) AS total_cust_order
FROM orders ;

-- 113 Total unique products sold
SELECT COUNT(DISTINCT product_id) AS total_product_sold
FROM order_items ;

-- 114 Average products per order
SELECT AVG(product_count) AS avg_product
FROM
(
SELECT order_id, COUNT(*) AS product_count
FROM order_items
GROUP BY order_id
) AS t ;

-- 115 Highest number of products in one order
SELECT MAX(product_count)
FROM
(
SELECT order_id, COUNT(*) AS product_count
FROM order_items
GROUP BY order_id
) AS t ;

-- 116 Lowest number of products in one order
SELECT MIN(product_count)
FROM
(
SELECT order_id, COUNT(*) AS product_count
FROM order_items
GROUP BY order_id
) AS t ;

-- 117 Total revenue per month
SELECT MONTH(o.order_date), ROUND(SUM(oi.quantity * oi.unit_price),2) AS total_revenue_month
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY MONTH(o.order_date) 
ORDER BY MONTH(o.order_date) ;

-- 118 Total orders per month
SELECT MONTH(order_date) AS month , COUNT(*) AS total_order
FROM orders
GROUP BY MONTH(order_date) 
ORDER BY MONTH(order_date) ;

-- 119 Total customers per city sorted by highest
SELECT city, COUNT(*) AS total_customer 
FROM customers
GROUP BY city
ORDER BY COUNT(*) DESC ;

-- 120 Total products per category sorted by highest
SELECT category, COUNT(*) AS total_product
FROM products
GROUP BY category
ORDER BY COUNT(*) DESC ;

-- 121 Highest revenue day
SELECT o.order_date, SUM(oi.quantity * oi.unit_price) AS highest_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_date
ORDER BY highest_revenue DESC
LIMIT 1 ;

-- 122 Lowest revenue day
SELECT o.order_date, SUM(oi.quantity * oi.unit_price) AS lowest_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_date
ORDER BY lowest_revenue
LIMIT 1 ;

-- 123 Average revenue per product
SELECT product_id, ROUND(AVG(quantity * unit_price),2) AS avg_revenue
FROM order_items
GROUP BY product_id ;

-- 124 Highest revenue per product
SELECT product_id, MAX(quantity * unit_price) AS higesht_revenue
FROM order_items
GROUP BY product_id ;

-- 125 Lowest revenue per product
SELECT product_id, ROUND(MIN(quantity * unit_price),2) AS lowest_revenue
FROM order_items
GROUP BY product_id ;

-- 126 Total revenue per category
SELECT p.category, ROUND(SUM(oi.quantity * oi.unit_price),2) AS total_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category ;

-- 127 Average revenue per category
SELECT p.category, ROUND(AVG(oi.quantity * oi.unit_price),2) AS avg_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category ;

-- 128 Highest revenue category
SELECT p.category, ROUND(SUM(oi.quantity * oi.unit_price),2) AS highest_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY highest_revenue DESC
LIMIT 1 ;

-- 129 Lowest revenue category
SELECT p.category, ROUND(SUM(oi.quantity * oi.unit_price),2) AS lowest_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY lowest_revenue
LIMIT 1 ;

-- 130 Total revenue overall
SELECT ROUND(SUM(quantity * unit_price),2) AS total_revenue 
FROM order_items ;

-- =====================================================================================================================================
--                                                       JOIN QUIERS
-- =====================================================================================================================================

-- 131 Show customer name and order id
SELECT c.customer_name, o.order_id
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id ;

-- 132 Show customer name and order date
SELECT c.customer_name, o.order_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id ;

-- 133 Show customer name and order status
SELECT c.customer_name, o.status
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id ;

-- 134 Show order id and product id
SELECT o.order_id, oi.product_id
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id 
ORDER BY o.order_id ;

-- 135 Show order id and quantity
SELECT o.order_id, oi.quantity
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
ORDER BY o.order_id ;

-- 136 Show product name and quantity ordered
SELECT p.product_name, oi.quantity
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id ;

-- 137 Show product name and unit price
SELECT p.product_name, oi.unit_price
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id ;

-- 138 Show order id and product name
SELECT o.order_id, p.product_name
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 139 Show customer name and product name purchased
SELECT c.customer_name, p.product_name
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 140 Show customer city and order id
SELECT c.city, o.order_id
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id ;

-- 141 Show order id and order date with product id
SELECT o.order_id, o.order_date, oi.product_id
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id ;

-- 142 Show product name and order date
SELECT p.product_name, o.order_date
FROM orders o
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 143 Show customer name and quantity purchased
SELECT c.customer_name, oi.quantity
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id ;

-- 144 Show product name and order id
SELECT p.product_name, o.order_id
FROM products p
JOIN order_items oi 
ON p.product_id = oi.product_id
JOIN orders o 
ON oi.order_id = o.order_id ;

-- 145 Show customer name and product price
SELECT c.customer_name, oi.unit_price
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id ;

-- 146 Show product category and quantity sold
SELECT p.category, oi.quantity
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id ;

-- 147 Show order id and product category
SELECT o.order_id, p.category
FROM orders o
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 148 Show customer name and product category
SELECT c.customer_name, p.category
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 149 Show customer city and product name
SELECT c.city, p.product_name
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 150 Show order date and product price
SELECT o.order_date, oi.unit_price
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id ;

-- 151 Show customer name and product name with order date
SELECT c.customer_name, p.product_name, o.order_date
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 152 Show order id, product name and quantity
SELECT o.order_id, p.product_name, oi.quantity
FROM orders o
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 153 Show order id, product name and unit price
SELECT o.order_id, p.product_name, oi.unit_price
FROM orders o
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 154 Show customer name, product name and quantity purchased
SELECT c.customer_name, p.product_name, oi.quantity
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 155 Show customer city, product name and quantity purchased
SELECT c.city, p.product_name, oi.quantity
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 156 Show product name, category and quantity sold
SELECT p.product_name, p.category, oi.quantity
FROM products p
JOIN order_items oi 
ON p.product_id = oi.product_id ;

-- 157 Show order id, product category and quantity
SELECT o.order_id, p.category, oi.quantity
FROM orders o
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 158 Show customer name, order id and product category
SELECT c.customer_name, o.order_id, p.category
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 159 Show customer city, order date and product name
SELECT c.city, o.order_date, p.product_name
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 160 Show order id, product name and order date
SELECT o.order_id, p.product_name, o.order_date
FROM orders o
JOIN order_items oi 
ON o.order_id = oi.order_id
JOIN products p 
ON oi.product_id = p.product_id ;

-- 161 Show total revenue per order
SELECT o.order_id,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS total_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id ;

-- 162 Show average quantity per order
SELECT o.order_id,
ROUND(AVG(oi.quantity),2) AS avg_quantity
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id ;

-- 163 Show maximum quantity ordered in each order
SELECT o.order_id,
MAX(oi.quantity) AS max_quantity
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id ;

-- 164 Show minimum quantity ordered in each order
SELECT o.order_id,
MIN(oi.quantity) AS min_quantity
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id ;

-- 165 Show total quantity purchased per customer
SELECT c.customer_name,
SUM(oi.quantity) AS total_quantity
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.customer_name ;

-- 166 Show total products purchased per customer
SELECT c.customer_name,
COUNT(oi.product_id) AS total_products
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.customer_name ;

-- 167 Show average quantity purchased per customer
SELECT c.customer_name,
ROUND(AVG(oi.quantity),2) AS avg_quantity
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.customer_name ;

-- 168 Show maximum revenue generated from a single product
SELECT p.product_name,
ROUND(MAX(oi.quantity * oi.unit_price),2) AS max_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name ;

-- 169 Show minimum revenue generated from a single product
SELECT p.product_name,
ROUND(MIN(oi.quantity * oi.unit_price),2) AS min_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name ;

-- 170 Show average revenue generated per product
SELECT p.product_name,
ROUND(AVG(oi.quantity * oi.unit_price),2) AS avg_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name ;

-- 171 Show total revenue generated per city
SELECT c.city,
ROUND(SUM(oi.quantity * oi.unit_price) ,2) AS revenue
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.city ;

-- 172 Show total quantity sold per city
SELECT c.city,
SUM(oi.quantity) AS total_quantity
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.city ;

-- 173 Show total orders placed per product
SELECT p.product_name,
COUNT(DISTINCT o.order_id) AS total_orders
FROM products p
JOIN order_items oi 
ON p.product_id = oi.product_id
JOIN orders o 
ON oi.order_id = o.order_id
GROUP BY p.product_name
ORDER BY p.product_name ;

-- 174 Show total customers who purchased each product
SELECT p.product_name,
COUNT(DISTINCT o.customer_id) AS total_customers
FROM products p
JOIN order_items oi 
ON p.product_id = oi.product_id
JOIN orders o 
ON oi.order_id = o.order_id
GROUP BY p.product_name ;

-- 175 Show total revenue generated per order date
SELECT o.order_date,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_date
ORDER BY o.order_date ;

-- 176 Show total quantity sold per order date
SELECT o.order_date,
SUM(oi.quantity) AS total_quantity
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_date
ORDER BY o.order_date ;

-- 177 Show total number of products sold per order date
SELECT o.order_date,
COUNT(oi.product_id) AS total_products
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_date
ORDER BY o.order_date ;

-- 178 Show highest quantity sold for each product
SELECT p.product_name,
MAX(oi.quantity) AS highest_quantity
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name ;

-- 179 Show lowest quantity sold for each product
SELECT p.product_name,
MIN(oi.quantity) AS lowest_quantity
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name ;

-- 180 Show total revenue generated per product category
SELECT p.category,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category ;

-- 181 Show top 10 customers by revenue
SELECT c.customer_name,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS revenue
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 10 ;

-- 182 Show top 10 products by revenue
SELECT p.product_name,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 10 ;

-- 183 Show most sold product
SELECT p.product_name,
SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 1 ;

-- 184 Show customer with highest revenue
SELECT c.customer_name,
SUM(oi.quantity * oi.unit_price) AS revenue
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 1 ;

-- 185 Show average revenue per order
SELECT o.order_id,
ROUND(AVG(oi.quantity * oi.unit_price),2)  AS avg_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id ;

-- 186 Show orders having revenue greater than 10000
SELECT o.order_id,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING revenue > 10000 ;

-- 187 Show total revenue per day
SELECT o.order_date,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS tital_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_date 
ORDER BY o.order_date ;

-- 188 Show total quantity sold per day
SELECT o.order_date,
SUM(oi.quantity) AS total_quntity
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_date
ORDER BY o.order_date ;

-- 189 Show highest revenue day
SELECT o.order_date,
SUM(oi.quantity * oi.unit_price) AS highest_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_date
ORDER BY highest_revenue DESC
LIMIT 1 ;

-- 190 Show lowest revenue day
SELECT o.order_date,
SUM(oi.quantity * oi.unit_price) AS lowest_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_date
ORDER BY lowest_revenue
LIMIT 1 ;

-- 191 Show customers who bought more than 10 items
SELECT c.customer_name,
SUM(oi.quantity) AS total_items
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.customer_name
HAVING total_items > 10 ;

-- 192 Show categories with revenue greater than 50000
SELECT p.category,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
HAVING revenue > 50000 ;

-- 193 Show total revenue per city
SELECT c.city,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS total_revenue
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.city ;

-- 194 Show city with highest revenue
SELECT c.city,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS high_revenue
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.city
ORDER BY high_revenue DESC
LIMIT 1 ;

-- 195 Show city with lowest revenue
SELECT c.city,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS lowest_revenue
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.city
ORDER BY lowest_revenue
LIMIT 1 ;

-- 196 Show total orders per category
SELECT p.category, COUNT(DISTINCT o.order_id) AS total_oredr
FROM products p
JOIN order_items oi 
ON p.product_id = oi.product_id
JOIN orders o 
ON oi.order_id = o.order_id
GROUP BY p.category ;

-- 197 Show average quantity per product
SELECT p.product_name,
ROUND(AVG(oi.quantity),2) AS avg_quantityu
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name ;

-- 198 Show highest selling category
SELECT p.category,
SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_sold DESC
LIMIT 1 ;

-- 199 Show number of products sold per city
SELECT c.city, COUNT(oi.product_id) AS product
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.city ;

-- 200 Show customers who placed the most orders
SELECT c.customer_name,
COUNT(o.order_id) AS most_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY most_orders DESC
LIMIT 10 ;

-- 201 Show total products sold per order
SELECT o.order_id,
SUM(oi.quantity) AS total_pro
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id ;

-- 202 Show order having highest quantity sold
SELECT o.order_id,
SUM(oi.quantity) AS quantity
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id
ORDER BY quantity DESC
LIMIT 1 ;

-- 203 Show average product price sold
SELECT ROUND(AVG(oi.unit_price),2) AS avg_price
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id ;

-- 204 Show revenue generated by each product category
SELECT p.category,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category ;

-- 205 Show products never ordered
SELECT p.product_name
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

-- 206 Show customers who never placed orders
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL ;

-- 207 Show orders without order items
SELECT o.order_id
FROM orders o
LEFT JOIN order_items oi
ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL
ORDER BY oi.order_id  ; 

-- 208 Show customers with highest average order value
SELECT c.customer_name,
ROUND(AVG(oi.quantity * oi.unit_price),2) AS high_avg_value
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.customer_name
ORDER BY high_avg_value DESC
LIMIT 10 ;

-- 209 Show product generating highest total revenue
SELECT p.product_name,
ROUND(SUM(oi.quantity * oi.unit_price),2)  AS high_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY high_revenue DESC
LIMIT 1 ;

-- 210 Show category generating highest revenue
SELECT p.category,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS high_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY high_revenue DESC
LIMIT 1 ;

-- ============================================================================================================================================================================
--                                                                      CASE WHEN QUERIES
-- ============================================================================================================================================================================

-- 210 Classify product price level
SELECT product_name, price,
CASE
WHEN price > 8000 THEN 'High Price'
WHEN price BETWEEN 4000 AND 8000 THEN 'Medium Price'
ELSE 'Low Price'
END AS price_level
FROM products ;

-- 211 Show order status description
SELECT order_id, status,
CASE
WHEN status='Completed' THEN 'Order Finished'
WHEN status='Pending' THEN 'Order Processing'
ELSE 'Other'
END AS status_description
FROM orders ;

-- 212 Classify quantity size
SELECT order_id, quantity,
CASE
WHEN quantity >= 8 THEN 'Large Quantity'
WHEN quantity BETWEEN 4 AND 7 THEN 'Medium Quantity'
ELSE 'Small Quantity'
END AS quantity_size
FROM order_items ;

-- 213 Show price category using WHERE
SELECT product_name, price,
CASE
WHEN price > 5000 THEN 'Expensive'
ELSE 'Affordable'
END AS price_type
FROM products
WHERE price > 2000 ;

-- 214 Show customer region type
SELECT customer_name, city,
CASE
WHEN city IN ('Mumbai','Delhi','Bangalore') THEN 'Metro'
ELSE 'Non Metro'
END AS city_type
FROM customers ;

-- 215 Classify order year
SELECT order_id, order_date,
CASE
WHEN YEAR(order_date) = 2024 THEN 'New Order'
WHEN YEAR(order_date) = 2023 THEN 'Recently Order'
ELSE 'Old Order'
END AS order_type
FROM orders ;

-- 216 Show product affordability
SELECT product_name, price,
CASE
WHEN price < 2000 THEN 'Budget'
WHEN price BETWEEN 2000 AND 6000 THEN 'Standard'
ELSE 'Premium'
END AS affordability
FROM products ;

-- 217 Classify quantity using WHERE filter
SELECT order_id, quantity,
CASE
WHEN quantity > 5 THEN 'Bulk'
ELSE 'Normal'
END AS quantity_type
FROM order_items
WHERE quantity >= 2 ;

-- 218 Classify product based on price range
SELECT product_name,
CASE
WHEN price > 9000 THEN 'Luxury'
ELSE 'Regular'
END AS category
FROM products ;

-- 219 Classify customer signup year
SELECT customer_name, signup_date,
CASE
WHEN YEAR(signup_date) >= 2023 THEN 'New Customer'
ELSE 'Old Customer'
END AS customer_type
FROM customers ;

-- 220 Show order month type
SELECT order_id, order_date,
CASE
WHEN MONTH(order_date) <= 6 THEN 'Half'
ELSE 'Second Half'
END AS half_year
FROM orders ;

-- 221 Classify products based on whether price is above average
SELECT product_name, price,
CASE
WHEN price > (SELECT AVG(price) FROM products) THEN 'Above Average Price' -- USE SUBQUERIES TO FIND AVG 
ELSE 'Below Average Price'
END AS price_comparison
FROM products ;

-- 222 Classify orders based on month
SELECT order_id, order_date,
CASE
WHEN MONTH(order_date) IN (1,2,3) THEN 'Quarter 1'
WHEN MONTH(order_date) IN (4,5,6) THEN 'Quarter 2'
WHEN MONTH(order_date) IN (7,8,9) THEN 'Quarter 3'
ELSE 'Quarter 4'
END AS order_quarter
FROM orders ;

-- 223 Show quantity parity (even or odd)
SELECT order_id, quantity,
CASE
WHEN quantity % 2 = 0 THEN 'Even Quantity'
ELSE 'Odd Quantity'
END AS quantity_type
FROM order_items ;

-- 224 Classify product price using ORDER BY
SELECT product_name, price,
CASE
WHEN price >= 7000 THEN 'High'
WHEN price >= 3000 THEN 'Medium'
ELSE 'Low'
END AS price_level
FROM products
ORDER BY price DESC ;

-- 225 Classify customer name length
SELECT customer_name,
CASE
WHEN LENGTH(customer_name) > 12 THEN 'Long Name'
WHEN LENGTH(customer_name) BETWEEN 8 AND 12 THEN 'Medium Name'
ELSE 'Short Name'
END AS name_length
FROM customers ;

-- 226 Classify order date as weekday or weekend
SELECT order_id, order_date,
CASE
WHEN DAYOFWEEK(order_date) IN (1,7) THEN 'Weekend'
ELSE 'Weekday'
END AS day_type
FROM orders ;

-- 227 Show product price group with filtering
SELECT product_name, price,
CASE
WHEN price > 6000 THEN 'Premium Product'
ELSE 'Regular Product'
END AS product_type
FROM products
WHERE price >= 2000 ;

-- 228 Classify quantity level with ordering
SELECT order_id, quantity,
CASE
WHEN quantity >= 9 THEN 'Very High'
WHEN quantity >= 5 THEN 'High'
WHEN quantity >= 3 THEN 'Medium'
ELSE 'Low'
END AS quantity_level
FROM order_items
ORDER BY quantity DESC ;

-- 229 Classify customers by signup month
SELECT customer_name, signup_date,
CASE
WHEN MONTH(signup_date) BETWEEN 1 AND 6 THEN 'First Half Signup'
ELSE 'Second Half Signup'
END AS signup_period
FROM customers ;

-- 230 Classify product name alphabet group
SELECT product_name,
CASE
WHEN product_name LIKE 'A%' THEN 'Starts with A'
WHEN product_name LIKE 'B%' THEN 'Starts with B'
ELSE 'Other Letter'
END AS alphabet_group
FROM products ;

-- 231 Show price comparison with maximum price
SELECT product_name, price,
CASE
WHEN price = (SELECT MAX(price) FROM products) THEN 'Highest Price' -- USE SUBQUIERIES 
ELSE 'Normal Price'
END AS price_status
FROM products ;

-- 232 Classify orders by order id size
SELECT order_id,
CASE
WHEN order_id > 4000 THEN 'Large ID'
ELSE 'Small ID'
END AS order_id_type
FROM orders ;

-- 233 Show quantity compared to average quantity
SELECT order_id, quantity,
CASE
WHEN quantity > (SELECT AVG(quantity) FROM order_items) THEN 'Above Average Quantity' -- USE SUB TO FIND AVG
ELSE 'Below Average Quantity'
END AS quantity_comparison
FROM order_items ;

-- 234 Classify city name length
SELECT city,
CASE
WHEN LENGTH(city) > 7 THEN 'Long City Name'
ELSE 'Short City Name'
END AS city_length
FROM customers ;

-- 235 Classify products by divisibility of price
SELECT product_name, price,
CASE
WHEN price % 2 = 0 THEN 'Even Price'
ELSE 'Odd Price'
END AS price_type
FROM products ;

-- 236 Classify orders based on day of month
SELECT order_id, order_date,
CASE
WHEN DAY(order_date) <= 10 THEN 'Early Month'
WHEN DAY(order_date) <= 20 THEN 'Mid Month'
ELSE 'Late Month'
END AS month_period
FROM orders ;

-- 237 Classify quantity multiples
SELECT order_id, quantity,
CASE
WHEN quantity % 5 = 0 THEN 'Multiple of 5'
ELSE 'Not Multiple of 5'
END AS quantity_multiple
FROM order_items ;

-- 238 Classify products based on whether price is below minimum + threshold
SELECT product_name, price,
CASE
WHEN price < (SELECT MIN(price) FROM products) + 1000 THEN 'Near Minimum Price' -- USE SUB TO FIND MIN ND ADD 1000
ELSE 'Higher Price'
END AS price_position
FROM products;

-- 239 Classify customers alphabetically
SELECT customer_name,
CASE
WHEN customer_name BETWEEN 'A' AND 'M' THEN 'First Half Alphabet'
ELSE 'Second Half Alphabet'
END AS alphabet_group
FROM customers ;

-- 240 Classify orders by year range
SELECT order_id, order_date,
CASE
WHEN YEAR(order_date) >= 2024 THEN 'Recent Orders'
WHEN YEAR(order_date) = 2023 THEN 'Last Year Orders'
ELSE 'Older Orders'
END AS order_year_group
FROM orders ; 

-- ============================================================================================================================================================================
--                                                          SET OPRATION QUERIES 
-- ============================================================================================================================================================================

-- 241 Combine customer cities and product categories
SELECT city
FROM customers
UNION 
SELECT category 
FROM products ;

-- 242 Combine customer cities including duplicates
SELECT city 
FROM customers
UNION ALL
SELECT category 
FROM products ;

-- 243 Show cities that also appear as product categories
SELECT city 
FROM customers
INTERSECT
SELECT category 
FROM products ;

-- 244 Show cities that are not product categories
SELECT city 
FROM customers
EXCEPT
SELECT category 
FROM products ;

-- 245 Combine order ids and product ids
SELECT order_id 
FROM orders
UNION
SELECT product_id 
FROM order_items ;

-- 246 Combine order ids including duplicates
SELECT order_id 
FROM orders
UNION ALL
SELECT order_id 
FROM order_items ;

-- 247 Show order ids present in both tables
SELECT order_id 
FROM orders
INTERSECT
SELECT order_id 
FROM order_items ;

-- 248 Show order ids in orders but not in order_items
SELECT order_id 
FROM orders
EXCEPT
SELECT order_id 
FROM order_items ;

-- 249 Combine product names and customer names
SELECT product_name 
FROM products
UNION
SELECT customer_name 
FROM customers ;

-- 250 Combine product names and customer names including duplicates
SELECT product_name 
FROM products
UNION ALL
SELECT customer_name 
FROM customers ;

-- 251 Show product ids that exist in both tables
SELECT product_id 
FROM products
INTERSECT
SELECT product_id
FROM order_items ;

-- 252 Show product ids not ordered yet
SELECT product_id 
FROM products
EXCEPT
SELECT product_id 
FROM order_items ;

-- 253 Combine order dates and signup dates
SELECT order_date 
FROM orders
UNION
SELECT signup_date 
FROM customers ;

-- 254 Combine order dates including duplicates
SELECT order_date 
FROM orders
UNION ALL
SELECT signup_date 
FROM customers ;

-- 255 Show dates present in both tables
SELECT order_date 
FROM orders
INTERSECT
SELECT signup_date 
FROM customers ;

-- 256 Show order dates not present in signup dates
SELECT order_date
 FROM orders
EXCEPT
SELECT signup_date 
FROM customers ;

-- 257 Combine product price and order item price
SELECT price 
FROM products
UNION
SELECT unit_price 
FROM order_items ;

-- 258 Combine product price including duplicates
SELECT price 
FROM products
UNION ALL
SELECT unit_price 
FROM order_items ;

-- 259 Show price values appearing in both tables
SELECT price 
FROM products
INTERSECT
SELECT unit_price 
FROM order_items ;

-- 260 Show product prices not appearing in order_items
SELECT price 
FROM products
EXCEPT
SELECT unit_price 
FROM order_items ;

-- 261 Combine order ids and customer ids
SELECT order_id 
FROM orders
UNION
SELECT customer_id 
FROM customers ;

-- 262 Combine order ids including duplicates
SELECT order_id 
FROM orders
UNION ALL
SELECT customer_id 
FROM customers ;

-- 263 Show ids common in both tables
SELECT order_id 
FROM orders
INTERSECT
SELECT customer_id 
FROM customers ;

-- 264 Show order ids not matching customer ids
SELECT order_id 
FROM orders
EXCEPT
SELECT customer_id 
FROM customers ;

-- 265 Combine product ids and order ids
SELECT product_id 
FROM products
UNION
SELECT order_id 
FROM orders ;

-- ============================================================================================================================================================================
--                                                                      WINDOW FUNCTION QUERIES
-- ============================================================================================================================================================================

-- 265 Assign row numbers to products
SELECT product_name, price,
ROW_NUMBER() OVER() AS row_num
FROM products ;

-- 266 Assign row numbers ordered by price
SELECT product_name, price,
ROW_NUMBER() OVER(ORDER BY price) AS row_num
FROM products ;

-- 267 Rank products by price
SELECT product_name, price,
RANK() OVER(ORDER BY price DESC) AS price_rank
FROM products ;

-- 268 Dense rank products by price
SELECT product_name, price,
DENSE_RANK() OVER(ORDER BY price DESC) AS price_rank
FROM products ;

-- 269 Assign row numbers to orders by date
SELECT order_id, order_date,
ROW_NUMBER() OVER(ORDER BY order_date) AS order_row
FROM orders ;

-- 270 Rank orders by order date
SELECT order_id, order_date,
RANK() OVER(ORDER BY order_date) AS order_rank
FROM orders ;

-- 271 Show running total of quantity
SELECT order_id, quantity,
SUM(quantity) OVER(ORDER BY order_id) AS running_total
FROM order_items ;

-- 272 Show running average quantity
SELECT order_id, quantity,
AVG(quantity) OVER(ORDER BY order_id) AS running_avg
FROM order_items ;

-- 273 Count total products using window function
SELECT product_name,
COUNT(*) OVER() AS total_products
FROM products ;

-- 274 Show total quantity across all rows
SELECT quantity,
SUM(quantity) OVER() AS total_quantity
FROM order_items ;

-- 275 Show average product price across all rows
SELECT product_name, price,
AVG(price) OVER() AS avg_price
FROM products ;

-- 276 Rank customers alphabetically
SELECT customer_name,
ROW_NUMBER() OVER(ORDER BY customer_name) AS name_rank
FROM customers ;

-- 277 Rank products by price ascending
SELECT product_name, price,
ROW_NUMBER() OVER(ORDER BY price ASC) AS price_position
FROM products ;

-- 278 Show cumulative price total
SELECT product_name, price,
SUM(price) OVER(ORDER BY price) AS cumulative_price
FROM products ;

-- 279 Show cumulative quantity
SELECT quantity,
SUM(quantity) OVER(ORDER BY quantity) AS cumulative_quantity
FROM order_items ;

-- 280 Show row number for customers ordered by signup date
SELECT customer_name, signup_date,
ROW_NUMBER() OVER(ORDER BY signup_date) AS signup_rank
FROM customers ;

-- ===================================================================================================================================================================================
--                                                                         SUB-QUERIES
-- =============================================================================================================================================================================

-- 281 Show products priced higher than the average price
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products) ;

-- 282 Show products priced lower than the average price
SELECT product_name, price
FROM products
WHERE price < (SELECT AVG(price) FROM products) ;

-- 283 Show customers who signed up after the earliest signup date
SELECT customer_name, signup_date
FROM customers
WHERE signup_date > (SELECT MIN(signup_date) FROM customers) ;

-- 284 Show orders placed after the first order date
SELECT order_id, order_date
FROM orders
WHERE order_date > (SELECT MIN(order_date) FROM orders) ;

-- 285 Show products with price equal to the highest price
SELECT product_name, price
FROM products
WHERE price = (SELECT MAX(price) FROM products) ;

-- 286 Show products with price equal to the lowest price
SELECT product_name, price
FROM products
WHERE price = (SELECT MIN(price) FROM products) ;

-- 287 Show orders with quantity greater than average quantity
SELECT order_id, quantity
FROM order_items
WHERE quantity > (SELECT AVG(quantity) FROM order_items) ;

-- 288 Show orders with quantity lower than average quantity
SELECT order_id, quantity
FROM order_items
WHERE quantity < (SELECT AVG(quantity) FROM order_items) ;

-- 289 Show products priced above the minimum price + 1000
SELECT product_name, price
FROM products
WHERE price > (SELECT MIN(price) FROM products) + 1000 ;

-- 290 Show products priced below the maximum price - 1000
SELECT product_name, price
FROM products
WHERE price < (SELECT MAX(price) FROM products) - 1000 ;

-- 291 Show customers who signed up after average signup date
SELECT customer_name, signup_date
FROM customers
WHERE signup_date > (SELECT AVG(signup_date) FROM customers) ;

-- 292 Show orders placed before the average order date
SELECT order_id, order_date
FROM orders
WHERE order_date < (SELECT AVG(order_date) FROM orders) ;

-- 293 Show products priced equal to average price
SELECT product_name, price
FROM products
WHERE price = (SELECT AVG(price) FROM products) ;

-- 294 Show orders with quantity equal to the maximum quantity
SELECT order_id, quantity
FROM order_items
WHERE quantity = (SELECT MAX(quantity) FROM order_items) ;

-- 295 Show orders with quantity equal to the minimum quantity
SELECT order_id, quantity
FROM order_items
WHERE quantity = (SELECT MIN(quantity) FROM order_items) ;

-- 296 Show products more expensive than the cheapest product
SELECT product_name, price
FROM products
WHERE price > (SELECT MIN(price) FROM products) ;

-- 297 Show products cheaper than the most expensive product
SELECT product_name, price
FROM products
WHERE price < (SELECT MAX(price) FROM products) ;

-- 298 Show customers who signed up before the latest signup date
SELECT customer_name, signup_date
FROM customers
WHERE signup_date < (SELECT MAX(signup_date) FROM customers) ;

-- 299 Show orders placed after average order date
SELECT order_id, order_date
FROM orders
WHERE order_date > (SELECT AVG(order_date) FROM orders) ;

-- 300 Show products with price greater than average price + 500
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products) + 500 ;

-- 301 Show products with price lower than average price - 500
SELECT product_name, price
FROM products
WHERE price < (SELECT AVG(price) FROM products) - 500 ;

-- 302 Show order items with quantity greater than maximum quantity - 5
SELECT order_id, quantity
FROM order_items
WHERE quantity > (SELECT MAX(quantity) FROM order_items) - 5 ;

-- 303 Show products with price between minimum and average price
SELECT product_name, price
FROM products
WHERE price BETWEEN
(SELECT MIN(price) FROM products)
AND
(SELECT AVG(price) FROM products) ;

-- 304 Show products with price between average and maximum price
SELECT product_name, price
FROM products
WHERE price BETWEEN
(SELECT AVG(price) FROM products)
AND
(SELECT MAX(price) FROM products) ;

-- 305 Show customers who signed up after the second earliest date
SELECT customer_name, signup_date
FROM customers
WHERE signup_date >
(SELECT MIN(signup_date) FROM customers) ;

-- 306 Show products with price not equal to the minimum price
SELECT product_name, price
FROM products
WHERE price NOT IN (SELECT MIN(price) FROM products) ;

-- 307 Show products with price not equal to the maximum price
SELECT product_name, price
FROM products
WHERE price NOT IN  (SELECT MAX(price) FROM products) ;

-- 308 Show orders with quantity greater than minimum quantity
SELECT order_id, quantity
FROM order_items
WHERE quantity > (SELECT MIN(quantity) FROM order_items) ;

-- 309 Show orders with quantity less than maximum quantity
SELECT order_id, quantity
FROM order_items
WHERE quantity < (SELECT MAX(quantity) FROM order_items) ;

-- 310 Show products whose price equals average price rounded
SELECT product_name, price
FROM products
WHERE price = ROUND((SELECT AVG(price) FROM products),2) ;

-- 311 Show products priced above average but below maximum
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products)
AND price < (SELECT MAX(price) FROM products) ;

-- 312 Show products priced below average but above minimum
SELECT product_name, price
FROM products
WHERE price < (SELECT AVG(price) FROM products)
AND price > (SELECT MIN(price) FROM products) ;

-- 313 Show order items with quantity greater than average quantity + 2
SELECT order_id, quantity
FROM order_items
WHERE quantity > (SELECT AVG(quantity) FROM order_items) + 2 ;  

-- 314 Show products whose price is double the minimum price
SELECT product_name, price
FROM products
WHERE price > (SELECT MIN(price) FROM products) * 2 ;

-- 315 Show orders placed after the latest order date minus 10 days
SELECT order_id, order_date
FROM orders
WHERE order_date >
(SELECT MAX(order_date) FROM orders) - INTERVAL 10 DAY ;

-- =============================================================================================================================================================================
--                                                                        REALTIME SQL QUERIES 
--  ===========================================================================================================================================================================

-- 315 Find the top 5 most expensive products
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 5 ;

-- 316 Find the 5 cheapest products
SELECT product_name, price
FROM products
ORDER BY price ASC
LIMIT 5 ;

-- 317 Find total number of customers in each city
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city ;

-- 318 Find total orders placed per day
SELECT order_date, COUNT(*) AS total_orders
FROM orders
GROUP BY order_date ;

-- 319 Find total quantity sold per product
SELECT product_id, SUM(quantity) AS total_quantity
FROM order_items
GROUP BY product_id ;

-- 320 Find total revenue for each order
SELECT order_id, ROUND(SUM(quantity * unit_price),2) AS total_revenue
FROM order_items
GROUP BY order_id ;

-- 321 Find total revenue generated by all orders
SELECT ROUND(SUM(quantity * unit_price),2) AS total_revenue
FROM order_items ;

-- 322 Find average product price
SELECT ROUND(AVG(price),3) AS average_price
FROM products ;

-- 323 Find highest product price
SELECT MAX(price) AS highest_price
FROM products ;

-- 324 Find lowest product price
SELECT MIN(price) AS lowest_price
FROM products ;

-- 325 Find total number of products
SELECT COUNT(*) AS total_products
FROM products ;

-- 326 Find number of orders placed in each month
SELECT MONTH(order_date) AS month, COUNT(*) AS total_orders
FROM orders
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date) ;

-- 327 Find total quantity ordered in each order
SELECT order_id, SUM(quantity) AS total_items
FROM order_items
GROUP BY order_id ;

-- 328 Find products with price above average
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products) ;

-- 329 Find customers who signed up this year
SELECT customer_name, signup_date
FROM customers
WHERE YEAR(signup_date) = YEAR(CURDATE()) ;

-- 330 Find orders placed in the last 30 days
SELECT order_id, order_date
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 30 DAY ;

-- 331 Find total quantity sold overall
SELECT SUM(quantity) AS total_quantity
FROM order_items ;

-- 332 Find average quantity per order
SELECT order_id, AVG(quantity) AS avg_quantity
FROM order_items
GROUP BY order_id ;

-- 333 Find orders with more than 5 items
SELECT order_id, SUM(quantity) AS total_items
FROM order_items
GROUP BY order_id
HAVING SUM(quantity) > 5 ;

-- 334 Find products costing more than 5000
SELECT product_name, price
FROM products
WHERE price > 5000 ;

-- 335 Find customers from a specific city
SELECT customer_name
FROM customers
WHERE city = 'Mumbai' ;

-- 336 Find orders placed in 2024
SELECT order_id, order_date
FROM orders
WHERE YEAR(order_date) = 2024 ;

-- 337 Find orders with quantity greater than average
SELECT order_id, quantity
FROM order_items
WHERE quantity > (SELECT AVG(quantity) FROM order_items) ;

-- 338 Find products priced between 3000 and 7000
SELECT product_name, price
FROM products
WHERE price BETWEEN 3000 AND 7000 ; 

-- 339 Find total revenue generated per product
SELECT product_id, ROUND(SUM(quantity * unit_price),2) AS total_revenue
FROM order_items
GROUP BY product_id ;

-- 340 Find products priced less than 2000
SELECT product_name, price
FROM products
WHERE price < 2000 ;

-- 341 Find the latest order date
SELECT MAX(order_date) AS latest_order
FROM orders ;

-- 342 Find earliest order date
SELECT MIN(order_date) AS earliest_order
FROM orders;

-- 343 Find customers who signed up before 2023
SELECT customer_name
FROM customers
WHERE signup_date < '2023-01-01' ;

-- 344 Find total orders placed
SELECT COUNT(*) AS total_orders
FROM orders ;

-- 345 Find average quantity sold
SELECT AVG(quantity) AS avg_quantity
FROM order_items ;

-- 346 Find total revenue generated today
SELECT SUM(quantity * unit_price) AS today_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_date = CURDATE() ;

-- 347 Find orders with revenue greater than 10000
SELECT order_id, ROUND(SUM(quantity * unit_price),2) AS revenue
FROM order_items
GROUP BY order_id
HAVING revenue > 10000 ;

-- 348 Find the product with highest price
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 1 ;

-- 349 Find the product with lowest price
SELECT product_name, price
FROM products
ORDER BY price ASC
LIMIT 1;

-- 350 Find total revenue generated in each month
SELECT MONTH(o.order_date) AS month,
ROUND(SUM(oi.quantity * oi.unit_price),2) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY MONTH(o.order_date)
ORDER BY MONTH(o.order_date) ;

