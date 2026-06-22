# 📊 Customer Churn Analysis Dashboard

![SQL](https://img.shields.io/badge/SQL-Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-Measures-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)

> **Business Question:** *"Which customer segments are most at risk of churning, and how much revenue is at stake?"*

An end-to-end data analytics project analyzing telecom customer churn using SQL Server and Power BI — identifying root causes, quantifying revenue impact, and surfacing high-risk customers for retention intervention.


---

## 📌 Project Overview

This project analyzes **7,043 telecom customer records** to understand why customers leave, which segments churn most, and how much monthly revenue is at risk. The output is a 3-page interactive Power BI dashboard designed for business decision-makers and retention teams.

### Tools & Tech Stack

| Tool | Purpose |
|---|---|
| SQL Server (T-SQL) | Data cleaning, querying, window functions |
| Power BI Desktop | 3-page interactive dashboard |
| DAX | Calculated measures and KPIs |
| GitHub | Portfolio documentation |
| Power BI Service | Dashboard publishing |

---

## 📂 Repository Structure

```
customer-churn-analysis/
│
├── README.md                          ← You are here
│
├── /sql/
│   ├── 01_overall_churn_rate.sql      ← SQL part
│ 
│
├── /data/
│   └── WA_Fn-UseC_-Telco-Customer-Churn.csv   ← Raw dataset
│
├── /powerbi/
│   └── customer_churn_dashboard.pbix  ← Power BI report file
│
└── /screenshots/
    ├── page1_churn_overview.png        ← Executive overview page
    ├── page2_risk_segmentation.png     ← Customer risk page
    └── page3_revenue_impact.png        ← Revenue & recommendations page
```

---

## 🔍 SQL Analysis — Key Queries

All queries are written in **T-SQL (SQL Server)** and cover 7 business questions:

| # | Query | Technique Used |
|---|---|---|
| 1 | Overall Churn Rate | CASE WHEN, aggregate functions |
| 2 | Churn by Contract Type | GROUP BY, ORDER BY, AVG |
| 3 | Avg Charges: Churned vs Retained | Multi-column aggregation |
| 4 | Revenue Lost & Revenue At Risk | Conditional SUM |
| 5 | Churn by Payment Method | GROUP BY, percentage calculation |
| 6 | High-Risk Customer Segmentation | **NTILE()** window function |
| 7 | Senior Citizen Churn Analysis | CASE WHEN, demographic grouping |


---

## 📊 Power BI Dashboard — 3 Pages

### Page 1 — Customer Churn Overview
Executive landing page. Designed for a manager to understand the situation in under 30 seconds.

**Visuals:** KPI Cards (Churn Rate, Total Churned, Revenue Lost, Avg Tenure) · Donut Chart · Churn by Contract Bar Chart · Churn by Internet Service 100% Stacked Bar · Slicers (Contract, Gender)

![Page 1](https://github.com/darshinio-debug/customer-churn-analysis/blob/main/Executive%20Overview.png)

---

### Page 2 — Customer Risk Segmentation
Analytical deep-dive. Shows WHO is churning and what profile they share.

**Visuals:** Scatter Plot (Tenure vs Monthly Charges by Churn) · Payment Method Bar Chart · Senior Citizen Column Chart · High-Risk Customer Table · Slicers (Contract, Gender, Internet Service)

![Page 2](https://github.com/darshinio-debug/customer-churn-analysis/blob/main/Risk%20Segmentation.png)

---

### Page 3 — Revenue Impact & Recommendations
Business action page. Converts analysis into financial impact and retention strategy.

**Visuals:** Revenue Lost / At Risk / Retained KPI Cards · Churn by Tenure Bucket Line Chart · Revenue Impact Bar Chart · Churn Rate by Monthly Charge Band · Monthly Savings Gauge · Service Stickiness Matrix · Slicers (Contract, Tenure Bucket)

![Page 3](https://github.com/darshinio-debug/customer-churn-analysis/blob/main/Revenue%20Impact.png)


---

## 💡 Key Findings

| Finding | Metric |
|---|---|
| Overall churn rate | **26.54%** — 1 in 4 customers is leaving |
| Month-to-month contract churn | **~42%** vs only 3% for two-year contracts |
| Highest churn payment method | **Electronic check** users churn at nearly 2x auto-pay rate |
| Early churn risk | **>50% of churned customers** left within their first 12 months |
| Senior citizen churn | Seniors churn at **nearly double** the rate of non-seniors |
| Monthly revenue lost | **$139,130** per month from churned customers |
| Revenue still at risk | **$136,450** from retained month-to-month customers |

---

## 🎯 Business Recommendations

1. **Convert month-to-month customers to annual contracts** — reduces churn from 42% to potential 11%
2. **Target electronic check users with auto-pay incentives** — highest churn payment segment
3. **Focus retention campaigns on customers in their first 12 months** — highest dropout window
4. **Launch loyalty programs for senior citizens** — churning at nearly double the base rate
5. **Upsell TechSupport and OnlineSecurity** — customers with these services show significantly lower churn
6. **Monitor high monthly charge customers on short-tenure** — highest revenue-at-risk segment

---

## 🚀 How to Run This Project

**SQL:**
1. Download the dataset from [Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)
2. Open SQL Server Management Studio (SSMS)
3. Create a new database: `CREATE DATABASE churn_analysis;`
4. Import the CSV using the Import Flat File wizard
5. Run queries from the `/sql` folder in order (01 → 07)

**Power BI:**
1. Open `customer_churn_dashboard.pbix` in Power BI Desktop
2. Update the data source path to your local CSV file
3. Click **Refresh** to load data
4. Use slicers on each page to explore segments interactively

---

## 📄 License

This project uses the publicly available IBM Telco Customer Churn dataset
for educational/portfolio purposes.

