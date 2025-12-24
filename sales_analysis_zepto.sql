create database miniproj;
use miniproj;

CREATE TABLE zepto (
    sku_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp DECIMAL(8 , 2 ),
    discountPercent DECIMAL(5 , 2 ),
    availableQuantity INT,
    discountedSellingPrice DECIMAL(8 , 2 ),
    weightInGms INT,
    outOfStock varchar(10),
    quantity INT
);
-- data exploration
select * from zepto;
select count(*) from zepto;
select * from zepto limit 10;

SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

-- different product categories
SELECT DISTINCT
    category
FROM
    zepto
ORDER BY category;

-- products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

-- product names present multiple times
SELECT name, COUNT(sku_id) AS "Number of SKUs"
FROM zepto
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC;

-- data claning 
-- product with 0 price 
SELECT 
    *
FROM
    zepto
WHERE
    mrp = 0 OR discountedSellingPrice = 0;
    
delete from zepto where mrp=0;

-- convert paise to rupees
update zepto set mrp=mrp/100.0, discountedSellingPrice = discountedSellingPrice / 100.0;
SELECT mrp, discountedSellingPrice FROM zepto;

-- queries for data analysis
-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT
    name, mrp, discountPercent
FROM
    zepto
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2.What are the Products with High MRP but Out of Stock
SELECT DISTINCT
    name, mrp
FROM
    zepto
WHERE
    outOfStock = TRUE
ORDER BY mrp DESC;

-- Q3.Calculate Estimated Revenue for each category
SELECT 
    category,
    SUM(discountedSellingPrice * availableQuantity) AS ttl_revenue
FROM
    zepto
GROUP BY category
ORDER BY ttl_revenue DESC;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT 
    name, mrp, discountPercent
FROM
    zepto
WHERE
    mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT 
    category, avg(discountPercent) AS avgdisc
FROM
    zepto
GROUP BY category
ORDER BY avgdisc DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT
    name,
    weightInGms,
    discountedSellingPrice,
    ROUND(discountedSellingPrice / weightInGms,2) AS ppg
FROM
    zepto
WHERE
    weightInGms >= 100
ORDER BY ppg;

-- Q7.Group the products into categories like Low, Medium, Bulk.
SELECT 
    name,
    weightInGms,
    CASE
        WHEN weightInGms < 2000 THEN 'LOW'
        WHEN weightInGms < 5000 THEN 'MEDIUM'
        ELSE 'BULK'
    END AS wt_category
FROM
    zepto;


-- Q8.What is the Total Inventory Weight Per Category 
SELECT 
    category, SUM(weightInGms * availableQuantity) AS ttl_wt
FROM
    zepto
GROUP BY category
ORDER BY ttl_wt;



