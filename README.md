# The Burnout Index — Indian IT Sector 2019–2024

A data analytics project measuring employee burnout risk across 9 major 
Indian IT companies using a composite scoring model built on four 
weighted indicators.

**Tools:** Excel (Power Query) · PostgreSQL · Power BI  
**Data Sources:** Glassdoor · Yahoo Finance · SEBI Annual Reports  
**Period:** 2019 – 2024  
**Companies:** TCS · Infosys · Wipro · HCL Tech · Tech Mahindra · 
LTIMindtree · Mphasis · Persistent Systems · Coforge

---

## The Core Finding

Every company in this study peaked in burnout in 2022. 
Industry average burnout rose 35% between 2020 and 2022, 
driven by the Great Resignation — mass hiring, record attrition, 
and collapsing sentiment scores hitting simultaneously.

**The Exploitation Index:** Infosys and Tech Mahindra showed 
burnout scores above 45 while maintaining stock prices above ₹1,000 
across multiple years — suggesting shareholder returns were generated 
alongside measurable workforce deterioration.

---

## Project Structure
BurnoutIndex/
├── 01_raw_data/          # Original CSVs from Glassdoor, Yahoo Finance
├── 02_cleaned_data/      # Excel workbook with Power Query cleaning
│   └── BurnoutIndex_Master.xlsx
├── 03_sql/               # PostgreSQL queries
│   ├── query_01_burnout_leaderboard.sql
│   ├── query_02_covid_impact.sql
│   ├── query_03_sentiment_vs_stock.sql
│   ├── query_04_wlb_stock_growth.sql
│   └── query_05_exploitation_index.sql
├── 04_powerbi/           # Power BI dashboard
│   └── BurnoutIndex_Dashboard.pbix
└── 05_report/            # Written analytical report
└── BurnoutIndex_Report.pdf

---

## The Burnout Score Formula
Burnout Score =
(5 - avg_sentiment) / 4  × 40%   ← Sentiment (inverted)

attrition_pct / 40      × 30%   ← Attrition rate
(5 - avg_wlb) / 4       × 20%   ← Work-life balance (inverted)
hiring_surge / 3         × 10%   ← Hiring velocity


Grounded in the Job Demands-Resources (JD-R) model — burnout occurs 
when job demands consistently exceed available resources.

---

## Database Schema (PostgreSQL Star Schema)
dim_company (9 rows)
↓ company_id
├── fact_burnout_scores  (54 rows — 9 companies × 6 years)
├── fact_attrition       (54 rows)
├── fact_reviews         (6,348 rows)
└── fact_stock           (247 rows)

---

## Key Results

| Company | Avg Burnout | Risk Tier | Finding |
|---------|-------------|-----------|---------|
| Tech Mahindra | 47.2 | Medium | Highest average burnout |
| Infosys | 46.3 | Medium | Exploitation Index member |
| Wipro | 45.4 | Medium | High burnout, low stock |
| TCS | 39.9 | Low-Medium | Best Tier-1 performer |
| Mphasis | 39.6 | Low | Best balanced performer |
| Persistent | 35.5 | Low | Lowest burnout, best WLB |

---

## How to Run

**SQL (PostgreSQL):**
1. Install PostgreSQL
2. Create database: `CREATE DATABASE burnout_index_db;`
3. Run schema setup, then import data via staging tables
4. Execute queries from `/03_sql/`

**Power BI:**
1. Open `/04_powerbi/BurnoutIndex_Dashboard.pbix`
2. Connect to your local PostgreSQL instance
3. Credentials: localhost · burnout_index_db · postgres

---

## Data Notes

- Glassdoor reviews are synthetically generated using real public 
  company rating averages as the statistical basis
- Stock data is real, sourced from Yahoo Finance
- Attrition data for Tier-1 companies verified against SEBI annual 
  reports; Tier-2 figures estimated from IR press releases
- Hiring surge index is analyst-constructed based on known industry 
  hiring patterns 2019–2024

---

## Author

**P. Vishal**  
Data Analytics Project · May 2026  
GitHub: https://github.com/PENCHALAVISHAL
