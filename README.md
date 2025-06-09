🛍️ End-to-End Online Retail Sales Analysis Project
Author: Ganesh Chandrashekhar Thaware
Role: Data Analyst
Tech Stack: SQL • Python • Excel • Power BI
Dataset Source: UCI Machine Learning Repository – Online Retail Dataset

![40 Best Online Shopping Sites on the Internet for 2025 ( Read The Blog )](https://github.com/user-attachments/assets/646ea1da-dff4-4bf0-8963-86017194fc1c)



🎯 Objective
To conduct a comprehensive customer and sales analysis for a UK-based online retail store using real-world transaction data. 
This project covers the entire data pipeline — from raw data preprocessing and database design to customer segmentation and dashboard storytelling
— simulating the full workflow of a business data analyst.
![Home Page](https://github.com/user-attachments/assets/9923a4f4-b9a6-4489-bbef-d589a43e2e2b)




🧾 Project Overview
Step	Description
🧹 Data Cleaning	Identified and removed null values, duplicates, and canceled transactions
🛢️ SQL Analysis	Created tables, wrote queries for KPIs and segmentation using PostgreSQL
📊 Python EDA	Analyzed customer behavior, monthly trends, top products, and RFM metrics
📈 Segmentation	Used RFM logic (Recency, Frequency, Monetary) for behavioral clustering
📊 Dashboarding	Designed a professional Power BI dashboard to visualize KPIs & segments

📁 Project Files
File Name	Description
Online Retail.xlsx	Raw dataset containing 541,909 records and 8 columns
cleaned_online_retail.csv	Cleaned dataset with 397,924 records (⚠️ Reduced by 26.6%)
Online_Retail_Sales_Analysis.ipynb	Python notebook for EDA and RFM scoring
online retail analysis.sql	SQL script to create tables, run queries, and generate RFM segments
RFM.csv	Final customer RFM table with Recency, Frequency, and Monetary metrics
rfm_segments.csv	Segmented customers labeled with tags like Champion, At Risk, etc.
actionable segment summary.csv	Target segment stats for marketing
online retail analysis dashboard.pbix	Final interactive Power BI dashboard

📊 Data Cleaning & Transformation (Python & Excel)
Task	Result
Removed rows with null CustomerID	135,080 rows removed
Removed canceled orders (InvoiceNo starting with 'C')	9288 rows removed
Removed duplicates	~500 rows removed
Final cleaned rows	397,924
Extracted fields	Created InvoiceMonth, InvoiceYear, and TotalPrice columns

✅ Result: Data ready for structured analysis, SQL import, and segmentation.

🔧 SQL Analysis Breakdown
📂 SQL Table: online_retail (created using online retail analysis.sql)

Key Metrics via SQL:
Total Records: 397,924

Unique Invoices: 18,536

Unique Customers: 4,339

Unique Countries: 37

Key SQL Queries:
Top 10 selling products by quantity

Top 5 countries by revenue (excluding UK in Power BI)

Monthly revenue trend

Customer Lifetime Value (Top 10)

RFM Metrics: Recency, Frequency, Monetary

Segment distribution & revenue per segment

Actionable customer segmentation (via SQL Views)

📈 RFM Segmentation Summary
Metric	Description
Recency	Days since last transaction
Frequency	Number of unique transactions (invoices)
Monetary	Total spend amount

RFM Segments:
🎯 Champions – High value, frequent, and recent buyers

💎 Loyal Customers – Repeat buyers with good monetary value

🧪 Potential Loyalists – Recently active, becoming loyal

⚠️ At Risk – Previously active, but not recent

❌ Lost – Long inactive, low value

SQL Views Created:
rfm table for metrics

rfm_segments view for scored + labeled customers

rfm_segment_summary for segment statistics

📊 Exploratory Data Analysis (Python)
Top-selling products

Revenue trend by month

Revenue contribution by country

Distribution of Recency, Frequency, Monetary

RFM customer scatter plots

Used libraries: pandas, numpy, matplotlib, seaborn, datetime.

📊 Power BI Dashboard Features
Monthly Revenue (2011) – Seasonal sales trend

Top 10 Countries by Revenue – Excluding UK (CMO requirement)

Top Products by Quantity & Revenue

Customer Segmentation Panel – Interactive slicers

Customer Segment KPIs – Based on RFM logic

Revenue Breakdown by Segment – Drill-down and filters enabled

✅ Built to support executive-level decision making.

📌 Key Business Insights
Insight	Actionable Suggestion
Nov–Dec peak sales	Run seasonal marketing campaigns
Top countries: Germany, France	Expand international logistics
Loyal & Champion customers dominate revenue	Launch loyalty programs
High quantity ≠ high revenue for many SKUs	Consider pricing & bundling strategies
40%+ customers are 'At Risk' or 'Lost'	Retarget with win-back offers

📈 Business Recommendations
Launch personalized campaigns for Loyal & Champion customers

Create a discount funnel for At Risk and Lost customers

Bundle low-revenue, high-volume products to improve margins

Increase advertising spend during peak months

Use RFM to automate segmentation in CRM or marketing tools

🚀 Project Impact
✔ Demonstrates end-to-end analytics workflow
✔ Covers both technical and business-oriented data work
✔ Builds a full data storytelling case for management decision support
✔ Integrates SQL + Python + BI into one pipeline

📬 Contact
💼 LinkedIn: www.linkedin.com/in/ganesh-thawre2002

📧 Email: ganeshthawre5@gmail.com

📁 Portfolio: GitHub

