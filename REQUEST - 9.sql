# REQUEST - 9

-- Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields, 
-- channel 
-- gross_sales_mln 
-- percentage

WITH cte AS 
	(
    SELECT
	channel,
    ROUND(SUM(g.gross_price * s.sold_quantity) / 1000000, 2) AS gross_sales_mln
FROM fact_sales_monthly s
JOIN fact_gross_price g
ON s.product_code = g.product_code
JOIN dim_customer c
ON s.customer_code = c.customer_code
WHERE s.fiscal_year = 2021
GROUP BY channel),
cte2 AS (
	SELECT
		SUM(gross_sales_mln) AS total_sales
	FROM cte)
SELECT 
	channel,
    gross_sales_mln,
	ROUND(((gross_sales_mln / total_sales) * 100),2) AS percentage
FROM cte
JOIN cte2
ORDER BY percentage DESC;