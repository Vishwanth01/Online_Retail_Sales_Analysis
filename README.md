# 🛒 Online Retail Sales Analysis Database

## 📖 Project Overview
This project demonstrates the design and analysis of an online retail database using SQL. It stores customer, product, order, and order item information and generates valuable business insights through SQL queries.

## 🎯 Objectives
- 🏗️ Create a relational database for an online store
- 👥 Store customer information
- 📦 Manage product details
- 🛍️ Track customer orders
- 📊 Analyze sales performance using SQL

## 🗄️ Database Schema

### 👤 Customers
- customer_id (Primary Key)
- name
- city

### 📦 Products
- product_id (Primary Key)
- name
- category
- price

### 🛒 Orders
- order_id (Primary Key)
- customer_id (Foreign Key)
- order_date

### 📋 Order_Items
- order_id (Foreign Key)
- product_id (Foreign Key)
- quantity

## ✨ Features
- 🏆 Top-Selling Products Analysis
- 💰 Most Valuable Customers Identification
- 📅 Monthly Revenue Calculation
- 📈 Category-Wise Sales Analysis
- 👥 Inactive Customers Detection

## 🛠️ SQL Concepts Used
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY
- INSERT INTO
- INNER JOIN
- LEFT JOIN
- GROUP BY
- ORDER BY
- Aggregate Functions (SUM)

## 📊 Business Insights Generated

### 🏆 Top-Selling Products
Identify products with the highest sales volume.

### 💰 Most Valuable Customers
Find customers who contribute the most revenue.

### 📅 Monthly Revenue
Track revenue trends month by month.

### 📈 Category-Wise Sales
Analyze which product categories perform best.

### 👥 Inactive Customers
Detect customers who have never placed an order.

## 🚀 Expected Outcome
This project helps businesses understand customer behavior, monitor product performance, track revenue growth, and make data-driven decisions using SQL analytics.

## 👨‍💻 Author
**Sai Vishwanth**
