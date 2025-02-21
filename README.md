# Brainwave_Matrix_Internn
BookStoreDB - Online Bookstore Management System
Overview
BookStoreDB is a database project for an online bookstore system. This system stores information about clients (customers), items (books and electronics), purchases, purchase details, and transactions. It handles orders, payments, stock management, and basic queries to monitor the store's operations.

Features
Client Management:

Store information about clients (name, email, phone, address, etc.).
Clients can make purchases and track their orders.
Product Management:

Maintain a catalog of items such as books and electronics.
Store product details like price, description, stock quantity, and category.
Order Management:

Manage customer orders (purchases) and their details.
Track the status of each purchase (e.g., Processing, Shipped, Delivered).
Payment Management:

Record transaction details for each purchase (payment status, amount, and method).
Track the payment process for each order.
Stock Management:

Automatically update product stock when an item is purchased.
Querying:

View client purchase history, item sales, payment status, and more.
Tables Overview
Clients: Stores client information.

Fields: client_id, first_name, last_name, email, phone, address, city, country, registration_date
Items: Stores details about products (books, electronics, etc.).

Fields: item_id, name, description, price, stock_quantity, category, added_date
Purchases: Stores orders placed by clients.

Fields: purchase_id, client_id, purchase_date, purchase_status, total_amount, shipping_address
Purchase_Items: Stores information about items within each order.

Fields: purchase_item_id, purchase_id, item_id, quantity, unit_price
Transactions: Stores payment details for each order.

Fields: transaction_id, purchase_id, payment_method, payment_date, payment_amount, payment_status

Database Schema
plaintext
+---------------------+
|     Clients         |
+---------------------+
| client_id (PK)      |
| first_name          |
| last_name           |
| email               |
| phone               |
| address             |
| city                |
| country             |
| registration_date   |
+---------------------+

+---------------------+
|     Items           |
+---------------------+
| item_id (PK)        |
| name                |
| description         |
| price               |
| stock_quantity      |
| category            |
| added_date          |
+---------------------+

+---------------------+
|     Purchases       |
+---------------------+
| purchase_id (PK)    |
| client_id (FK)      |
| purchase_date       |
| purchase_status     |
| total_amount        |
| shipping_address    |
+---------------------+

+---------------------+
|  Purchase_Items     |
+---------------------+
| purchase_item_id (PK)|
| purchase_id (FK)    |
| item_id (FK)        |
| quantity            |
| unit_price          |
+---------------------+

+---------------------+
|   Transactions      |
+---------------------+
| transaction_id (PK) |
| purchase_id (FK)    |
| payment_method      |
| payment_date        |
| payment_amount      |
| payment_status      |
+---------------------+


