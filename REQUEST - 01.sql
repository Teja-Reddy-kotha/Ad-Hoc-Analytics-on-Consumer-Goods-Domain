# REQUEST - 1

--  Provide the list of markets in which customer  "Atliq  Exclusive"  operates its business in the  APAC  region.

SELECT DISTINCT(market) FROM dim_customer
WHERE customer = "Atliq Exclusive" AND region = "APAC"
ORDER BY market;


SELECT DISTINCT c.market, 
       ROUND(SUM(g.gross_price * s.sold_quantity),2) AS gross_sales 
FROM fact_sales_monthly s
JOIN dim_customer c ON s.customer_code = c.customer_code
JOIN fact_gross_price g ON s.product_code = g.product_code
WHERE c.customer = "Atliq Exclusive" 
  AND c.region = "APAC"
GROUP BY c.market
ORDER BY c.market;