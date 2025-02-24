# SQL Data Cleaning Project(Walmart Sales)
This reporitory contains the SQL queries and analysis performed on Walmart Sales dataset. The project aims to provide insights into sales trends, product performance, and store-level analysis to support data-driven decision-making.
![Scn1](https://github.com/user-attachments/assets/48012959-eaf6-4a66-9b82-9cfb07064f1a)

![Scn2](https://github.com/user-attachments/assets/9e6f34f2-fcfa-449c-baf8-9ea38658843d)

## Project Overview
This project analyzes Walmart sales data to identify key performance indicators (KPIs) and uncover actionable insights. We aim to answer questions related to:

* Sales by branch.
* Most Taxed customer types.
* Branch performance and regional differences.
* Impact of Tax on sales.
* Customer behavior and purchasing patterns.

The insights gained from this analysis can be used to optimize inventory management, improve marketing strategies, and enhance overall business performance.

## Data source 
The dataset used in our project was obtained from a Kaggle competition of the Walmart Sales dataset(WalmartSalesData.csv). 
The dataset contains more than 1k rows of sales made.
Key tables include:

* **Sales:** Transaction-level sales data.
* **Stores:** Information about each Walmart store.
* **Features:** Additional features like TAX, COGS.

## SQL Queries

The `walmart data cleaning` directory contains SQL scripts used for data analysis. These scripts include queries for:

* Calculating total sales by store and department.
* Identifying top-performing product categories.
* Analyzing sales trends over time.
* Evaluating the impact of holidays on sales.
* Calculating sales growth and variance.
* Analyzing the effects of taxation on sales.

### feature engineering
```
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
```

## Findings
* Fashion accessories generates the highest sales.
* Alot of the customers pay by cash followed by Ewallet and then credit card.
* January generated the most sales then march and last february.
* Food and beverages generates the largest revenue.
* The city of Naypyitaw had the most revenue as compared to the other cities.
* Home and lifestyle was the most taxed product line.
* Alot of female shopped for fashion accessories while men shopped for healtha and beauty mostly.

## Setup and Usage

1.  **Database Setup:**
    * Import the Walmart sales data into a SQL database (e.g., MySQL, PostgreSQL, SQLite).
    * Ensure the database schema matches the provided description.
2.  **Run SQL Queries:**
    * Use a SQL client or tool to execute the queries in the `walmart data cleaning/` directory.
    * Modify the queries as needed for your specific analysis.
3.  **Analyze Results:**
    * Interpret the query results and generate reports or visualizations.
    * Use the insights to make data-driven decisions.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.





































































































