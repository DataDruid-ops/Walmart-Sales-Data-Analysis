-- ------------------------------------------------------------------------

-- -------------------------------------------------------------------------
-- -------------------------------generic questions -------------------------
-- How many unique cities does the data have?
SELECT 
	DISTINCT city
    FROM sales;

-- IN which city is each branch?
SELECT 
	DISTINCT branch
    FROM sales;
    
SELECT
	DISTINCT city,
    branch
FROM sales;

-- ---------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------
-- -----------------------Product--------------------------------------------------------
-- How many unique product lines does the data have?
SELECT
	DISTINCT product_line
FROM sales;
-- count
SELECT
	COUNT(DISTINCT product_line)
FROM sales;

-- what is the most common payment method?
SELECT
	payment_method
FROM sales;

-- count the different payment methods
SELECT
	payment_method,
    COUNT(payment_method) AS cnt
FROM sales
GROUP BY payment_method
ORDER BY cnt DESC;

-- what is the most selling product line?
SELECT
	product_line,
    COUNT(product_line) AS cnt
FROM sales
GROUP BY product_line 
ORDER BY cnt DESC;

-- what is the total revenue by month?
SELECT
	month_name AS month,
    SUM(total) AS total_revenue
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC;

-- what month had the largest cogs?
SELECT
	month_name AS month,
    SUM(cogs) AS cogs
FROM sales
GROUP BY month_name
ORDER BY cogs DESC;

-- what product line had the largest revenue?
SELECT 
product_line,
SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- what is the city with the largest revenue?
SELECT
branch, 
city,
SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch
ORDER BY total_revenue DESC;

-- what product line had the largest VAT?
SELECT
	product_line,
    AVG(VAT) AS avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;

-- which branch sold more products than average product sold?
SELECT 
	branch,
    SUM(quantity) AS qty
FROM sales
GROUP BY branch
HAVING  SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- what is the most product line by gender?
SELECT
	gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM sales
GROUP BY gender, product_line
ORDER BY total_cnt DESC;

-- what is the average rating of each product line?
SELECT 
	AVG(rating) AS avg_rating,
    product_line
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- -----------------------------------------------------------------------------
-- -------------------------------SALES---------------------------------
-- Number of sales made in each time of the day per weekday?
SELECT 
	time_of_day,
	COUNT(*) AS total_sales
FROM sales
GROUP BY time_of_day
ORDER BY total_sales DESC
;

-- Which of the customer types brings the most revenue?
SELECT
	customer_type,
    SUM(total) AS total_rev
FROM sales
GROUP BY customer_type
ORDER BY total_rev DESC
;

-- Which city has the largest VAT?
SELECT
	city,
    AVG(VAT) AS VAT
FROM sales
GROUP BY city
ORDER BY VAT DESC
;

-- Which customer type pays the most VAT?
SELECT
	customer_type,
    AVG(VAT) AS VAT
FROM sales
GROUP BY customer_type
ORDER BY VAT DESC
;

-- ------------------------------------------------------------------
-- ---------------------------Customer-------------------------=-----
-- How many unique customer types does the data have?
SELECT 
	DISTINCT customer_type
FROM sales

;

-- How many unique payment methods does the data have?
SELECT 
	DISTINCT payment_method
FROM sales

;

-- What is the most common customer type?
SELECT 
	customer_type,
    COUNT(*) AS cstm_cnt
FROM sales
GROUP BY customer_type
ORDER BY cstm_cnt DESC
;

-- Which customer type buys the most?
SELECT 
	customer_type,
    COUNT(*) AS cstm_cnt
FROM sales
GROUP BY customer_type
;

-- What is the gender of most of the customers?
SELECT 
	gender,
    COUNT(*) AS gender_cnt
FROM sales
GROUP BY gender
ORDER BY gender_cnt DESC
;

-- what is the gender distribution per branch?
 SELECT 
	gender,
    COUNT(*) AS gender_cnt
FROM sales
WHERE branch = "A"
GROUP BY gender
ORDER BY gender_cnt DESC
;

-- what time of the day do customers give most ratings?
SELECT
	time_of_day,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC
;

-- which time of the day do customers give rating per branch?
SELECT
	time_of_day,
    AVG(rating) AS avg_rating
FROM sales
WHERE branch = "A"
GROUP BY time_of_day
ORDER BY avg_rating DESC
;

-- which day of the week has the best avg ratings?
SELECT 
	day_name,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name
ORDER BY avg_rating DESC
;

-- which day of the week has the best average rating per branch?
SELECT 
	day_name,
    AVG(rating) AS avg_rating
FROM sales
WHERE branch = "C"
GROUP BY day_name
ORDER BY avg_rating DESC
;
