# REQUEST - 4

-- Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, 
-- segment 
-- product_count_2020 
-- product_count_2021 
-- difference 

WITH `2020` AS (SELECT 
	p.segment, COUNT(DISTINCT(s.product_code)) AS product_count_2020
FROM dim_product p
JOIN fact_sales_monthly s
	ON p.product_code = s.product_code
WHERE fiscal_year = 2020
GROUP BY segment
ORDER BY product_count_2020 DESC),
`2021` AS (SELECT 
	p.segment, COUNT(DISTINCT(s.product_code)) AS product_count_2021
FROM dim_product p
JOIN fact_sales_monthly s
	ON p.product_code = s.product_code
WHERE fiscal_year = 2021
GROUP BY segment
ORDER BY product_count_2021 DESC)
SELECT 
	`2020`.segment,
    `2020`.product_count_2020,
    `2021`.product_count_2021,
	(product_count_2021 - product_count_2020) AS difference
FROM `2020`
JOIN `2021`
	ON `2020`.segment = `2021`.segment
GROUP BY segment;