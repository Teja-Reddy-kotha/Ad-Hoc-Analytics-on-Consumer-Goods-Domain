# REQUEST - 7

-- Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get an idea of 
-- low and high-performing months and take strategic decisions. The final report contains these columns: 
-- Month, Year and Gross sales Amount 

SELECT 
	MONTHNAME(s.date) AS month,
    s.fiscal_year AS year,
    ROUND(SUM(g.gross_price * s.sold_quantity), 2) AS gross_sales_amount
FROM fact_sales_monthly s
JOIN fact_gross_price g
ON s.product_code = g.product_code
JOIN dim_customer c
ON s.customer_code = c.customer_code
WHERE customer = "Atliq Exclusive"
GROUP BY s.fiscal_year, MONTH(s.date);