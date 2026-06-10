--Is there any connection between how unhappy employees are and how our stock performs?
SELECT 
    c.company_name,
    b.year,
    ROUND(AVG(b.avg_sentiment), 2) AS avg_sentiment,
	ROUND(AVG(s.stock_close_inr), 2) AS avg_stock
FROM fact_burnout_scores b
join dim_company c on c.company_id = b.company_id
JOIN fact_stock s ON s.company_id= c.company_id
and EXTRACT(YEAR FROM s.stock_date) = b.year
GROUP BY b.year,c.company_name
ORDER BY b.year, avg_stock DESC;