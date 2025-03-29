

# **Customer Churn & Risk Analysis – Data-Driven Insights for Retention Strategies**  

## **Overview**  
I led a comprehensive **customer churn and risk analysis project** to uncover key drivers behind customer attrition and financial risk. By leveraging SQL for data exploration and Tableau for visualization, I provided actionable insights that can help improve **customer retention strategies, risk management, and overall business performance**.  



### **Key Business Goals:**  
- **Identify at-risk customers** based on credit scores, outstanding loans, and complaints. 
- **Analyze churn patterns** to understand why customers leave and how to mitigate risks.
- **Segment customers** based on tenure, income, and product usage to personalize engagement strategies.

- **Provide data-backed recommendations** to enhance customer experience and reduce churn.


## **1. Data Model & Structure**  

I worked with a dataset containing **key customer attributes**, including **demographics, financial history, complaints, and churn status**. The table below outlines the data fields used for analysis:  

### **`bank_customers` Table**  
| Column Name | Description |
|-------------|-------------|
| `customer_id` | Unique identifier for each customer |
| `first_name`, `surname` | Customer's name |
| `date_of_birth` | Birthdate for age calculation |
| `gender` | Gender classification |
| `marital_status` | Marital status of the customer |
| `number_of_dependents` | Number of dependents supported by the customer |
| `income` | Annual income level |
| `customer_tenure` | Number of years the customer has been with the bank |
| `customer_segment` | Categorization (Retail, SME, Corporate) |
| `preferred_communication_channel` | Preferred contact method (Phone, Email) |
| `credit_score` | Financial credit score (300-850) |
| `outstanding_loans` | Amount of unpaid loans |
| `churn_flag` | 1 if the customer has churned, 0 otherwise |
| `churn_reason` | Primary reason for customer churn |
| `balance` | Current account balance |
| `num_of_products` | Number of products/services used by the customer |
| `num_of_complaints` | Total complaints registered |

The bank data is from [here](https://www.kaggle.com/datasets/sandiledesmondmfazi/bank-customer-churn).

By structuring the data efficiently, I was able to **derive meaningful insights and guide business decisions**.



## **2. Key Insights from Data Analysis**  

- **Churn & Risk Insights That Impact Business Decisions:**  

- **High-risk customers identified**: Customers with **credit scores below 500** and **above-average outstanding loans** are more likely to churn.  

- **Customer tenure & complaints:** Long-term customers **file complaints at similar rates** as new customers, indicating that tenure alone does not guarantee satisfaction.  

- **Customers using multiple banking products tend to have lower churn rates**, meaning they are less likely to leave.

- **Top churn reasons: is Service-related issues**.


- **Credit score is a strong churn predictor:** Customers with **low credit scores (<500)** have significantly higher churn rates.  

- **Customer segmentation helps retention:** SME customers show **higher loyalty** compared to corporate and retail segments.  

- **Preferred communication channels & churn:** While **phone and email show similar churn rates**, phone communication leads to **slightly better retention**.  

**Business Recommendation:** The bank should focus on **improving service quality, addressing loan-related complaints, and providing tailored financial products** to reduce churn.  


## **3. Visualizing the Insights with Tableau**  

To communicate these findings effectively, I developed an **interactive Tableau dashboard** showcasing:  

**Churn rate trends by age, product, tenure and reason**  
**Top churn reasons & risk factors**  
**Customer segmentation loyalty and complaints**  

**[View Tableau Dashboard](https://public.tableau.com/app/profile/amr.alesseily/viz/ChurnRiskManagementSuite/ChurnAnalysis?publish=yes)**

## **4. How This Analysis Supports Bank Strategy**  

**Better Retention Strategies:** Helps the bank focus on **customer engagement & issue resolution**.  
**Risk Mitigation:** Identifies financially risky customers **before they leave or default**.  
**Stronger Customer Relationships:** Data-backed insights allow for **personalized service improvements**.  

## **5. Business Impact & Recommendations**  

### **Data-Driven Strategies for Improving Retention**  
**Proactive Risk Identification:** Use **credit score and outstanding loan thresholds** to flag high-risk customers early.  

**Service Quality Enhancement:** Address **customer service complaints** as they are the leading cause of churn.  

**Targeted Customer Engagement:**  
   - Offer **personalized financial products** to high-income, low-churn customers.  
   - Improve **loan offerings** for dissatisfied customers.  
   - Strengthen **phone-based customer engagement**, as it has a slightly lower churn rate.  


**Data-Backed Retention Policies:** Implement an **early intervention model** based on credit scores and churn indicators.  


## **6. Future Enhancements**  

**Implement Machine Learning models** for churn prediction.  
**Develop real-time risk alert systems** to flag high-risk customers.  
**Conduct sentiment analysis on complaints** to uncover deeper customer pain points.  



