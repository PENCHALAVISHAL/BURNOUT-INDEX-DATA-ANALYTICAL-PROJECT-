--Did our employees get more burned out during COVID?
SELECT 
    c.company_name,
    b.year,
    ROUND(AVG(b.burnout_score), 2) AS avg_burnout
FROM fact_burnout_scores b
join dim_company c on c.company_id = b.company_id
WHERE b.year IN (2020, 2021, 2022)
GROUP BY b.year,c.company_name
ORDER BY b.year, avg_burnout DESC;
