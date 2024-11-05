# LITA-class-project
## Project Title: Sales Performance Analysis for a Retail Store
---
[Project Overview](#project-overview)

Data Sources: The Data used for this project was sourced from the LITA Class given for capacity building and capstone

Tools Used: The tools used were Excel 365, Microsoft SQL Server and Power BI.

Data Cleaning and Preparations: The data was cleaned using power query in excel and power Bi to check for dulicate records and missing records.

[Data Analysis](#data-analysis)

### Project Overview
---
This is the project carried out as part of LITA Capstone project on data analysis and also part of my first learning in data analytics.

### Data Sources
---
The primary source of data is data salesdata$ and CustomerData$ and this is an open source data that can be freely downloaded from an open source.

### Tools used
---
- Microsoft Excel [Download here](http://www.microsoft.com)
  1. For Data Cleaning
  2. For Analysis
  3. For Data Visualisation

- SQL - Structured Query language for qyerying of database
- GIT for portfolio building
- Power BI for visualisation

### Data Cleaning and preparations
---
Initial pahase of the data cleaning and preapartion we did the following
1. Data laoding and inspection
2. Handling missing variable
3. data cleaning and formatting

### Exploratory Analysis
---
EDA 
- What is the overall sales trend by oder date
- which products are top sellers
- What are the products on peak sales


### Data Visualisation
Screenshot of the Power BI Visualisation
![image](https://github.com/user-attachments/assets/426d786f-e1dd-4fa7-8e99-598a3ed9b28a)

Screenshot of the Excel Visualisation
![image](https://github.com/user-attachments/assets/96299c6a-8b52-43fa-82ec-82abc58dd838)


### Data Analysis
This is where we included basic lines of codes or DAX expressions

```SQL
-- Task 1: retrieve the total number of customers from each region
SELECT Region, COUNT(*) AS TotalCustomers
FROM CustomerData$
GROUP BY Region;
```Power BI - DAX functions used
Measures and Calculated tables using SUM, COUNT, DISTINCTCOUNT.

### Files Used for Analysis in Excel, SQL and Power BI
[Uploading CUSTOMERSDATA ANALYSIS USING SQL - LITA_CLASS PROJECT.sql…]()

[Uploading SALES DATA ANALYSIS USING SQL - LITA_CLASS PROJECT.sql…]()


[LITA Capstone Dataset - Excel Results.xlsx](https://github.com/user-attachments/files/17639311/LITA.Capstone.Dataset.-.Excel.Results.xlsx)


