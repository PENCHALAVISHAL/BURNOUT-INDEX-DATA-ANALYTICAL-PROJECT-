
--Show companies with above average WLB rating AND stock price growth from 2019 to 2024
SELECT
	c.company_name,
	EXTRACT(YEAR FROM s.stock_date) AS stock_year,
	ROUND(AVG(r.wlb_rating), 2) AS avg_wlb,
    ROUND(AVG(s.stock_close_inr), 2) AS avg_stock
from fact_reviews r
join dim_company c on c.company_id = r.company_id
join fact_stock s on s.company_id = c.company_id
GROUP BY c.company_name, EXTRACT(YEAR FROM s.stock_date)
HAVING AVG(r.wlb_rating) > (SELECT AVG(wlb_rating) FROM fact_reviews);