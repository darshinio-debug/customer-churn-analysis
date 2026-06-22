Create DATABASE churn_analysis;

USE churn_analysis;

SELECT COUNT (*) from [WA_Fn-UseC_-Telco-Customer-Churn];


SELECT TOP 5 *
FROM [WA_Fn-UseC_-Telco-Customer-Churn];

--1,Overall Churn Rate
---The first and most important KPI — what percentage of customers are leaving?

SELECT
COUNT(*) AS Total_customers,
SUM(CASE WHEN churn='Yes' then 1 ELSE 0 END) AS churned_customers,
SUM(CASE WHEN churn='No'THEN 1 ELSE 0 END) AS Retained_customers,
ROUND(SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) *100.0/ COUNT(*), 2)
AS churn_rate_pct
from [WA_Fn-UseC_-Telco-Customer-Churn];

---Churn by Contract Type
----2, Month-to-month contracts are the biggest risk factor. This query proves it:

SELECT 
Contract,
COUNT(*) As total_customers,
SUM(CASE WHEN churn ='yes' THEN 1 ELSE 0 END) AS churned,
ROUND(AVG(CASE WHEN churn='yes' THEN 1.0  ELSE 0.0 END) *100,2) AS churn_pct
from [WA_Fn-UseC_-Telco-Customer-Churn]
GROUP BY Contract
ORDER BY churn_pct DESC;


---Average Charges: Churned vs Retained
---3, Do churned customers pay more? This reveals pricing pressure as a driver:

SELECT
Churn,
ROUND(AVG(MonthlyCharges),2)  AS avg_monthly_charge,
ROUND(AVG(tenure),1) AS avg_tenure_months,
ROUND(AVG(TotalCharges),2) AS avg_total_charges
FROM [WA_Fn-UseC_-Telco-Customer-Churn]
GROUP BY Churn;


---Revenue Lost Due to Churn
---4, Quantify the financial impact— this is the number that goes in your resume bullet:

SELECT 
ROUND(SUM(CASE WHEN churn='yes' THEN MonthlyCharges ELSE 0 END),2)  AS monthly_revenue_lost,
ROUND(SUM(CASE WHEN churn='yes' THEN TotalCharges ELSE 0 END),2) AS total_revenue_lost,
ROUND(SUM(CASE WHEN churn='no' AND Contract='Month-to-month'
THEN MonthlyCharges ELSE 0 END), 2) AS revenue_at_risk
from [WA_Fn-UseC_-Telco-Customer-Churn];


ALTER TABLE [WA_Fn-UseC_-Telco-Customer-Churn]
ALTER COLUMN Churn NVARCHAR(50);


ALTER Table [WA_Fn-UseC_-Telco-Customer-Churn]
ALTER COLUMN Contract NVARCHAR(50);


---Churn by Payment Method
---5, Electronic check users churn the most. This drives a payment nudge recommendation:

SELECT
PaymentMethod,
COUNT(*) AS total,
ROUND(AVG(CASE WHEN churn='yes' THEN 1.0 ELSE 0 END)*100,2) AS churn_pct
from [WA_Fn-UseC_-Telco-Customer-Churn]
GROUP BY PaymentMethod
ORDER BY churn_pct DESC;

SELECT TOP 5*
from [WA_Fn-UseC_-Telco-Customer-Churn]

---High-Risk Customer Segmentation (Window Function)
---6,Use NTILE to bucket retained customers by tenure and charges — find who is most at risk of churning next:

SELECT 
customerID,
tenure,
MonthlyCharges,
Contract,
PaymentMethod,
NTILE(4) OVER (ORDER BY MonthlyCharges DESC) As charge_quartile,
NTILE(4) OVER(ORDER BY tenure ASC) AS tenure_quartile,
CASE
WHEN NTILE(4) OVER ( ORDER BY tenure ASC) = 1
AND NTILE(4) OVER ( ORDER BY MonthlyCharges DESC)=1
THEN 'high risk'
ELSE 'MONITOR' 
END AS risk_flag
from [WA_Fn-UseC_-Telco-Customer-Churn]
WHERE churn='no' AND Contract='Month-to-month';

--Senior Citizen Churn Analysis
--7, An insight specific to this dataset — senior citizens churn at nearly double the rate:

SELECT
CASE WHEN SeniorCitizen =1 THEN 'Senior' ELSE 'Non-senior' END AS segment,
COUNT(*) AS total,
ROUND(AVG(CASE WHEN churn='yes' THEN 1 ELSE 0 END)*100,2) AS churn_pct,
ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge
from [WA_Fn-UseC_-Telco-Customer-Churn]
GROUP BY SeniorCitizen;


