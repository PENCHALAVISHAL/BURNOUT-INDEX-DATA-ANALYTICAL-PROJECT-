--Which of our competitors has the worst burnout problem?
SELECT c.company_id, c.company_name, ROUND(avg(b.burnout_score),2) as avg_burnout
from fact_burnout_scores b
join dim_company c on c.company_id = b.company_id
group by c.company_id
order by avg_burnout DESC;