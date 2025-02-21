CREATE DATABASE BookStoreDB;
USE BookStoreDB;

-- Step 2: Create the Customers Table (This should be created first)
CREATE TABLE Clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 3: Create the Products Table
CREATE TABLE Items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    category VARCHAR(100),
    added_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 4: Create the Orders Table
CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    purchase_status VARCHAR(50),
    total_amount DECIMAL(10, 2),
    shipping_address VARCHAR(255),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

-- Step 5: Create the Purchase_Items Table
CREATE TABLE Purchase_Items (
    purchase_item_id INT PRIMARY KEY AUTO_INCREMENT,
    purchase_id INT,
    item_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (purchase_id) REFERENCES Purchases(purchase_id),
    FOREIGN KEY (item_id) REFERENCES Items(item_id)
);

-- Step 6: Create the Payments Table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    purchase_id INT,
    payment_method VARCHAR(50),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_amount DECIMAL(10, 2),
    payment_status VARCHAR(50),
    FOREIGN KEY (purchase_id) REFERENCES Purchases(purchase_id)
);

-- Step 7: Insert Sample Data

-- Insert clients
INSERT INTO Clients (first_name, last_name, email, phone, address, city, country)
VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '111-222-3333', '123 Maple St', 'Star City', 'USA'),
('Bob', 'Martinez', 'bob.martinez@example.com', '444-555-6666', '789 Pine Ave', 'Lakeside', 'USA');

-- Insert items (products)
INSERT INTO Items (name, description, price, stock_quantity, category)
VALUES
('Novel', 'A captivating mystery novel', 15.99, 50, 'Books'),
('Textbook', 'A comprehensive biology textbook', 49.99, 100, 'Books'),
('E-reader', 'A lightweight, portable e-reader', 89.99, 200, 'Electronics');

-- Step 8: Insert a purchase for a client (Assuming client_id = 1)
INSERT INTO Purchases (client_id, purchase_status, total_amount, shipping_address)
VALUES (1, 'Processing', 15.99, '123 Maple St, Star City, USA');

-- Insert items into the purchase (Assuming purchase_id = 1 and item_id = 1 (Novel) with quantity 1)
INSERT INTO Purchase_Items (purchase_id, item_id, quantity, unit_price)
VALUES (1, 1, 1, 15.99);

-- Step 9: Process the payment for the purchase (Assuming purchase_id = 1)
INSERT INTO Transactions (purchase_id, payment_method, payment_amount, payment_status)
VALUES (1, 'Credit Card', 15.99, 'Completed');

-- Step 10: Update stock quantity after a purchase (Assuming item_id = 1 (Novel) with quantity sold = 1)
UPDATE Items
SET stock_quantity = stock_quantity - 1
WHERE item_id = 1;

-- Step 11: Queries to view data

-- View all purchases for client 1 (Alice Johnson)
SELECT * FROM Purchases
WHERE client_id = 1;

-- View purchase details (Including items) for purchase_id 1
SELECT p.purchase_id, p.purchase_date, pi.item_id, i.name AS item_name, pi.quantity, pi.unit_price
FROM Purchases p
JOIN Purchase_Items pi ON p.purchase_id = pi.purchase_id
JOIN Items i ON pi.item_id = i.item_id
WHERE p.purchase_id = 1;

-- View payment details for purchase_id 1
SELECT t.transaction_id, t.payment_method, t.payment_amount, t.payment_status, t.payment_date
FROM Transactions t
WHERE t.purchase_id = 1;

-- View total sales for item_id 1 (Novel)
SELECT SUM(pi.quantity * pi.unit_price) AS total_sales
FROM Purchase_Items pi
WHERE pi.item_id = 1;

-- View all items in the store
SELECT * FROM Items;

-- View clients who have made a purchase
SELECT DISTINCT c.first_name, c.last_name, c.email
FROM Clients c
JOIN Purchases p ON c.client_id = p.client_id;