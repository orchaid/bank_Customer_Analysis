--==================================
-- DDL
--==================================

-- creating the table for the data
CREATE TABLE public.bank_customers (
    row_number INT PRIMARY KEY,
    customer_id UUID UNIQUE NOT NULL,
    surname VARCHAR(50),
    first_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10),
    marital_status VARCHAR(20),
    number_of_dependents INT,
    occupation VARCHAR(100),
    income DECIMAL(15,2),
    education_level VARCHAR(50),
    address VARCHAR(100),
    contact_information VARCHAR(100),
    customer_tenure INT,
    customer_segment VARCHAR(50),
    Preferred_communication_channel VARCHAR(50),
    credit_score INT,
    credit_history_length INT,
    outstanding_loans DECIMAL(15,2),
    churn_flag BOOLEAN,
    churn_reason TEXT,
    churn_date DATE,
    balance DECIMAL(15,2),
    num_of_products INT,
    num_of_complaints INT
);
-----------------------------------------------------------------------------------------------------------------
--====================================================
-- Exploratory Data Analysis (EDA)
--====================================================

-- risky customers with high outstanding loans and low credit scores
SELECT 
    customer_id,
    outstanding_loans,
    credit_score
FROM
    bank_customers
WHERE credit_score < 500 AND outstanding_loans > (SELECT AVG(outstanding_loans) FROM bank_customers);




-- Do long-tenure customers complain less than new ones?
-- no all complain roughly the same (fictious data)
SELECT
    customer_tenure,
    SUM(num_of_complaints)
FROM
    bank_customers
GROUP BY customer_tenure;


-- Do customers with multiple products have a lower churn rate?
-- no
SELECT 
    num_of_products,
    COUNT(churn_flag) churn_rate
FROM
    bank_customers
GROUP BY num_of_products;


-- Number of complaints causing churn
SELECT
    churn_reason,
    SUM(num_of_complaints) Nr_of_complaints
FROM
    bank_customers
WHERE churn_flag = TRUE
GROUP BY churn_reason
ORDER BY Nr_of_complaints DESC;


-- Which complaints correlate with the most churn?
SELECT
    churn_reason,
    COUNT(num_of_complaints) churned_customers
FROM
    bank_customers
WHERE churn_flag = TRUE
GROUP BY churn_reason
ORDER BY churned_customers DESC; -- top reason of churn was service issues


-- customer count based on the number of products
SELECT
    num_of_products, COUNT(*) customer_count
FROM
    bank_customers
GROUP BY num_of_products;


-- Customer Segmentation & Demographics Analysis (average income and balance per customer segment)
SELECT 
    customer_segment, 
    AVG(income) AS Avg_Income, 
    AVG(balance) AS Avg_Balance, 
    COUNT(*) AS Total_Customers
FROM bank_customers
GROUP BY customer_segment
ORDER BY Avg_Balance DESC;

-----------------------------------------------------------------------------------------------------------------

-- does older age decrease the curn rate compared to young ages?
-- no 
SELECT
    EXTRACT(year FROM AGE(CURRENT_DATE, date_of_birth)) AS age,
    COUNT(churn_flag)
FROM
    bank_customers
WHERE churn_flag = TRUE
GROUP BY EXTRACT(year FROM AGE(CURRENT_DATE, date_of_birth)) 
ORDER BY age DESC;


-- complaint and tenure
SELECT
    customer_tenure,
    SUM(num_of_complaints) AS nr_of_complaints,
    COUNT(*) AS churn_count
FROM
    bank_customers
WHERE
    churn_flag = TRUE
GROUP BY
    customer_tenure;


-- Is there a link between credit score and customer tenure?
-- no
SELECT
    customer_tenure,
    ROUND(AVG(credit_score))
FROM
    bank_customers
GROUP BY customer_tenure


--====================================================
-- Churn Prediction & Retention Analysis
--====================================================

-- Do customers with lower credit scores churn more often?
-- yes, lower credit score correlate with the churned amount
SELECT
    COUNT(churn_flag) churned_customers,
    credit_score
FROM
    bank_customers
WHERE churn_flag = TRUE AND credit_score < 500
GROUP BY credit_score
ORDER BY credit_score;


-- Which preferred communication channels have the lowest churn rates?
-- both are quite close with phone having slightly less churn rate
SELECT
    COUNT(churn_flag) churned_customers,
    preferred_communication_channel
FROM
    bank_customers
WHERE churn_flag = TRUE
GROUP BY preferred_communication_channel;


-- What are the top reasons customers leave the bank?
SELECT
    churn_reason,
    COUNT(*) churned_customers
FROM
    bank_customers
WHERE churn_flag = TRUE
GROUP BY churn_reason
ORDER BY churned_customers DESC;


-- Which customer groups are more likely to stay loyal to the bank?
SELECT 
    customer_segment,
    COUNT(*) loyal_customers
FROM 
    bank_customers
WHERE churn_flag = FALSE
GROUP BY customer_segment
ORDER BY loyal_customers DESC;




--------------- View ---------------

-- I will export this and use it with tableau
SELECT 
    customer_id,
    CONCAT(first_name,' ' ,surname) AS full_name,
    EXTRACT(year FROM AGE(CURRENT_DATE, date_of_birth)) AS age,
    gender,
    education_level,
    customer_segment,
    preferred_communication_channel,
    income,
    customer_tenure,
    credit_score,
    outstanding_loans,
    churn_flag,
    (SELECT churn_flag FROM bank_customers WHERE churn_flag= TRUE) / AS churn_rate
    churn_reason,
    balance,
    num_of_products,
    num_of_complaints
FROM
    bank_customers


-- the dashboard can consist of three pages: customer churn, risk analysis, customer retention info & prediction