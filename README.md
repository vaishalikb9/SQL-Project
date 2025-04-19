# SQL Project: Online Retail Store Analysis

## 📌 Project Description

This project involves analyzing the sales and customer data of an online retail store using SQL. The goal is to extract meaningful insights such as top-selling products, customer purchase behavior, and monthly revenue trends.

## 🛠 Tools & Technologies

- SQL (MySQL / PostgreSQL / SQLite)
- DB Browser / MySQL Workbench / PgAdmin
- Excel (for CSV import/export)

## 📂 Dataset
created the dataset 
- `customers.csv`
- `orders.csv`
- `products.csv`

## 🚀 How to Run

1. Import the CSV files into your SQL database.
2. Use the provided `.sql` file or queries to explore the data.
3. Run the queries in your SQL client.

## 🔍 Sample Queries

```sql
-- Top 5 Selling Products
SELECT product_name, SUM(quantity) AS total_sold
FROM orders
GROUP BY product_name
ORDER BY total_sold DESC
LIMIT 5;

-- Monthly Revenue
SELECT MONTH(order_date) AS month, SUM(total_price) AS revenue
FROM orders
GROUP BY month
ORDER BY month;
