-- CREDIT RISK ANALYSIS

-- 1. OVERALL CUSTOMER SUMMARY
-- Calculate total customers, distressed customers, non-distressed customers and 
-- overall distress rate.

SELECT
COUNT(*) AS total_customers,
SUM(CASE WHEN SeriousDlqin2yrs = 1 THEN 1 ELSE 0 END) AS distressed_customers,
SUM(CASE WHEN SeriousDlqin2yrs = 0 THEN 1 ELSE 0 END) AS non_distressed_customers,
AVG(SeriousDlqin2yrs) * 100 AS distress_rate
FROM customers;

-- 2. DISTRESS RATE BY AGE GROUP
-- Group customers into age categories and compare their respective distress rates.

SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age < 40 THEN '30-39'
        WHEN age < 50 THEN '40-49'
        WHEN age < 60 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    AVG(SeriousDlqin2yrs) * 100 AS distress_rate
FROM customers
GROUP BY age_group
ORDER BY distress_rate DESC;

-- 3. DISTRESS RATE BY CREDIT UTILISATION
-- Categorise customers based on revolving credit utilisation and compare distress 
-- rates.

SELECT
CASE
WHEN RevolvingUtilizationOfUnsecuredLines <= 0.3 THEN 'Low'
WHEN RevolvingUtilizationOfUnsecuredLines <= 0.6 THEN 'Moderate'
WHEN RevolvingUtilizationOfUnsecuredLines <= 0.9 THEN 'High'
ELSE 'Very High'
END AS credit_utilization_band,
COUNT(*) AS total_customers,
AVG(SeriousDlqin2yrs) * 100 AS distress_rate
FROM customers
GROUP BY credit_utilization_band
ORDER BY distress_rate DESC;

-- 4. DISTRESS RATE BY PREVIOUS LATE PAYMENTS
-- Compare customers with no previous 90-day late payments against those with at least one.


SELECT
CASE
WHEN NumberOfTimes90DaysLate = 0 THEN 'No Previous 90 day late payments'
ELSE 'At least one 90 day late payment'
END AS payment_history,
COUNT(*) AS total_customers,
AVG(SeriousDlqin2yrs) * 100 AS distress_rate
FROM customers
GROUP BY payment_history
ORDER BY distress_rate DESC;

-- 5. DISTRESS RATE BY INCOME GROUP
-- Categorise customers by monthly income and investigate differences in distress rates.

SELECT
CASE
WHEN MonthlyIncome < 3000 THEN 'Under $3000'
WHEN MonthlyIncome < 5000 THEN '$3000 - $4999'
WHEN MonthlyIncome < 8000 THEN '$5000 - $7999'
ELSE 'Over $8000'
END AS income_band,
COUNT(*) AS total_customers,
AVG(SeriousDlqin2yrs) * 100 AS distress_rate
FROM customers
GROUP BY income_band
ORDER BY distress_rate DESC;

-- 6. COMBINED RISK SEGMENTATION
-- Examine the combined relationship between credit utilisation and previous late payment 
-- history. Identify customer segments with the highest distress rates.

SELECT
    CASE
        WHEN RevolvingUtilizationOfUnsecuredLines <= 0.3 THEN 'Low'
        WHEN RevolvingUtilizationOfUnsecuredLines <= 0.6 THEN 'Moderate'
        WHEN RevolvingUtilizationOfUnsecuredLines <= 0.9 THEN 'High'
        ELSE 'Very High'
    END AS utilisation_band,

    CASE
        WHEN NumberOfTimes90DaysLate > 0 THEN 'Previous late payment'
        ELSE 'No previous late payment'
    END AS payment_history,

    COUNT(*) AS total_customers,
    AVG(SeriousDlqin2yrs) * 100 AS distress_rate

FROM customers
GROUP BY utilisation_band, payment_history
ORDER BY distress_rate DESC;
