-- Create the database if it doesn't exist


-- Check datatypes for each feild in the database -- 

-- Learning About Customers --

-- Top 10 Customers by sales and are they loyalty members -- 
SELECT orders.customer_id, customers.customer_name,  customers.loyalty_card, SUM(Quantity) AS quantity_purchased, ROUND(SUM((orders.Quantity * products.unit_price)), 2) AS money_spent
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY orders.customer_id, customers.customer_name, customers.loyalty_card
ORDER BY money_spent DESC
LIMIT 10;

-- Number of people who have loyalty cards -- 
SELECT loyalty_card, COUNT(loyalty_card) AS Count 
FROM customers
GROUP BY loyalty_card;

-- Customers From Each Country --
SELECT customers.country, COUNT(DISTINCT customers.customer_id) AS customer_count
FROM customers
GROUP BY customers.country
ORDER BY customer_count DESC;

-- rename coffee bean types to full name -- 
UPDATE OnyXCoffee.customers
SET country = REPLACE(country, 'ZA', 'South Africa');

UPDATE OnyXCoffee.customers
SET country = REPLACE(country, 'BW', 'Botswana');

UPDATE OnyXCoffee.customers
SET country = REPLACE(country, 'NA', 'Namibia');


-- Learning About Products -- 

-- Item with most and least profit --
SELECT *
FROM products
WHERE profit = (SELECT Max(profit) FROM products) OR profit = (SELECT Min(profit) FROM products);


-- rename coffee bean types to full name -- 
UPDATE OnyXCoffee.products
SET coffee_type = REPLACE(coffee_type, 'Ara', 'Arabica');

UPDATE OnyXCoffee.products
SET coffee_type = REPLACE(coffee_type, 'Rob', 'Robusta');

UPDATE OnyXCoffee.products
SET coffee_type = REPLACE(coffee_type, 'Lib', 'Liberica');

UPDATE OnyXCoffee.products
SET coffee_type = REPLACE(coffee_type, 'Exc', 'Excelsa');

-- Item with most and least profit --
SELECT *
FROM products
WHERE profit = (SELECT Max(profit) FROM products) OR profit = (SELECT Min(profit) FROM products);

-- Products that have the highest profit margins and revenue --

SELECT orders.product_id, products.coffee_type, products.roast_type, products.Size, ROUND(SUM((orders.quantity * products.unit_price)), 2) AS Revenue, ROUND(SUM(orders.quantity * products.profit), 2) AS profit
FROM orders
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY orders.product_id, products.coffee_type, products.roast_type, products.Size
ORDER BY profit DESC
LIMIT 10;

-- What is the revenue and profit for each coffee bean type? --

SELECT products.coffee_type, ROUND(SUM(orders.quantity * products.unit_price), 2) AS Revenue, ROUND(SUM(orders.quantity * products.profit), 2) AS profit
From orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY products.coffee_type
ORDER BY Revenue DESC;


-- Types of coffee that makes most revenue --  
SELECT products.coffee_type, ROUND(SUM(orders.quantity * products.unit_price), 2) AS Revenue
From orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY products.coffee_type
ORDER BY Revenue DESC;

-- Type of Roast that Generate Most Revenue --
SELECT products.roast_type, ROUND(SUM(orders.quantity * products.unit_price), 2) AS Revenue
From orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY products.roast_type
ORDER BY Revenue DESC;

-- rename roast types to full name -- 


UPDATE OnyXCoffee.products
SET roast_type = REPLACE(roast_type, 'L', 'Light');

UPDATE OnyXCoffee.products
SET roast_type = REPLACE(roast_type, 'M', 'Medium');

UPDATE OnyXCoffee.products
SET roast_type = REPLACE(roast_type, 'D', 'Dark');

-- Checking again - Type of Roast that Generate Most Revenue --

SELECT products.roast_type, ROUND(SUM(orders.quantity * products.unit_price), 2) AS Revenue
From orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY products.roast_type
ORDER BY Revenue DESC;


