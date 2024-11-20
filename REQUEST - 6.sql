# REQUEST - 6

-- Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021
-- and in the Indian market. The final output contains these fields, 
-- customer_code, customer and average_discount_percentage 

SELECT 
	p.customer_code,
    p.customer,
    ROUND(AVG(pd.pre_invoice_discount_pct), 4) AS avg_discount_pct
FROM dim_customer p
JOIN fact_pre_invoice_deductions pd
ON p.customer_code = pd.customer_code
WHERE fiscal_year = 2021 AND market = "india"
GROUP BY customer_code
ORDER BY avg_discount_pct DESC
LIMIT 5;