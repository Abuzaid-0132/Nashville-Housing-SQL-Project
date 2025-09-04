# 🏡 Nashville Housing Data Cleaning (SQL Project)

## 📖 Introduction
This project demonstrates **end-to-end data cleaning in SQL Server** using a real-world style dataset: **Nashville Housing**.  
The dataset initially contained multiple data quality issues such as missing property addresses, inconsistent categorical values, concatenated address fields, duplicate records, and unnecessary columns.  

The goal of this project was to transform the raw dataset into a **clean, structured, and analysis-ready table**.  
Through this process, I applied advanced SQL techniques, best practices in data cleaning, and step-by-step transformations.

---

## ⚙️ Tools & Technologies
- **SQL Server Management Studio (SSMS)**  
- **T-SQL (Transact-SQL)**  
- Dataset: *Nashville Housing Records*  

---

## 🛠️ Data Cleaning Workflow

The following steps outline the entire cleaning process performed on the `Nashville_Housing` table:

---

### 1. Explore Raw Data
First, I inspected the dataset to understand its structure and identify potential issues.
```sql
SELECT *
FROM Nashville_Housing;
```


## 🚀 Key Learnings
Using self-joins and ISNULL to populate missing values.
Applying string functions like SUBSTRING, CHARINDEX, PARSENAME, and REPLACE to transform textual data.
Leveraging window functions (ROW_NUMBER()) and CTEs to efficiently identify and delete duplicates.
Making decisions on column normalization and removing irrelevant fields for analysis readiness.
This project solidified my ability to handle real-world data cleaning challenges in SQL Server.

## 📂 Use Cases
The cleaned dataset can now support:
Real estate market trend analysis.
Housing price prediction models.
Property tax record validation.
Training datasets for data analytics and machine learning.
