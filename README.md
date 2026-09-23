# 🏦 Bank Loan Analytics | SQL + Power BI

An end-to-end **Bank Loan Analytics project using PostgreSQL and Microsoft Power BI** to analyze loan applications, portfolio performance, repayment patterns, credit risk, and borrower segments.

The project combines **SQL-based exploratory and business analysis** with an interactive **Power BI dashboard** to transform raw loan data into actionable business insights.

---

## 📌 Project Overview

The dataset contains **38,576 loan applications** with information about:

* Loan amount and repayments
* Loan status
* Loan grade and sub-grade
* Interest rate
* Debt-to-Income (DTI) ratio
* Loan purpose
* Loan term
* Employment information
* Home ownership
* Verification status
* Borrower state
* Application date

The project was developed in two major layers:

### 🔹 SQL Analysis

PostgreSQL was used to:

* Validate the dataset
* Check duplicates and missing values
* Explore portfolio structure
* Analyze loan status and loan grades
* Calculate loan and repayment metrics
* Analyze monthly and regional trends
* Measure bad-loan rates
* Compare risk across grades, purposes, terms and verification status
* Apply CTEs and window functions for advanced analysis

### 🔹 Power BI Dashboard

Power BI was used to convert the analysis into an interactive management dashboard with KPIs, filters, charts, navigation and portfolio-level insights.

---

# 🗂️ Project Workflow

```text
Raw Loan Dataset
       ↓
Data Validation
       ↓
PostgreSQL
       ↓
EDA & Business Analysis
       ↓
Risk & Portfolio Analysis
       ↓
Power BI Data Modeling
       ↓
DAX Measures
       ↓
Interactive Dashboard
       ↓
Business Insights & Recommendations
```

---

# 🛠️ Tools & Technologies

| Tool            | Purpose                                         |
| --------------- | ----------------------------------------------- |
| **PostgreSQL**  | Data analysis & business queries                |
| **SQL**         | EDA, aggregations, segmentation & risk analysis |
| **Power BI**    | Dashboard development & visualization           |
| **Power Query** | Data transformation                             |
| **DAX**         | KPI and calculated measures                     |
| **Excel / CSV** | Source dataset                                  |
| **GitHub**      | Project documentation & version control         |

---

# 📊 Dataset

**Total Records:** 38,576
**Total Columns:** 23

The dataset contains loan-level information covering applications, borrower attributes, loan characteristics, repayment information and loan status.

### Important analytical fields

```text
ISSUE_DATE
LOAN_AMOUNT
TOTAL_PAYMENT
LOAN_STATUS
GRADE
SUB_GRADE
PURPOSE
TERM
INT_RATE
DTI
HOME_OWNERSHIP
VERIFICATION_STATUS
ADDRESS_STATE
ANNUAL_INCOME
EMP_LENGTH
```

---

# 🔍 Part 1 — Exploratory Data Analysis

The first stage of the project focused on understanding and validating the dataset.

### Data Quality Checks

* Total record count
* Column structure
* Duplicate loan IDs
* Duplicate member IDs
* Missing-value analysis
* Date range validation
* Loan amount statistics
* Income statistics
* Interest-rate statistics
* DTI statistics

### Portfolio Exploration

The SQL analysis also examined:

* Loan status distribution
* Loan purpose distribution
* Grade and sub-grade distribution
* Home ownership
* Verification status
* Loan term
* State-wise loan distribution
* Monthly application trends
* Monthly funded amount
* Charged-off loans
* Good vs Bad vs Current loans

---

# 📈 Part 2 — Business & Risk Analysis

After understanding the dataset, the analysis moved from descriptive EDA to business-focused questions.

### Key business questions included:

* What is the total number of loan applications?
* What is the total funded amount?
* How much payment is recorded in the portfolio?
* Which grades have the highest number of charged-off loans?
* Which states have the highest loan exposure?
* Which states have the highest charged-off amount?
* Which grades have the highest average interest rate?
* How has the portfolio changed month by month?
* What is the average DTI across loan grades?
* Which grades have the highest charged-off amount?
* What percentage of loans are Good, Bad and Current?
* Which grades have the highest bad-loan rate?
* Which loan purposes have the highest bad-loan rate?
* Does loan term affect bad-loan rate?
* Does verification status affect bad-loan rate?

---

# 📊 Key Portfolio Metrics

| Metric                |        Value |
| --------------------- | -----------: |
| Loan Applications     |   **38,576** |
| Total Funded Amount   | **₹435.76M** |
| Total Payment         | **₹473.07M** |
| Average Interest Rate |   **12.05%** |
| Average DTI           |   **13.33%** |
| Good Loan Share       |   **86.18%** |
| Bad Loan Share        |   **13.82%** |

> **Note:** Total payment is a portfolio-level recorded payment figure. The difference between total payment and total funded amount should not be interpreted as profit, because the dataset does not provide a complete accounting of lending revenue, costs, recoveries, or losses.

---

# 📊 Power BI Dashboard

The Power BI report contains two primary pages.

## 1️⃣ Summary

The Summary page provides a high-level view of portfolio performance.

### KPIs

