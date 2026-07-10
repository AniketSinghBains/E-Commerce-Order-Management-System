# E-Commerce Order Management System

## 1. Introduction

The E-Commerce Order Management System is a SQL-based database project developed to manage customers, products, orders, and order-item information.

The system allows an e-commerce business to store customer details, product information, customer orders, and multiple products included in each order. SQL joins are used to combine data from different tables, while indexes are created to improve data retrieval performance.

The project also generates sales, product, customer, inventory, and order reports.

## 2. Project Name

E-Commerce Order Management System

## 3. Technology Used

* MySQL
* SQL
* Joins
* Indexing
* Views
* Aggregate Functions
* Group By
* Order By
* Subqueries

## 4. Source of Project

GitHub Open Source and self-created SQL database structure.

## 5. Project Objective

The main objective of this project is to design and implement a relational database system for managing e-commerce orders.

The project helps in:

* Storing customer information
* Managing product details
* Recording customer orders
* Storing multiple products in an order
* Generating order summaries
* Producing sales reports
* Improving query performance using indexing

## 6. Problem Statement

An e-commerce company needs a structured database to manage its customers, products, and orders.

Without a relational database, the company may face problems such as duplicate records, incorrect order information, slow data retrieval, and difficulty in generating sales reports.

This project solves these problems using SQL tables, relationships, joins, indexes, and views.

## 7. Database Tables

The project contains four main tables.

### 7.1 Customers Table

The customers table stores customer-related information.

Main columns:

* customer_id
* customer_name
* email
* phone
* city

The customer_id column is the primary key.

### 7.2 Products Table

The products table stores product information.

Main columns:

* product_id
* product_name
* category
* price
* stock_quantity

The product_id column is the primary key.

### 7.3 Orders Table

The orders table stores information about customer orders.

Main columns:

* order_id
* customer_id
* order_date
* order_status
* total_amount

The customer_id column is a foreign key that connects the orders table with the customers table.

### 7.4 Order Items Table

The order_items table stores the individual products included in an order.

Main columns:

* order_item_id
* order_id
* product_id
* quantity
* unit_price

The order_id and product_id columns are foreign keys.

## 8. Database Relationships

The relationship between customers and orders is one-to-many.

One customer can place multiple orders, but each order belongs to one customer.

The relationship between orders and order_items is one-to-many.

One order can contain multiple order items.

The relationship between products and order_items is one-to-many.

One product can appear in multiple orders.

The order_items table acts as a connecting table between orders and products.

## 9. Project Tasks

### Task 1: Create Product, Customer and Order Tables

The first task was to create the database and tables for customers, products, orders, and order items.

Primary keys, foreign keys, unique constraints, and not-null constraints were used to maintain data accuracy.

### Task 2: Store Order and Order-Item Data

Sample customer, product, order, and order-item records were inserted into the database.

The order_items table was used to store multiple products associated with one order.

### Task 3: Build Indexed Retrieval Queries

Indexes were created on frequently searched and joined columns such as:

* Customer email
* Product name
* Customer ID
* Order date
* Order status
* Order ID
* Product ID

These indexes help improve data retrieval speed.

### Task 4: Join Tables for Order Summaries

SQL joins were used to combine customer, order, product, and order-item information.

The joins generated complete order summaries containing:

* Order ID
* Customer name
* Order date
* Order status
* Product name
* Product category
* Quantity
* Unit price
* Item total

### Task 5: Generate Sales and Order Reports

Different reports were created using aggregate functions and joins.

The reports included:

* Total sales revenue
* Total number of orders
* Order status report
* Customer-wise spending
* Product-wise sales
* Category-wise sales
* Monthly sales
* Average order value
* Highest-value order
* Low-stock products

## 10. SQL Joins Used

### Inner Join

Inner joins were used to display records that had matching values in multiple tables.

For example, customer and order information was combined using customer_id.

### Left Join

Left joins were used to display all records from one table, including records that did not have matching data in another table.

For example, customers with no orders were identified using a left join.

## 11. Indexing

Indexing was used to improve query performance.

Indexes were created on columns frequently used in:

* WHERE conditions
* JOIN conditions
* Date searches
* Status searches
* Customer searches
* Product searches

A composite index was also created on customer_id and order_date to improve customer order searches within a date range.

## 12. Views

A view named order_summary_view was created.

The view combines customer, order, product, and order-item data into one reusable virtual table.

The view reduces the need to write the same complex join query repeatedly.

## 13. Reports Generated

The following reports were generated:

1. Total sales report
2. Total order report
3. Order status report
4. Customer spending report
5. Product sales report
6. Category sales report
7. Monthly sales report
8. Average order value report
9. Highest-value order report
10. Low-stock product report
11. Pending order report
12. Delivered order report

## 14. Project Outcomes

After completing this project, the following outcomes were achieved:

1. Designed an e-commerce database schema.
2. Created relational tables using primary and foreign keys.
3. Stored customer, product, order, and order-item data.
4. Used joins to combine data from multiple tables.
5. Generated sales and order reports.
6. Used aggregate functions for data analysis.
7. Applied indexing for faster retrieval.
8. Created a reusable SQL view.
9. Managed customer orders efficiently.
10. Developed a basic order management database solution.

## 15. Advantages of the System

* Reduces data duplication
* Maintains accurate customer and order records
* Supports multiple products in one order
* Generates useful sales reports
* Improves query performance using indexes
* Provides structured and organized data
* Makes order tracking easier

## 16. Limitations

* The project does not include a graphical user interface.
* Payment information is not included.
* Shipment tracking is not included.
* The dataset is small.
* Real-time inventory updates are not implemented.

## 17. Future Scope

The project can be extended by adding:

* Payment table
* Shipment table
* Product category table
* Supplier table
* Discount management
* Return and refund management
* Real-time inventory management
* Stored procedures
* Triggers
* User interface
* Dashboard integration

## 18. Conclusion

The E-Commerce Order Management System successfully demonstrates how SQL can be used to manage customers, products, orders, and sales data.

The project uses relational database concepts, joins, indexing, aggregate functions, and views to create an efficient order management solution.

It provides a simple and structured way to store e-commerce data and generate useful business reports.
