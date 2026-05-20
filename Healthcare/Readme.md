# Healthcare Business Intelligence -  Patient Clinical and Financial Analysis

A healthcare data management and analytics project built using Python, MySQL, SQLAlchemy, and Power BI.

This project automates the process of importing multiple healthcare CSV datasets into a MySQL database, followed by SQL-based healthcare analytics and dashboard creation in Power BI.

---

# Project Overview

The project focuses on:

- Automating CSV-to-MySQL data loading
- Cleaning and preprocessing healthcare datasets
- Performing SQL analytics on hospital operations
- Generating healthcare business insights
- Building interactive Power BI dashboards

The project uses multiple relational healthcare datasets including patient records, admissions, billing, diagnostics, prescriptions, diseases, and departments.

---

# Technologies Used

## Programming
- Python
- Pandas

## Database
- MySQL
- SQLAlchemy

## Visualization
- Power BI

---

# Dataset Tables

| Table Name | Description |
|---|---|
| patient | Patient information |
| doctor | Doctor details |
| department | Hospital departments |
| disease | Disease categories |
| admission | Patient admission records |
| billing | Billing summary |
| billing_detail | Detailed billing transactions |
| prescription | Prescription records |
| drug | Drug information |
| patient_diagnostic | Diagnostic test records |

---

# Python Workflow

The Python notebook performs:

- MySQL database connection
- Automatic CSV file detection
- Data cleaning
- Column name standardization
- NULL value handling
- Automated table creation in MySQL
- Bulk CSV import using SQLAlchemy

---

# SQL Analysis Performed

The SQL file contains analytical healthcare queries such as:

## Revenue Analysis
- Total hospital revenue
- Insurance-covered amount
- Patient payable amount

## Admission Analysis
- Emergency vs Elective admission split
- Frequent patient admissions
- Admission percentage analysis

## Disease Analysis
- Disease categories with highest admissions
- Diseases with highest billing amounts
- Diagnostic abnormality rates

## Prescription Analysis
- Most prescribed drug categories
- Drug trends by admission type

## Department Analysis
- Average patient stay duration
- Departments with longest stays

## Billing Analysis
- Pending vs paid bill analysis
- Payment mode trends

---

# Power BI Dashboard

The project also includes a Power BI dashboard for healthcare analytics and reporting.

Dashboard includes:
- Revenue insights
- Admission trends
- Department analysis
- Billing analysis
- Disease distribution

File:
```bash
healthcare.pbix
```

---

# Project Structure

```bash
├── healthcare project.ipynb
├── healthcare.sql
├── healthcare.pbix

└── README.md
```

---

# Key Features

- Automated healthcare data import pipeline
- Relational database creation
- SQL-based business analytics
- Window function queries
- CTE-based analysis
- Power BI reporting

---

# How to Run

## 1. Install Required Libraries

```bash
pip install pandas sqlalchemy pymysql
```

---

## 2. Create MySQL Database

Run:

```sql
CREATE DATABASE healthcare;
```

---

## 3. Update MySQL Credentials

Inside `healthcare project.ipynb`, update:

```python
username = 'root'
password = 'your_password'
host = 'localhost'
port = 3306
database = 'healthcare'
```

---

## 4. Run Jupyter Notebook

```bash
jupyter notebook
```

Open:

```bash
healthcare project.ipynb
```

---

## 5. Run SQL Queries

Execute:

```sql
healthcare.sql
```

in MySQL Workbench.

---

## 6. Open Power BI Dashboard

Open:

```bash
healthcare.pbix
```

using Microsoft Power BI Desktop.

---


# Author

## Yashasvi Dewangan
