-- -------------------------------------------------------------------------------------------------------------
-- ------------------------WALMART SALES DATA ANALYSIS----------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS Walmartsales;

CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10, 2)  NOT NULL,
    quantity INT NOT NULL,
    VAT FLOAT(6, 4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10, 2) NOT Null,
    gross_margin_pct FLOAT(11, 9),
    gross_income DECIMAL(12, 4) NOT NULL,
    rating FLOAT(2, 1)

);

---------------------------------------------------------------------------------------------------------------------------------------
-- -----------------------Feature Engineering-------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
-- time_of_day

SELECT 
    time,
    CASE 
        WHEN time >= '00:00:00' AND time < '12:00:00' THEN 'Morning'
        WHEN time >= '12:00:00' AND time < '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = (
 CASE 
        WHEN time >= '00:00:00' AND time < '12:00:00' THEN 'Morning'
        WHEN time >= '12:00:00' AND time < '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END
    );
    
-- day_name

SELECT 
    date,
    DAYNAME(date) AS day_name
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);

-- month_name

SELECT 
	date,
    MONTHNAME(date)
    FROM sales;
    
ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);






















































































































































