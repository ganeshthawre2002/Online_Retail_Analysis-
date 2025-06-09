-- online retail sales anlysis project ------




CREATE TABLE online_retail (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INTEGER,
    InvoiceDate TIMESTAMP,
    UnitPrice NUMERIC(10, 2),
    CustomerID VARCHAR(20),
    Country VARCHAR(50),
    TotalPrice NUMERIC(12, 2));









SELECT * FROM online_retail LIMIT 5;


---- Column Summaries 


SELECT COUNT(*) as total_records,
     COUNT(DISTINCT InvoiceNo) as unique_invoices,
	 COUNT(DISTINCT CustomerID) as unique_customers,
	 COUNT(DISTINCT country) as unique_countires 
	 FROM online_retail;  ----  there is total records are 3,97,924 
	                           --- unique invoices are 18,536
							   --- unique customers are 4,339
							   --- unique contries are 37


-- top 10 selling products 

SELECT * FROM online_retail;


SELECT Description,
SUM(Quantity) as total_quantity_sold
FROM online_retail 
GROUP BY Description 
ORDER BY total_quantity_sold
LIMIT 10;



---- top 5 countires by revenue 


SELECT * FROM online_retail;


SELECT Country,
ROUND(SUM (Quantity * UnitPrice), 2) as total_revenue
FROM online_retail
GROUP BY Country 
ORDER BY total_revenue DESC 
LIMIT 5;  


----- monthly revenue trend 

SELECT * FROM online_retail;

SELECT DATE_TRUNC('month', InvoiceDate) as month,
ROUND(SUM(Quantity * UnitPrice), 2) as monthly_revenue 
FROM online_retail
GROUP BY month
ORDER BY month;


---- customer lifetime value (top 10 customers )


SELECT * FROM online_retail;


SELECT CustomerID,
ROUND(SUM(Quantity * UnitPrice), 2) as lifetime_value
FROM online_retail
GROUP BY CustomerID
ORDER BY lifetime_value DESC
LIMIT 10;







---- RFM Table for segmentation 


SELECT * FROM online_retail;


SELECT MAX(invoicedate) FROM online_retail;   -- i am cheking for the latest invoice date 
                                              --- latest invoice date is 2011-12-09 12:50:00






CREATE TABLE rfm as SELECT CustomerID,
             DATE_PART('day', MAX(InvoiceDate)) as last_purcahsed_day,  --- recency according to difference between today and the most recent invoice
			 DATE_PART('day', CURRENT_DATE - MAX(InvoiceDate)) as recency,

			 COUNT(DISTINCT InvoiceNo) as frequency, ---- frequency according to number of distinct invoices

			 ROUND(SUM(totalprice), 2) as monetary ---- monetary according to total spend

FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID;  



SELECT * FROM rfm;





---- now creating RFM segment view 

CREATE VIEW rfm_segments AS
WITH rfm_scored AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency) AS f_score,
        NTILE(5) OVER (ORDER BY monetary) AS m_score
    FROM rfm
),
rfm_labeled AS (
    SELECT *,
        r_score::TEXT || f_score::TEXT || m_score::TEXT AS rfm_score
    FROM rfm_scored
)
SELECT *,
    CASE
        WHEN r_score = 5 AND f_score >= 4 AND m_score >= 4 THEN 'Champion'
        WHEN r_score >= 4 AND f_score >= 3 THEN 'Loyal Customer'
        WHEN r_score >= 3 AND f_score <= 2 THEN 'Potential Loyalist'
        WHEN r_score <= 2 AND f_score <= 2 THEN 'At Risk'
        ELSE 'Others'
    END AS segment
FROM rfm_labeled;


SELECT * FROM rfm_segments;


--- segment distribution report 


--- Q1 how many customers fall into each segment 

SELECT * FROM online_retail;


SELECT * FROM rfm_segments;

SELECT segment, COUNT (*) as customer_count 
FROM rfm_segments 
GROUP BY segment 
ORDER BY customer_count DESC;


--- revenue by segment 

--- Q1 which segments are generating the most revenue 
SELECT * FROM online_retail;

SELECT * FROM rfm_segments;

SELECT segment,
ROUND(SUM(monetary), 2) as total_revenue,
ROUND(AVG(monetary), 2) as avg_revenue_per_customer 
FROM rfm_segments
GROUP BY segment 
ORDER BY total_revenue DESC;


--- best customers 
--- Q1 who are your top revenue-generating customers 

SELECT CustomerID, rfm_score, segment, ROUND(monetary, 2) as total_spents
FROM rfm_segments
ORDER BY monetary DESC 
LIMIT 10;


---- recency vs frequency table 


-- Q1 how are customers distributed based on recency and frequency scores 

SELECT * FROM online_retail;
SELECT * FROM rfm_segments;


SELECT r_score, f_score, COUNT(*) as customer_count 
FROM rfm_segments
GROUP BY r_score, f_score 
ORDER BY r_score, f_score;


--- actionable segment table 
--Q1 target segments for marketing 

SELECT * FROM rfm_segments;

SELECT segment, 
COUNT(*) as customer_count,
ROUND(AVG(monetary), 2) as avg_spent,
ROUND(AVG(recency)::numeric, 1) as avg_recency
FROM rfm_segments
WHERE segment IN ('Loyal Customers', 'At Risk', 'Potential Loyalist', 'Champions')
GROUP BY segment 
ORDER BY avg_spent DESC; 


--- creting view for actionable segment 

CREATE VIEW rfm_segment_summary as 
SELECT segment, 
COUNT(*) as customer_count,
ROUND(AVG(monetary), 2) as avg_spent,
ROUND(AVG(recency)::numeric, 1) as avg_recency
FROM rfm_segments
WHERE segment IN ('Loyal Customers', 'At Risk', 'Potential Loyalist', 'Champions')
GROUP BY segment; 

SELECT * FROM rfm_segment_summary;

SELECT * FROM rfm;

SELECT * FROM rfm_segments;

SELECT * FROM online_retail;
