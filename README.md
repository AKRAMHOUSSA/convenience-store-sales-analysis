# Convenience Store Sales Analysis (SQL + Excel)

SQL-driven sales and customer analysis of a 1,000-transaction convenience store dataset, with KPI extraction and an interactive Excel dashboard.

## Overview 
This project analyzes sales data from a fictional convenience store chain operating across two branches (Branch A: New York & Chicago, Branch B: Los Angeles). The goal was to extract key performance indicators around sales revenue, customer behavior, and product performance, then present findings through a written report and an interactive dashboard.

## Dataset used
- <a href="https://github.com/AKRAMHOUSSA/convenience-store-sales-analysis/blob/main/sales.csv">Dataset_sales

## Business Questions
1. Which branch generates the most sales?
2. Who are the best customers — Members or Normal?
3. Which gender drives more purchases?
4. Which product performs best within each gender?
5. Which product categories drive the most (and least) sales?
6. Which category commands the highest unit price?
7. Which gender earns more reward points?

## Tools Used
SQL — data cleaning, validation, and KPI extraction (GROUP BY, window functions for ranking, aggregate queries)
Excel — PivotTables, PivotCharts, and slicers for an interactive dashboard

## Process
1. Data validation — checked for nulls, blanks, and duplicates across all columns; verified Total_price calculations against Unit_price × Quantity × 1.07.
2. Data cleaning — identified and corrected inconsistent Product_category labels by aligning each product to its most frequent (correct) category. Unit_price variation was confirmed to be legitimate transaction-level data and left unmodified.
3. KPI analysis — wrote SQL queries across three themes: Sales & Revenue, Customer Behavior, and Product Performance.
4. Dashboard build — created PivotTables from raw data, added cross-filtering slicers (Branch, City, Customer Type, Gender), and built PivotCharts for an interactive Excel dashboard.
5. Reporting — summarized findings and business recommendations in a written report.

## Sql_queries_KPIs

## Dashboard
<img width="1446" height="771" alt="Screenshot 2026-08-16 234143" src="https://github.com/user-attachments/assets/82ba7b2b-ed39-4b49-960b-a801f1cde678" />
<img width="1161" height="764" alt="Screenshot 2026-08-16 234222" src="https://github.com/user-attachments/assets/a6fd305a-cf2d-4c91-928e-c2b31cd8c909" />
Interactive dashboard with slicers for Branch, City, Customer Type, and Gender — filtering all charts simultaneously.

## Key Findings
- Price vs. volume: Notebook has the highest average unit price, but Shampoo generates the highest total revenue ($27,041) due to stronger sales volume — a reminder that price alone doesn't determine performance.
- Apple consistently underperforms across every cut of the data — lowest revenue, lowest quantity, and lowest reward points, for both genders and both membership types.
- Male customers drive more total revenue than female customers, from both higher transaction volume (528 vs. 472) and higher average spend ($121.82 vs. $114.97).
- Branch structure matters: Branch A (New York + Chicago combined) naturally outperforms Branch B (Los Angeles) in total revenue — a structural factor, not a performance signal.
- Regional product preferences differ: Shampoo leads by quantity in both New York and Chicago, while Orange Juice leads in Los Angeles.



