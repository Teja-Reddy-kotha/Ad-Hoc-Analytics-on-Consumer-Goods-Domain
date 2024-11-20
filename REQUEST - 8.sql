# REQUEST - 8

-- In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity, 
-- Quarter and total_sold_quantity
-- Type - 1 (Use type 2 for more accurate results)

SELECT 
	CASE
        WHEN MONTH(date) IN (9, 10, 11) THEN CONCAT('Q1 - ', MONTHNAME(date))
        WHEN MONTH(date) IN (12, 1, 2) THEN CONCAT('Q2 - ', MONTHNAME(date))
        WHEN MONTH(date) IN (3, 4, 5) THEN CONCAT('Q3 - ', MONTHNAME(date))
        WHEN MONTH(date) IN (6, 7, 8) THEN CONCAT('Q4 - ', MONTHNAME(date))
        ELSE NULL
	END AS quarter,
    SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY quarter;


-- Type - 2
SELECT 
	CASE
        WHEN date BETWEEN '2019-09-01' AND '2019-11-01' THEN 'Q1'
        WHEN date BETWEEN '2019-12-01' AND '2020-02-01' THEN 'Q2'
        WHEN date BETWEEN '2020-03-01' AND '2020-05-01' THEN 'Q3'
        WHEN date BETWEEN '2020-06-01' AND '2020-08-01' THEN 'Q4'
        ELSE NULL
	END AS quarter,
    SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY quarter
ORDER BY total_sold_quantity DESC;