-- Profit and revenue of each type of coffee and size --
SELECT orders.product_id, products.coffee_type, products.roast_type, products.Size, ROUND(SUM((orders.Quantity * products.unit_price)), 2) AS Revenue, ROUND(SUM(orders.quantity * products.profit), 2) AS Profit
FROM orders
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY orders.product_id, products.coffee_type, products.roast_type, products.size
ORDER BY profit DESC;


-- Products By Country --

-- Quantity sold and Number of Orders By Country --
SELECT customers.country, SUM(orders.quantity) AS quantity_sold, COUNT(DISTINCT orders.customer_id) AS orders
FROM orders
LEFT JOIN customers ON customers.customer_id = orders.customer_id
GROUP BY customers.country
ORDER BY quantity_sold DESC;

-- Profit and Revenue Per Country --
SELECT customers.country, ROUND(SUM((orders.quantity * products.unit_price)), 2) AS Revenue, ROUND(SUM(orders.quantity * products.profit), 2) AS Profit
FROM orders
LEFT JOIN customers ON customers.customer_id = orders.customer_id
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY customers.country;

--  Most popular product by country --
WITH coffee_type AS (
	SELECT customers.country, products.coffee_type, products.roast_type, products.Size, SUM(quantity) AS Quantity_Sold
	FROM orders
	LEFT JOIN customers ON orders.customer_id = customers.customer_id
	LEFT JOIN products ON orders.product_id = products.product_id
	GROUP BY customers.country, products.coffee_type, products.roast_type, products.size
),
quant_rank AS (
	SELECT *, DENSE_RANK() OVER(PARTITION BY country ORDER BY Quantity_Sold DESC) AS q_rank
    FROM coffee_type
)
SELECT country, coffee_type, roast_type, size, Quantity_Sold
FROM quant_rank
WHERE q_rank = 1
ORDER BY Quantity_Sold DESC;

-- Top 3 cities for each country --
WITH by_country AS (
	SELECT customers.city, customers.country, SUM(orders.quantity) as Quantity_Sold, ROUND(SUM(orders.quantity * products.unit_price), 2) AS Sales
	FROM orders
	LEFT JOIN customers ON orders.customer_id = customers.customer_id
	LEFT JOIN products ON orders.product_id = products.product_id
	GROUP BY customers.Country, customers.city
	ORDER BY Sales DESC
),
sold_rank AS (
	SELECT *, DENSE_RANK() OVER(PARTITION BY country ORDER BY Sales DESC) AS ranking
    FROM by_country
)
SELECT city, country, Quantity_Sold, Sales
FROM sold_rank
WHERE ranking IN (1,2,3);

-- How Revenue made for each Coffee Type by each country --

WITH coffee_sold AS (
 SELECT customers.country, ROUND(SUM(orders.quantity * products.unit_price), 2) AS Revenue, products.coffee_type
 FROM orders
 LEFT JOIN customers ON orders.customer_id = customers.customer_id
 LEFT JOIN products ON orders.product_id = products.product_id
 GROUP BY customers.country, products.coffee_type
),
coffee_ranks AS (
  SELECT *, DENSE_RANK() OVER(PARTITION BY country ORDER BY Revenue DESC) AS coffee_rank
        FROM coffee_sold
)
SELECT coffee_type, country, Revenue
FROM coffee_ranks
ORDER BY Revenue DESC;


-- Top 5 South African Cities by Coffee Bean Sales --
SELECT customers.city, customers.country, SUM(orders.quantity) as Quantity_Sold, 
ROUND(SUM(orders.quantity * products.unit_price), 2) AS Sales
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
LEFT JOIN products ON orders.product_id = products.product_id
WHERE customers.country = 'South Africa'
GROUP BY customers.country, customers.city
ORDER BY Sales DESC
LIMIT 5;


-- Sales Trends -- 

-- Revenue By Year -- 
SELECT YEAR(orders.order_date) AS Years, ROUND(SUM(orders.quantity * products.unit_price), 2) AS Revenue
From orders
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY Years
ORDER BY Years ASC;

-- Revenue Per Month Each Year --
SELECT YEAR(orders.order_date)AS order_year, MONTHNAME(orders.order_date) AS order_month, ROUND(SUM(orders.quantity * products.unit_price), 2) AS Sales 
FROM orders
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY order_year, order_month
ORDER BY Sales DESC;
