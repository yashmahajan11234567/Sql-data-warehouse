# Sql-data-warehouse
# 🏗️ SQL Data Warehouse

This project demonstrates building a **SQL Data Warehouse from scratch** as part of my learning journey.

---

## 📌 Overview

The project focuses on designing a data warehouse using SQL, implementing ETL processes, and performing analytical queries for insights.

---

## 🎯 Objectives

- Understand Data Warehouse concepts  
- Learn Star Schema design  
- Implement ETL (Extract, Transform, Load)  
- Perform analytical queries using SQL  

---

## 🧱 Project Structure

Sql-data-warehouse/
│── datasets/ # Raw and processed data
│── docs/ # Notes and documentation
│── scripts/ # SQL scripts (schema, ETL, queries)
│── tests/ # Testing queries
│── README.md # Project documentation
│── LICENSE


---

## ⚙️ Technologies Used

- SQL  
- Data Warehousing Concepts  
- Git & GitHub  

---

## 🏛️ Architecture

- Fact Tables → Store measurable data  
- Dimension Tables → Store descriptive data  
- Schema Used → Star Schema  

---

## 🔄 ETL Process

1. Extract data from datasets  
2. Transform data (cleaning & formatting)  
3. Load data into warehouse tables  

---

## 📊 Sample Query

```sql
SELECT category, SUM(sales) AS total_sales
FROM fact_sales
GROUP BY category;