* Total Loan Applications
* Total Funded Amount
* Total Amount Received
* Average Interest Rate
* Average DTI
* Good Loan Applications
* Bad Loan Applications

### Visual Analysis

* Funded Amount vs Payment by Loan Status
* Loan Applications by Status
* Average Interest Rate by Loan Status
* Average DTI by Loan Status
* Good vs Bad Loan distribution

---

# 2️⃣ Overview

The Overview page provides deeper portfolio segmentation.

### Visuals

* 📈 Monthly Loan Applications
* 🗺️ Regional / State Analysis
* 🍩 Loan Term Distribution
* 🏠 Home Ownership Analysis
* 🌳 Loan Purpose Breakdown
* Grade Analysis

### Interactive Controls

* Purpose Filter
* Grade Filter
* Reset Filters
* Summary ↔ Overview Navigation
* Interactive cross-filtering

---

# 🔎 Key Analytical Findings

### 1. Loan grade is an important risk dimension

The observed bad-loan rate varies across loan grades, with risk increasing across the lower-grade segments.

This makes **grade-level monitoring** useful when evaluating portfolio quality.

---

### 2. Portfolio exposure is geographically concentrated

Some states account for significantly more funded loan amount than others.

Therefore, state-level analysis can help identify where the largest portfolio exposures are located.

---

### 3. Loan purpose shows different risk levels

Bad-loan rates vary across loan purposes.

Large purpose segments can therefore be monitored separately instead of evaluating the entire portfolio using one overall risk percentage.

---

### 4. Loan term is another useful risk dimension

The observed bad-loan rate differs between 36-month and 60-month loans.

This makes loan term an important dimension for portfolio monitoring.

---

### 5. Portfolio volume changes over time

Monthly analysis helps identify changes in application volume and funded amount, allowing stakeholders to monitor portfolio growth and changes in lending activity.

---

# 💼 Business Value

The project demonstrates how raw lending data can be transformed into information that can support business monitoring.

### A lending team could use the dashboard to:

* Monitor overall portfolio health
* Track funded and payment amounts
* Identify charged-off exposure
* Compare risk across loan grades
* Monitor geographic concentration
* Analyze loan-purpose performance
* Compare loan terms
* Track monthly lending activity
* Investigate borrower segments
* Identify areas requiring deeper risk analysis

---

# 💡 Business Recommendations

Based on the analysis, the following improvements can make the lending analytics process more effective:

### 1. Monitor Risk × Exposure

Instead of looking only at bad-loan percentage, monitor:

**Bad-loan rate + Funded Amount + Charged-off Amount**

A segment with both high exposure and high bad-loan rate deserves closer investigation.

---

### 2. Create a Dedicated Risk Dashboard

A future Power BI page could track:

* Bad-loan rate
* Charged-off amount
* Average DTI
* Average interest rate
* Loan grade
* Loan purpose
* Loan term
* State

This would give risk teams a focused portfolio-monitoring view.

---

### 3. Investigate High-Risk Loan Purposes

Loan purposes with higher observed bad-loan rates can be investigated further by combining:

```text
Purpose
↓
Grade
↓
Income
↓
DTI
↓
Term
↓
State
```

This can help identify whether the observed risk is concentrated within a specific borrower segment.

---

### 4. Monitor Geographic Concentration

Track funded amount and charged-off amount by state.

This can help management understand where portfolio exposure is concentrated and where additional analysis may be required.

---

### 5. Add Monthly Risk Monitoring

Instead of reviewing the dashboard only as a static report, track monthly:

* Applications
* Funded amount
* Payment amount
* Bad-loan rate
* Charged-off amount

This would turn the dashboard into a repeatable portfolio-monitoring tool.

---

### 6. Add Drill-Through Analysis

A future version can allow users to select:

**Grade → Purpose → State → Loan Details**

This would make investigation of unusual segments much easier.

---

# 🎯 Real-World Analytics Approach

The main objective of this project was not simply to create charts.

The workflow follows a practical analytics process:

```text
Validate the data
      ↓
Understand the portfolio
      ↓
Ask business questions
      ↓
Measure risk
      ↓
Identify important segments
      ↓
Visualize findings
      ↓
Translate findings into actions
```

This demonstrates the complete role of a data analyst — from **raw data to business insight**.

---

# 📚 Skills Demonstrated

### SQL

* SELECT
* WHERE
* GROUP BY
* ORDER BY
* CASE
* Aggregate Functions
* Subqueries
* Date Functions
* Business KPI calculations

### Power BI

* Power Query
* Data transformation
* Data modeling
* DAX
* KPI cards
* Slicers
* Interactive charts
* Drill-through concepts
* Page navigation
* Dashboard design

---

# 👨‍💻 Author

## Sujal Mondal

**Data Analyst | SQL | Python | Power BI | Excel**

🔗 GitHub:
https://github.com/CodeWithSujal28

🔗 LinkedIn:
https://www.linkedin.com/in/sujal-mondal/

---

## ⭐ Project Highlight

> **SQL finds the patterns. Power BI makes them visible. Business analysis turns those patterns into decisions.**

If you find this project useful, consider ⭐ **starring the repository**.
