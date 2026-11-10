Credit Risk Analysis

Project Overview:

This project investigates customer credit risk using Python, SQL and Power BI. Using the Kaggle "Give Me Some Credit" dataset, I analysed customer financial characteristics and repayment behaviour to identify patterns associated with serious loan delinquency.
The aim was to demonstrate how data analysis can support credit risk assessment and help identify higher risk customer segments.

Tools & Technologies:

Python: Pandas, NumPy and Matplotlib
SQL: SQLite
Visualisation: Microsoft Power BI
Environment: Jupyter Notebook

Project Workflow:

1. Data Cleaning & Preparation — Python
Imported and explored the original dataset.
Investigated missing values and data quality.
Handled missing monthly income and number of dependants using median imputation.
Created additional features, including credit utilisation bands and previous late payment indicators.
Exported the cleaned dataset for further analysis.

2. Data Analysis — Python & SQL
Analysed customer delinquency patterns across several variables:
Age groups
Monthly income
Credit utilisation
Previous 90 day late payments
Combined credit utilisation and payment history segments
SQL queries were written using SQLite to aggregate customer data and calculate delinquency rates across different groups.

3. Dashboard Development — Power BI
Developed a two page interactive dashboard:
Credit Risk Overview: Customer statistics and delinquency rates by age, income and credit utilisation.
Risk Segmentation: Comparison of delinquency rates across credit utilisation and previous payment history.

Page 1 - Credit Risk Overview:

![Credit Risk Overview](PowerBI/Screenshots/Credit%20Risk%20Overview.png)

Page 2 - Risk Segmentation:

![Risk Segmentation](PowerBI/Screenshots/Risk%20Segmentation.png)

Key Findings

6.68% overall distress rate across the 150,000 customer records.
Customers with at least one previous 90 day late payment had a substantially higher observed delinquency rate.
Customers with both very high credit utilisation and previous late payments had a 48.67% distress rate.
Customers with low credit utilisation and no previous late payments had a 1.84% distress rate.
The analysis highlighted the importance of considering multiple indicators when assessing customer credit risk.

Dataset

The project uses the "Give Me Some Credit" dataset from Kaggle.
Access the dataset on Kaggle. The original dataset is not included in this repository. Download cs-training.csv from Kaggle before running the Python notebook.

Limitations

This project is exploratory and focuses on identifying links between customer characteristics and serious delinquency.
Further work could include predictive modelling, model validation and performance evaluation.

Skills Demonstrated

Data cleaning and preprocessing
Exploratory data analysis
SQL querying and aggregation
Data visualisation and dashboard development
Interpretation of credit risk indicators
